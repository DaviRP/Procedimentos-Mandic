#!/bin/zsh
#usuario: 36390877803
#senha: Fer010813
# Dois cliques neste arquivo abrem o App de Planos de Tratamento no Google Chrome.
# Na primeira vez, cria um ambiente Python próprio (.venv) e instala as bibliotecas.
cd "$(dirname "$0")"

PYTHON=".venv/bin/python3"

if ! "$PYTHON" -c "import openpyxl, selenium" 2>/dev/null; then
    echo "Preparando o ambiente do app (só na primeira vez)..."
    BASE=$(command -v python3 || echo /usr/bin/python3)
    "$BASE" -m venv .venv && "$PYTHON" -m pip install --quiet --upgrade pip && \
        "$PYTHON" -m pip install --quiet openpyxl selenium
    if ! "$PYTHON" -c "import openpyxl, selenium" 2>/dev/null; then
        echo
        echo "Não foi possível instalar as bibliotecas (openpyxl, selenium)."
        echo "Verifique a internet e tente de novo."
        read -k 1 "?Pressione qualquer tecla para fechar..."
        exit 1
    fi
fi

"$PYTHON" app/app_planos.py
STATUS=$?
if [ $STATUS -ne 0 ]; then
    echo
    echo "O app fechou com erro (código $STATUS). Veja a mensagem acima."
    read -k 1 "?Pressione qualquer tecla para fechar..."
    exit $STATUS
fi
# Fechado pelo botão "Fechar app" (saída normal): fecha também esta janela do Terminal
JANELA=$(tty)
nohup osascript -e "tell application \"Terminal\" to close (every window whose tty of selected tab is \"$JANELA\")" >/dev/null 2>&1 &
disown
exit 0
