# Procedimentos Mandic

Script de automação para cadastro de grupos de equivalência no sistema **Clínica nas Nuvens**, utilizando dados de uma planilha Excel.

## O que faz

Lê a planilha `Grupos.xlsx`, abre o navegador via Selenium, faz login no sistema, seleciona a clínica configurada e cadastra automaticamente cada grupo de equivalência com seus respectivos produtos. Ao final de cada cadastro, marca a linha na planilha como `cadastrado` para evitar reprocessamento.

## Estrutura

```
ProcedimentosMandic.py   # Script principal
Grupos.xlsx              # Planilha de entrada com os grupos e produtos
CNN.xlsx                 # Planilha auxiliar (dados da Clínica nas Nuvens)
```

## Planilha `Grupos.xlsx`

Colunas obrigatórias:

| Coluna                  | Descrição                          |
|-------------------------|------------------------------------|
| `Grupo de equivalência` | Nome do grupo a ser cadastrado     |
| `Numero Fabricante 2`   | Código do produto                  |
| `Nome do produto 3`     | Nome do produto (usado no autocomplete) |
| `Status`                | Criada automaticamente; valor `cadastrado` pula a linha |

## Configuração

No topo do script:

```python
ARQUIVO = "Grupos.xlsx"   # Caminho da planilha
CLINICA = "ARARAS - GRUPO MANDIC"  # Nome exato da clínica no sistema
```

## Como executar

```bash
pip install openpyxl selenium
python ProcedimentosMandic.py
```

Requer **ChromeDriver** instalado e compatível com a versão do Chrome.

## Comportamento em caso de erro

O script reinicia automaticamente após 10 segundos em caso de qualquer exceção, retomando do ponto onde parou (grupos sem status `cadastrado`).

## Observações

- Produtos não encontrados no autocomplete são pulados com aviso no terminal.
- O terminal exibe progresso, tempo médio por grupo e ETA para conclusão.
- A janela do Chrome abre fora da tela (`--window-position=-32000,-32000`) para não interferir com o uso do computador.
