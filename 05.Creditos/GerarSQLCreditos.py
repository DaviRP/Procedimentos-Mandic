"""
Gerador de script SQL para crédito de paciente em lote
(sp_criar_credito_paciente_faturamento_completo).

Lê o CSV de créditos em aberto e monta, para cada linha, uma chamada
`call sp_criar_credito_paciente_faturamento_completo(...)`, concatenando
tudo em um único arquivo .sql pronto para ser executado no banco.

Mapeamento de colunas do CSV -> parâmetros da procedure:
    p_tenant_id       -> valor fixo (config abaixo)
    p_valor           -> coluna "VALOR" (aceita vírgula ou ponto decimal)
    p_data_faturamento-> coluna "DATAEMISSAO" (já em AAAA-MM-DD)
    p_codpaciente     -> subselect em PACIENTE usando "PG" como numerocontrole
    p_codcliente      -> subselect PACIENTE -> CLIENTE_FORNECEDOR usando "PG"
    p_codconta        -> valor fixo (config abaixo)
    p_tipodocumento   -> sempre 'CARTEIRA'
    p_numerodocumento -> valor fixo (config abaixo)
    p_codcategoria    -> valor fixo (config abaixo)
    p_codtipopagamento-> valor fixo (config abaixo)

Colunas do CSV não utilizadas pela procedure: IDLAN, CODCFO, DATAVENCIMENTO.
"""

import csv
from datetime import datetime
from pathlib import Path

# =============================================================================
# CONFIGURAÇÃO — ajustar antes de rodar
# =============================================================================

ARQUIVO_CSV = "creditos.csv"
ARQUIVO_SAIDA = "Creditos_Insert.sql"
ENCODING_CSV = "utf-8"

TENANT_ID = 14567
CODCONTA = 25614
TIPODOCUMENTO = "CARTEIRA"
NUMERODOCUMENTO = "31232"
CODCATEGORIA = 616956
CODTIPOPAGAMENTO = 110649

# =============================================================================


def escapar_sql(valor: str) -> str:
    """Escapa aspas simples para uso seguro dentro de literais SQL."""
    return str(valor).replace("'", "''")


def normalizar_valor(valor_str: str) -> str:
    """Converte '351,3' -> '351.3'; mantém '696' como está."""
    return valor_str.strip().replace(",", ".")


def montar_call(linha: dict) -> str:
    pg = escapar_sql(linha["PG"].strip())
    valor = normalizar_valor(linha["VALOR"])
    data_faturamento = linha["DATAEMISSAO"].strip()

    return f"""call sp_criar_credito_paciente_faturamento_completo(
    {TENANT_ID},
    {valor},
    '{data_faturamento}',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '{pg}'
          AND p.tenant_id = {TENANT_ID}
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '{pg}'
              AND p.tenant_id = {TENANT_ID}
            LIMIT 1
        )
        LIMIT 1
    ),
    {CODCONTA},
    '{TIPODOCUMENTO}',
    '{NUMERODOCUMENTO}',
    {CODCATEGORIA},
    {CODTIPOPAGAMENTO},
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);"""


def main():
    pasta_script = Path(__file__).resolve().parent
    caminho_csv = pasta_script / ARQUIVO_CSV
    caminho_saida = pasta_script / ARQUIVO_SAIDA

    with caminho_csv.open(newline="", encoding=ENCODING_CSV) as f:
        leitor = csv.DictReader(f)
        linhas = list(leitor)

    blocos = []
    ignoradas = []

    for i, linha in enumerate(linhas, start=2):  # linha 1 = cabeçalho
        pg = (linha.get("PG") or "").strip()
        valor = (linha.get("VALOR") or "").strip()
        data = (linha.get("DATAEMISSAO") or "").strip()
        idlan = (linha.get("IDLAN") or "").strip()

        if not pg or not valor or not data:
            ignoradas.append((i, "campo obrigatório vazio (PG/VALOR/DATAEMISSAO)"))
            continue

        try:
            datetime.strptime(data, "%Y-%m-%d")
        except ValueError:
            ignoradas.append((i, f"data inválida: {data!r}"))
            continue

        try:
            float(normalizar_valor(valor))
        except ValueError:
            ignoradas.append((i, f"valor inválido: {valor!r}"))
            continue

        comentario = f"-- Linha {i} | PG {pg} | IDLAN {idlan}"
        blocos.append(f"{comentario}\n{montar_call(linha)}")

    cabecalho = (
        "-- Script gerado automaticamente por GerarSQLCreditos.py\n"
        f"-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        f"-- Total de chamadas: {len(blocos)} | Ignoradas: {len(ignoradas)}\n\n"
    )

    conteudo = cabecalho + "\n\n".join(blocos) + "\n"
    caminho_saida.write_text(conteudo, encoding="utf-8")

    print(f"Linhas lidas: {len(linhas)}")
    print(f"CALLs geradas: {len(blocos)}")
    print(f"Arquivo gerado: {caminho_saida.resolve()}")

    if ignoradas:
        print(f"\nLinhas ignoradas ({len(ignoradas)}):")
        for numero, motivo in ignoradas:
            print(f"  - linha {numero}: {motivo}")


if __name__ == "__main__":
    main()
