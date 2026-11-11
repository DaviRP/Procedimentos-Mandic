"""Monta o pacote do App de Planos de Tratamento para entregar a outra pessoa.

Gera dist/Planos de Tratamento/ (e o .zip) com:

    Planos de Tratamento/
        Abrir App Planos (Windows).bat   <- duplo clique no Windows
        Abrir App Planos (Mac).command   <- duplo clique no Mac
        LEIA-ME.txt
        app/      código do app (não mexer)
        python/   Python portátil para Windows, já com openpyxl e selenium
        dados/    banco, catálogo, importações, relatórios e prints de erro

No Windows não é preciso instalar Python nem bibliotecas: tudo vai em python/.
Só o Google Chrome precisa estar instalado. O chromedriver certo para o Chrome
da máquina é baixado sozinho pelo Selenium na primeira integração.

O pacote tem a mesma estrutura do projeto (app/ e dados/), mais o python/.

Uso (no Mac, na pasta do projeto, com o .venv dele):
    .venv/bin/python3 ferramentas/empacotar.py              # leva o banco atual junto
    .venv/bin/python3 ferramentas/empacotar.py --sem-banco  # começa com o banco vazio
"""
import argparse
import json
import shutil
import subprocess
import sys
import urllib.request
import zipfile
from pathlib import Path

PROJETO = Path(__file__).resolve().parent.parent
PASTA_APP = PROJETO / "app"
PASTA_DADOS = PROJETO / "dados"
DIST = PROJETO / "dist"
CACHE = DIST / "_cache"
NOME = "Planos de Tratamento"

PYTHON_VERSAO = "3.14.7"  # a mesma usada no desenvolvimento
PYTHON_ZIP = f"python-{PYTHON_VERSAO}-embed-amd64.zip"
PYTHON_URL = f"https://www.python.org/ftp/python/{PYTHON_VERSAO}/{PYTHON_ZIP}"
BIBLIOTECAS = ["openpyxl==3.1.5", "selenium==4.51.0"]  # versões testadas
# O pip avalia as condições "só no Windows" pela máquina que monta o pacote (Mac):
# dependências exclusivas do Windows entram aqui explicitamente
SO_WINDOWS = ["cffi>=1.14"]  # exigido pelo trio (usado pelo selenium) quando os.name == "nt"

ARQUIVOS_APP = ["app_planos.py", "Plano de tratamento.py", "TransformadorDePlanos.py", "cofre.py", "agendamentos.py", "odontosig.py", "cnn_agenda.py",
                "web/index.html"]
BANCO = "Banco de Planos de Tratamento.xlsx"

BAT = r"""@echo off
setlocal
cd /d "%~dp0"
title Planos de Tratamento
chcp 65001 >nul

if not exist "python\python.exe" (
    echo.
    echo  Nao encontrei a pasta "python".
    echo  Extraia o ZIP inteiro numa pasta antes de abrir: botao direito no ZIP, "Extrair tudo...".
    echo.
    pause
    exit /b 1
)

set "CHROME="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set CHROME=1
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set CHROME=1
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set CHROME=1
if not defined CHROME (
    echo.
    echo  AVISO: o Google Chrome nao foi encontrado neste computador.
    echo  O app abre, mas a integracao com o Clinica nas Nuvens precisa do Chrome.
    echo  Instale em https://www.google.com/chrome
    echo.
)

set "PLANOS_DADOS=%~dp0dados"
set PYTHONUTF8=1
set PYTHONDONTWRITEBYTECODE=1
echo  Abrindo o App de Planos de Tratamento...
echo  Deixe esta janela aberta enquanto usa o app. Para fechar o app, feche esta janela.
echo.
"python\python.exe" -X utf8 "app\app_planos.py"
if errorlevel 1 (
    echo.
    echo  O app fechou com erro. Tire um print desta janela e envie para o suporte.
    pause
)
"""

COMMAND = """#!/bin/zsh
# Dois cliques neste arquivo abrem o App de Planos de Tratamento no Google Chrome (Mac).
# Na primeira vez, cria um ambiente Python próprio (.venv) e instala as bibliotecas.
cd "$(dirname "$0")"
export PLANOS_DADOS="$PWD/dados"
PYTHON=".venv/bin/python3"

if ! "$PYTHON" -c "import openpyxl, selenium" 2>/dev/null; then
    echo "Preparando o ambiente do app (só na primeira vez)..."
    BASE=$(command -v python3 || echo /usr/bin/python3)
    "$BASE" -m venv .venv && "$PYTHON" -m pip install --quiet --upgrade pip && \\
        "$PYTHON" -m pip install --quiet -r app/requirements.txt
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
nohup osascript -e "tell application \\"Terminal\\" to close (every window whose tty of selected tab is \\"$JANELA\\")" >/dev/null 2>&1 &
disown
exit 0
"""

LEIA_ME = """APP DE PLANOS DE TRATAMENTO
===========================

Converte orçamentos do sistema antigo em planos de tratamento e cadastra/autoriza
esses planos no Clínica nas Nuvens.


ANTES DE COMEÇAR
----------------
1. Tenha o Google Chrome instalado (https://www.google.com/chrome).
2. Extraia o ZIP inteiro numa pasta fixa, por exemplo em Documentos.
   No Windows: botão direito no ZIP > "Extrair tudo...".
   Não abra o app de dentro do ZIP.

Não é preciso instalar Python nem nenhum outro programa no Windows.


COMO ABRIR
----------
Windows: dois cliques em "Abrir App Planos (Windows).bat".
Mac:     dois cliques em "Abrir App Planos (Mac).command".

Abre uma janela preta e, em seguida, o app no Chrome.
Deixe a janela preta aberta enquanto usa o app: fechar essa janela fecha o app.

Na primeira vez, o Windows pode avisar "O Windows protegeu o computador".
Clique em "Mais informações" e depois em "Executar assim mesmo".


ONDE FICAM OS DADOS
-------------------
Tudo o que o app grava fica na pasta "dados":
  Banco de Planos de Tratamento.xlsx  o banco com todos os planos
  catalogos/    planilhas de procedimentos, grupos e produtos
  importados/   cópia de cada planilha importada
  conversoes/   relatório de cada conversão
  erros/        prints das telas quando a integração falha
  backups/      cópias automáticas do banco (ao abrir, importar e integrar)
  logs/         histórico de tudo o que o robô gravou

Para fazer backup, copie a pasta "dados".
Para atualizar o app para uma versão nova, troque as outras pastas e mantenha "dados".


CUIDADOS
--------
- Feche o banco no Excel enquanto usa o app. Com o banco aberto no Excel, o app
  mostra um aviso e não grava nada, para o Excel não apagar o que o app gravou.
- Se o banco estragar ou sumir, há cópias automáticas em dados/backups.
- Rode uma integração por vez.
- O usuário e a senha do Clínica nas Nuvens e a senha do desconto de cada unidade
  são digitados na tela Integrar. Com "Lembrar login e senhas" ligado, eles ficam
  guardados com a proteção do Windows: só o seu usuário, neste computador, consegue
  abri-los. Para apagar, use "Esquecer" na mesma tela.
- Na primeira integração, o computador precisa de internet para baixar o
  componente que controla o Chrome (é automático e leva alguns segundos).


PROBLEMAS COMUNS
----------------
"Não encontrei a pasta python": o ZIP não foi extraído. Veja "Antes de começar".
"O banco está aberto no Excel": feche a planilha e tente de novo.
A integração não abre o Chrome: atualize o Chrome e confira a internet.
  Em rede de empresa, o bloqueio pode ser do proxy ou do firewall.
"""


def baixar(url, destino):
    if not destino.exists():
        print(f"Baixando {url} ...")
        CACHE.mkdir(parents=True, exist_ok=True)
        with urllib.request.urlopen(url) as r, open(destino.with_suffix(".parcial"), "wb") as f:
            shutil.copyfileobj(r, f)
        destino.with_suffix(".parcial").rename(destino)
    return destino


def montar_python(destino):
    """Python portátil (embeddable) do Windows + bibliotecas compiladas para Windows."""
    with zipfile.ZipFile(baixar(PYTHON_URL, CACHE / PYTHON_ZIP)) as z:
        z.extractall(destino)

    # O ._pth define o sys.path do Python portátil: site-packages e a pasta do app
    pth = next(destino.glob("python3*._pth"))
    zip_padrao = next(destino.glob("python3*.zip")).name
    pth.write_text(f"{zip_padrao}\n.\nLib\\site-packages\n..\\app\nimport site\n", encoding="utf-8")

    site = destino / "Lib" / "site-packages"
    maior, menor = PYTHON_VERSAO.split(".")[:2]
    subprocess.run([sys.executable, "-m", "pip", "install", "--quiet", "--no-compile", "--target", str(site),
                    "--platform", "win_amd64", "--python-version", f"{maior}.{menor}", "--implementation", "cp",
                    "--only-binary=:all:", *BIBLIOTECAS, *SO_WINDOWS], check=True)

    # O selenium traz o selenium-manager de Linux e Mac também: no Windows só serve o .exe
    for so in ("linux", "macos"):
        shutil.rmtree(site / "selenium" / "webdriver" / "common" / so, ignore_errors=True)
    for cache in site.rglob("__pycache__"):
        shutil.rmtree(cache, ignore_errors=True)
    if not (site / "selenium" / "webdriver" / "common" / "windows" / "selenium-manager.exe").is_file():
        raise SystemExit("selenium-manager.exe não veio no pacote do selenium.")


def montar_dados(destino, levar_banco):
    sys.path.insert(0, str(PASTA_APP))
    from app_planos import catalogo_ativo  # usa a configuração atual do app

    (destino / "catalogos").mkdir(parents=True)
    config = {}
    catalogo = catalogo_ativo()
    if catalogo:
        shutil.copy2(catalogo, destino / "catalogos" / Path(catalogo).name)
        config["catalogo_ativo"] = f"catalogos/{Path(catalogo).name}"
        print(f"Catálogo: {Path(catalogo).name}")
    else:
        print("AVISO: nenhum catálogo ativo — a pessoa vai precisar carregar um na tela Catálogo.")
    (destino / "app_config.json").write_text(json.dumps(config, ensure_ascii=False, indent=2), encoding="utf-8")

    if levar_banco and (PASTA_DADOS / BANCO).exists():
        shutil.copy2(PASTA_DADOS / BANCO, destino / BANCO)
        print(f"Banco: {BANCO} (com os planos atuais)")
    else:
        print("Banco: vazio (o app cria um novo na primeira importação)")


def main():
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    parser.add_argument("--sem-banco", action="store_true", help="não leva o banco atual (começa vazio)")
    args = parser.parse_args()

    raiz = DIST / NOME
    if raiz.exists():
        shutil.rmtree(raiz)
    (raiz / "app" / "web").mkdir(parents=True)

    for arq in ARQUIVOS_APP:
        shutil.copy2(PASTA_APP / arq, raiz / "app" / arq)
    (raiz / "app" / "requirements.txt").write_text("\n".join(BIBLIOTECAS) + "\n", encoding="utf-8")

    montar_python(raiz / "python")
    montar_dados(raiz / "dados", levar_banco=not args.sem_banco)

    # .bat com quebra de linha do Windows; LEIA-ME com BOM para o Bloco de Notas mostrar os acentos
    (raiz / "Abrir App Planos (Windows).bat").write_bytes(BAT.replace("\n", "\r\n").encode("utf-8"))
    mac = raiz / "Abrir App Planos (Mac).command"
    mac.write_text(COMMAND, encoding="utf-8")
    mac.chmod(0o755)
    (raiz / "LEIA-ME.txt").write_bytes(LEIA_ME.replace("\n", "\r\n").encode("utf-8-sig"))

    arquivo_zip = DIST / f"{NOME}.zip"
    arquivo_zip.unlink(missing_ok=True)
    with zipfile.ZipFile(arquivo_zip, "w", zipfile.ZIP_DEFLATED) as z:
        for arq in sorted(raiz.rglob("*")):
            if arq.name == ".DS_Store":
                continue
            info = zipfile.ZipInfo.from_file(arq, arq.relative_to(DIST).as_posix())
            if arq.is_dir():
                z.writestr(info, "")
            else:
                z.writestr(info, arq.read_bytes(), zipfile.ZIP_DEFLATED)

    tamanho = arquivo_zip.stat().st_size / 1024 / 1024
    print(f"\nPronto: {arquivo_zip} ({tamanho:.0f} MB)")


if __name__ == "__main__":
    main()
