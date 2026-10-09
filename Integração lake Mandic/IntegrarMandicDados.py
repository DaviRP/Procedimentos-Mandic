r"""
Envia os CSVs da pasta ./dados_csv para o Data Lake da São Leopoldo Mandic (GCS),
seguindo o guia "instrucoes_envio_dados_cnn.pdf" e as regras passadas pela Mandic:

  - formato Parquet, mesmo schema em todas as cargas (todas as colunas string
    + ingestion_timestamp_raw em TIMESTAMP UTC, precisão de microssegundos)
  - caminho cnn/{tabela}/partition_year=YYYY/partition_month=MM/partition_day=DD/
    (a data da partição é a da CARGA)
  - arquivo data_batch_{n}_{YYYYMMDDTHHMMSS}.parquet, nunca reenviando o mesmo nome
    (a conta só cria: não lê, não lista, não sobrescreve e não apaga)
  - coluna ingestion_timestamp_raw = momento da EXTRAÇÃO na origem (mesmo valor no arquivo)

Uso (macOS/Linux):
  export GOOGLE_APPLICATION_CREDENTIALS=/caminho/service_account.json
  python IntegrarMandicDados.py --extraido-em 2026-10-07T13:11      # envia tudo
  python IntegrarMandicDados.py --dry-run                            # só gera em ./saida_parquet
  python IntegrarMandicDados.py --only agendamentos pacientes

Se GOOGLE_APPLICATION_CREDENTIALS não estiver definida, usa o .json da conta de serviço
que estiver nesta pasta. Bucket padrão: slmandic-dataplatform-cnn-raw (ou GCS_BUCKET).
"""
import argparse
import datetime
import os
import re
import sys
import unicodedata
from pathlib import Path

import pandas as pd
import pyarrow as pa

BASE_DIR = Path(__file__).resolve().parent
CSV_DIR = BASE_DIR / "dados_csv"
PREFIX_ARQUIVO = "view_bi_mandic_"
PREFIX_BUCKET = "cnn"
BUCKET_PADRAO = "slmandic-dataplatform-cnn-raw"
PROJETO_GCP = "slmandic-datalake-hml"

# Arquivos que não devem ser enviados (exportações duplicadas/avulsas)
IGNORAR: set[str] = set()
IGNORAR_PREFIXOS = ("query_result_",)

# Correções de cabeçalho conhecidas
RENOMEAR_COLUNAS = {
    "faturas_movimentos": {"id_clinicaview_bi_mandic_faturas_movimentos": "id_clinica"},
}


def nome_tabela(csv: Path) -> str:
    nome = csv.stem
    if nome.startswith(PREFIX_ARQUIVO):
        nome = nome[len(PREFIX_ARQUIVO):]
    # minúsculas, sem acento, "_" no lugar de espaços/símbolos
    nome = unicodedata.normalize("NFKD", nome).encode("ascii", "ignore").decode()
    return re.sub(r"[^a-z0-9]+", "_", nome.lower()).strip("_")


def utc_sem_tz(dt: datetime.datetime) -> datetime.datetime:
    if dt.tzinfo is None:
        dt = dt.astimezone()  # hora local da máquina
    return dt.astimezone(datetime.timezone.utc).replace(tzinfo=None, microsecond=0)


def timestamp_extracao(csv: Path, informado: datetime.datetime | None) -> datetime.datetime:
    if informado is not None:
        return informado
    # Sem --extraido-em: última modificação do CSV (muda se o arquivo for copiado!)
    return utc_sem_tz(datetime.datetime.fromtimestamp(csv.stat().st_mtime).astimezone())


def ler_csv(csv: Path, tabela: str) -> pd.DataFrame:
    # Tudo como string: a exportação traz IDs com separador de milhar ("135.444.511"),
    # datas por extenso ("agosto 28, 2026") e horas em AM/PM. A tipagem fica para a camada trusted.
    df = pd.read_csv(csv, dtype=str, keep_default_na=False, na_values=[""], encoding="utf-8-sig")
    # Remove colunas sem nome (vírgula sobrando no fim do cabeçalho)
    df = df.loc[:, [c for c in df.columns if c.strip() and not c.startswith("Unnamed:")]]
    df = df.rename(columns=RENOMEAR_COLUNAS.get(tabela, {}))
    df.columns = [c.strip() for c in df.columns]
    return df.astype("string")


def destino(tabela: str, carga: datetime.datetime, lote: int) -> str:
    particao = (
        f"partition_year={carga.year}/"
        f"partition_month={carga.month:02d}/"
        f"partition_day={carga.day:02d}"
    )
    arquivo = f"data_batch_{lote}_{carga.strftime('%Y%m%dT%H%M%S')}.parquet"
    return f"{PREFIX_BUCKET}/{tabela}/{particao}/{arquivo}"


def listar_csvs(only: list[str] | None) -> list[Path]:
    csvs = []
    for csv in sorted(CSV_DIR.glob("*.csv")):
        if csv.name in IGNORAR or csv.name.startswith(IGNORAR_PREFIXOS):
            print(f"[ignorado] {csv.name}")
            continue
        if only and nome_tabela(csv) not in only:
            continue
        csvs.append(csv)
    return csvs


def cliente_gcs():
    from google.cloud import storage
    from google.oauth2 import service_account

    if "GCP_SERVICE_ACCOUNT_JSON" in os.environ:
        import json
        info = json.loads(os.environ["GCP_SERVICE_ACCOUNT_JSON"])
        creds = service_account.Credentials.from_service_account_info(info)
        return storage.Client(credentials=creds, project=info.get("project_id"))
    if "GOOGLE_APPLICATION_CREDENTIALS" not in os.environ:
        chaves = sorted(BASE_DIR.glob(f"{PROJETO_GCP}-*.json"))
        if chaves:
            creds = service_account.Credentials.from_service_account_file(str(chaves[0]))
            return storage.Client(credentials=creds, project=PROJETO_GCP)
    return storage.Client(project=PROJETO_GCP)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true", help="gera os parquet em ./saida_parquet sem enviar")
    ap.add_argument("--only", nargs="*", help="nomes de tabela (sem o prefixo view_bi_mandic_)")
    ap.add_argument("--extraido-em", type=datetime.datetime.fromisoformat,
                    help="momento da exportação na origem, ISO (ex.: 2026-10-07T13:11; sem fuso = hora local)")
    args = ap.parse_args()

    extraido_em = utc_sem_tz(args.extraido_em) if args.extraido_em else None
    if extraido_em is None:
        print("[aviso] --extraido-em não informado: usando a data de modificação de cada CSV.")

    bucket = None
    if not args.dry_run:
        # bucket() em vez de get_bucket(): a conta só tem objects.create, sem buckets.get
        bucket = cliente_gcs().bucket(os.environ.get("GCS_BUCKET", BUCKET_PADRAO))

    # Um timestamp de carga por execução: define a partição e garante nome de arquivo único
    carga = utc_sem_tz(datetime.datetime.now(datetime.timezone.utc))
    saida = BASE_DIR / "saida_parquet"
    erros = 0
    for csv in listar_csvs(args.only):
        tabela = nome_tabela(csv)
        try:
            df = ler_csv(csv, tabela)
            df["ingestion_timestamp_raw"] = pd.Series(
                pd.Timestamp(timestamp_extracao(csv, extraido_em)), index=df.index, dtype="datetime64[us]"
            )
            caminho = destino(tabela, carga, lote=0)

            local = saida / caminho
            local.parent.mkdir(parents=True, exist_ok=True)
            # Schema explícito: não depende da versão do pandas nem de colunas vazias
            schema = pa.schema(
                [(c, pa.string()) for c in df.columns if c != "ingestion_timestamp_raw"]
                + [("ingestion_timestamp_raw", pa.timestamp("us"))]
            )
            df.to_parquet(local, index=False, engine="pyarrow", schema=schema)

            if bucket is not None:
                # if_generation_match=0: falha em vez de sobrescrever se o objeto já existir
                bucket.blob(caminho).upload_from_filename(str(local), if_generation_match=0)
                print(f"[enviado] {len(df):>7} linhas -> gs://{bucket.name}/{caminho}")
            else:
                print(f"[dry-run] {len(df):>7} linhas -> {local.relative_to(BASE_DIR)}")
        except Exception as e:
            erros += 1
            print(f"[ERRO] {csv.name}: {e}", file=sys.stderr)

    return 1 if erros else 0


if __name__ == "__main__":
    sys.exit(main())
