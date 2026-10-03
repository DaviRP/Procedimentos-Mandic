"""
Gerador de script SQL para crédito de paciente em lote
(sp_criar_credito_paciente_faturamento_completo).

Lê os créditos em aberto e monta, para cada linha, uma chamada
`call sp_criar_credito_paciente_faturamento_completo(...)`, concatenando
tudo em um único arquivo .sql pronto para ser executado no banco.

Entrada (ARQUIVO_ENTRADA):
  - .xlsx no formato do Modelo_Creditos.xlsx (padrão): créditos na aba
    "Creditos" e os valores fixos na aba "Configuração" (substituem os da
    config abaixo quando preenchidos).
  - .csv com as colunas PG, VALOR, DATAEMISSAO, IDLAN (usa a config abaixo).
    Aceita separador `,` ou `;`, UTF-8 ou ANSI.

Mapeamento de colunas -> parâmetros da procedure:
    p_tenant_id       -> Configuração: Tenant ID
    p_valor           -> coluna "VALOR" (aceita vírgula ou ponto decimal)
    p_data_faturamento-> coluna "DATAEMISSAO" (DD/MM/AAAA ou AAAA-MM-DD)
    p_codpaciente     -> subselect em PACIENTE usando "PG" como numerocontrole
    p_codcliente      -> subselect PACIENTE -> CLIENTE_FORNECEDOR usando "PG"
    p_codconta        -> Configuração: Conta (codconta)
    p_tipodocumento   -> Configuração: Tipo de documento (padrão 'CARTEIRA')
    p_numerodocumento -> Configuração: Número do documento
    p_codcategoria    -> Configuração: Categoria (codcategoria)
    p_codtipopagamento-> Configuração: Tipo de pagamento (codtipopagamento)

IDLAN é opcional e só aparece no comentário de cada chamada (rastreio).

Como usar:
    1. Preencha o Modelo_Creditos.xlsx (abas Configuração e Creditos).
    2. Rode `python GerarSQLCreditos.py` e execute o `Creditos_Insert.sql` gerado.
"""

import csv
from datetime import date, datetime
from pathlib import Path

# =============================================================================
# CONFIGURAÇÃO — ajustar antes de rodar
# =============================================================================

ARQUIVO_ENTRADA = "Modelo_Creditos_GrandeVitoria.xlsx"  # .xlsx do modelo ou .csv
ARQUIVO_SAIDA = "Creditos_Insert.sql"

# Usados para .csv, ou quando a aba Configuração do .xlsx estiver vazia
TENANT_ID = 14551
CODCONTA = 25740
TIPODOCUMENTO = "CARTEIRA"
NUMERODOCUMENTO = "31232"
CODCATEGORIA = 616956
CODTIPOPAGAMENTO = 110649

# =============================================================================

COLUNAS = ("PG", "VALOR", "DATAEMISSAO", "IDLAN")

# Aba Configuração do modelo: célula -> chave da config
CELULAS_CONFIG = {
    "B5": "TENANT_ID",
    "B6": "CODCONTA",
    "B7": "TIPODOCUMENTO",
    "B8": "NUMERODOCUMENTO",
    "B9": "CODCATEGORIA",
    "B10": "CODTIPOPAGAMENTO",
}


def escapar_sql(valor: str) -> str:
    """Escapa aspas simples para uso seguro dentro de literais SQL."""
    return str(valor).replace("'", "''")


def normalizar_valor(valor_str: str) -> str:
    """Converte '351,3' -> '351.3'; mantém '696' como está."""
    return valor_str.strip().replace(",", ".")


def normalizar_data(data_str: str) -> str:
    """Converte '13/07/2021' ou '2021-07-13' -> '2021-07-13'. Lança ValueError se inválida."""
    data_str = data_str.strip()
    for formato in ("%Y-%m-%d", "%d/%m/%Y"):
        try:
            return datetime.strptime(data_str, formato).strftime("%Y-%m-%d")
        except ValueError:
            pass
    raise ValueError(data_str)


def _texto_celula(valor) -> str:
    """Valor de célula do Excel -> texto no mesmo formato que viria de um CSV."""
    if valor is None:
        return ""
    if isinstance(valor, (datetime, date)):
        return valor.strftime("%Y-%m-%d")
    if isinstance(valor, float) and valor.is_integer():
        return str(int(valor))
    return str(valor).strip()


def config_padrao() -> dict:
    return {
        "TENANT_ID": TENANT_ID,
        "CODCONTA": CODCONTA,
        "TIPODOCUMENTO": TIPODOCUMENTO,
        "NUMERODOCUMENTO": NUMERODOCUMENTO,
        "CODCATEGORIA": CODCATEGORIA,
        "CODTIPOPAGAMENTO": CODTIPOPAGAMENTO,
    }


def ler_csv(caminho: Path):
    """Lê o CSV aceitando UTF-8 (com/sem BOM) ou ANSI, e separador ',' ou ';'."""
    try:
        texto = caminho.read_text(encoding="utf-8-sig")
    except UnicodeDecodeError:
        texto = caminho.read_text(encoding="cp1252")

    primeira_linha = texto.splitlines()[0] if texto else ""
    separador = ";" if primeira_linha.count(";") > primeira_linha.count(",") else ","

    leitor = csv.DictReader(texto.splitlines(), delimiter=separador)
    linhas = [{(k or "").strip(): (v or "") for k, v in linha.items()} for linha in leitor]
    return linhas, config_padrao()


def ler_xlsx(caminho: Path):
    """Lê o Modelo_Creditos.xlsx: créditos da aba Creditos + config da aba Configuração."""
    import openpyxl

    wb = openpyxl.load_workbook(caminho, data_only=True)

    config = config_padrao()
    if "Configuração" in wb.sheetnames:
        aba_config = wb["Configuração"]
        for celula, chave in CELULAS_CONFIG.items():
            valor = _texto_celula(aba_config[celula].value)
            if valor:
                config[chave] = valor

    aba = wb["Creditos"]
    cabecalho = [_texto_celula(c.value) for c in aba[1]]
    faltando = [c for c in COLUNAS if c not in cabecalho]
    if faltando:
        raise SystemExit(f"Colunas não encontradas na aba Creditos: {faltando} (não renomeie o cabeçalho do modelo)")
    indices = {c: cabecalho.index(c) for c in COLUNAS}

    linhas = []
    for valores in aba.iter_rows(min_row=2, values_only=True):
        linha = {c: _texto_celula(valores[i]) for c, i in indices.items()}
        if not any(linha.values()):
            continue  # linha vazia do modelo
        linhas.append(linha)
    wb.close()
    return linhas, config


def montar_call(linha: dict, config: dict) -> str:
    pg = escapar_sql(linha["PG"].strip())
    valor = normalizar_valor(linha["VALOR"])
    data_faturamento = linha["DATAEMISSAO"].strip()
    tenant = config["TENANT_ID"]

    return f"""call sp_criar_credito_paciente_faturamento_completo(
    {tenant},
    {valor},
    '{data_faturamento}',
    (
        SELECT p.codpaciente
        FROM PACIENTE p
        WHERE p.numerocontrole = '{pg}'
          AND p.tenant_id = {tenant}
        LIMIT 1
    ),
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '{pg}'
              AND p.tenant_id = {tenant}
            LIMIT 1
        )
        LIMIT 1
    ),
    {config['CODCONTA']},
    '{escapar_sql(config['TIPODOCUMENTO'])}',
    '{escapar_sql(config['NUMERODOCUMENTO'])}',
    {config['CODCATEGORIA']},
    {config['CODTIPOPAGAMENTO']},
    @pai_id, @fat_id, @pai_id_rec, @fat_id_rec, @mov_id_rec, @lanc_id
);"""


def main():
    pasta_script = Path(__file__).resolve().parent
    caminho_entrada = pasta_script / ARQUIVO_ENTRADA
    caminho_saida = pasta_script / ARQUIVO_SAIDA

    if caminho_entrada.suffix.lower() == ".xlsx":
        linhas, config = ler_xlsx(caminho_entrada)
    else:
        linhas, config = ler_csv(caminho_entrada)

    # Campos numéricos da config precisam ser números (vão sem aspas no SQL)
    for chave in ("TENANT_ID", "CODCONTA", "CODCATEGORIA", "CODTIPOPAGAMENTO"):
        try:
            config[chave] = int(str(config[chave]).strip())
        except ValueError:
            raise SystemExit(f"Configuração inválida: {chave} = {config[chave]!r} (precisa ser número inteiro)")

    print("Configuração usada:")
    for chave, valor in config.items():
        print(f"  {chave}: {valor}")

    blocos = []
    ignoradas = []
    idlans_vistos = {}

    for i, linha in enumerate(linhas, start=2):  # linha 1 = cabeçalho
        pg = (linha.get("PG") or "").strip()
        valor = (linha.get("VALOR") or "").strip()
        data = (linha.get("DATAEMISSAO") or "").strip()
        idlan = (linha.get("IDLAN") or "").strip()

        if not pg or not valor or not data:
            ignoradas.append((i, "campo obrigatório vazio (PG/VALOR/DATAEMISSAO)"))
            continue

        try:
            linha["DATAEMISSAO"] = normalizar_data(data)
        except ValueError:
            ignoradas.append((i, f"data inválida: {data!r}"))
            continue

        try:
            if float(normalizar_valor(valor)) <= 0:
                ignoradas.append((i, f"valor deve ser maior que zero: {valor!r}"))
                continue
        except ValueError:
            ignoradas.append((i, f"valor inválido: {valor!r}"))
            continue

        if idlan:
            if not idlan.isdigit():
                ignoradas.append((i, f"IDLAN deve ser número inteiro: {idlan!r}"))
                continue
            if idlan in idlans_vistos:
                ignoradas.append((i, f"IDLAN {idlan} repetido (já usado na linha {idlans_vistos[idlan]})"))
                continue
            idlans_vistos[idlan] = i

        comentario = f"-- Linha {i} | PG {pg} | IDLAN {idlan}"
        blocos.append(f"{comentario}\n{montar_call(linha, config)}")

    cabecalho = (
        "-- Script gerado automaticamente por GerarSQLCreditos.py\n"
        f"-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
        f"-- Entrada: {caminho_entrada.name} | Tenant: {config['TENANT_ID']}\n"
        f"-- Total de chamadas: {len(blocos)} | Ignoradas: {len(ignoradas)}\n\n"
    )

    conteudo = cabecalho + "\n\n".join(blocos) + "\n"
    caminho_saida.write_text(conteudo, encoding="utf-8")

    print(f"\nLinhas lidas: {len(linhas)}")
    print(f"CALLs geradas: {len(blocos)}")
    print(f"Arquivo gerado: {caminho_saida.resolve()}")

    if ignoradas:
        print(f"\nLinhas ignoradas ({len(ignoradas)}):")
        for numero, motivo in ignoradas:
            print(f"  - linha {numero}: {motivo}")


if __name__ == "__main__":
    main()
