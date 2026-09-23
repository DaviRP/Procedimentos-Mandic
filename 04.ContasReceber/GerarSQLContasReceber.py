"""
Gerador de script SQL para faturamento em lote (sp_criar_faturamento_completo).

Lê a planilha/CSV de títulos em aberto e monta, para cada linha, uma chamada
`CALL sp_criar_faturamento_completo(...)`, concatenando tudo em um único
arquivo .sql pronto para ser executado no banco.

Mapeamento de colunas do CSV -> parâmetros da procedure:
    p_tenant_id        -> valor fixo (config abaixo)
    p_valor            -> coluna "Valor"
    p_data_faturamento -> coluna "Data" (DD/MM/AAAA -> AAAA-MM-DD)
    p_codcliente       -> subselect usando a coluna "PG" como numerocontrole
    p_codconta         -> valor fixo (config abaixo)
    p_numerodocumento  -> valor fixo (config abaixo)
    p_tipodocumento    -> sempre 'CARTAO_DEBITO'
    p_descricao        -> coluna "nome"
    p_codcategoria     -> valor fixo (config abaixo)
    p_idtotvs          -> coluna "IDLAN"
    p_idcoligadatotvs  -> valor fixo (config abaixo)
"""

import csv
from datetime import datetime
from pathlib import Path

# =============================================================================
# CONFIGURAÇÃO — ajustar antes de rodar
# =============================================================================

ARQUIVO_CSV = "TitulosEmAbertoUndFortaleza 1 (TitulosEmAbertoUndFortaleza).csv"
ARQUIVO_SAIDA = "ContasReceber_Insert.sql"
ENCODING_CSV = "latin-1"  # o arquivo original não é UTF-8

TENANT_ID = 14567
CODCONTA = 25745
NUMERODOCUMENTO = "31232"
CODCATEGORIA = 616956
IDCOLIGADATOTVS = "1"
TIPODOCUMENTO = "CARTAO_DEBITO"

# =============================================================================


def escapar_sql(valor: str) -> str:
    """Escapa aspas simples para uso seguro dentro de literais SQL."""
    return str(valor).replace("'", "''")


def converter_data(data_str: str) -> str:
    """Converte DD/MM/AAAA -> AAAA-MM-DD."""
    return datetime.strptime(data_str.strip(), "%d/%m/%Y").strftime("%Y-%m-%d")


def montar_call(linha: dict) -> str:
    pg = escapar_sql(linha["PG"].strip())
    valor = linha["Valor"].strip()
    data_faturamento = converter_data(linha["Data"])
    descricao = escapar_sql(linha["nome"].strip())
    idtotvs = linha["IDLAN"].strip()

    return f"""CALL sp_criar_faturamento_completo(
    {TENANT_ID},
    {valor},
    '{data_faturamento}',
    (
        SELECT cf.codpessoa
        FROM CLIENTE_FORNECEDOR cf
        WHERE cf.codpessoa_fk = (
            SELECT p.codpessoa_fk
            FROM PACIENTE p
            WHERE p.numerocontrole = '{pg}'
              AND p.tenant_id = {TENANT_ID}
        )
    ),
    {CODCONTA},
    '{NUMERODOCUMENTO}',
    '{TIPODOCUMENTO}',
    '{descricao}',
    {CODCATEGORIA},
    {idtotvs},
    '{IDCOLIGADATOTVS}',
    @pai_id,
    @fat_id
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
        valor = (linha.get("Valor") or "").strip()
        data = (linha.get("Data") or "").strip()
        nome = (linha.get("nome") or "").strip()
        idlan = (linha.get("IDLAN") or "").strip()

        if not pg or not valor or not data or not nome or not idlan:
            ignoradas.append((i, "campo obrigatório vazio (PG/Valor/Data/nome/IDLAN)"))
            continue

        try:
            converter_data(data)
        except ValueError:
            ignoradas.append((i, f"data inválida: {data!r}"))
            continue

        try:
            float(valor.replace(",", "."))
        except ValueError:
            ignoradas.append((i, f"valor inválido: {valor!r}"))
            continue

        comentario = f"-- Linha {i} | PG {pg} | {nome}"
        blocos.append(f"{comentario}\n{montar_call(linha)}")

    cabecalho = (
        "-- Script gerado automaticamente por GerarSQLContasReceber.py\n"
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
