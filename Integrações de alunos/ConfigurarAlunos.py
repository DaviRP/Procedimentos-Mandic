r"""
Configura os alunos (profissionais da clínica-escola) na Clínica nas Nuvens via API,
usando os e-mails da coluna "Email" do alunos.csv.

Endpoint:
  PUT https://api.clinicanasnuvens.com.br/clinica-escola/profissional/configurar/{email}
  corpo: { "atendimento": { "isBloqueiaAtendimentoSemAgendamento": true },
           "gruposUsuario": [ { "idGrupoBloqueio": 7603, "idGrupoPermissao": 7604 } ] }

Cada e-mail processado é gravado em ./logs/configurar_alunos_log.csv. Ao rodar de novo,
os e-mails que já deram OK são pulados (use --reprocessar para enviar todos).

Uso:
  python ConfigurarAlunos.py --dry-run        # só lista o que seria enviado
  python ConfigurarAlunos.py --limite 1       # testa com o primeiro aluno
  python ConfigurarAlunos.py                  # envia todos

Credenciais: CNN_CID e CNN_AUTH (variáveis de ambiente) ou as constantes abaixo.
"""
import argparse
import csv
import datetime
import os
import sys
import time
from pathlib import Path
from urllib.parse import quote

import requests

BASE_DIR = Path(__file__).resolve().parent
ARQUIVO = BASE_DIR / "alunos.csv"
COLUNA_EMAIL = "Email"
LOG = BASE_DIR / "logs" / "configurar_alunos_log.csv"

URL = "https://api.clinicanasnuvens.com.br/clinica-escola/profissional/configurar/{email}"
CID = os.environ.get("CNN_CID", "c01b1c07f01d852fb39745189850d5f1")
AUTH = os.environ.get(
    "CNN_AUTH",
    "Basic YXBpQ25uOjdlYjE2MDA2MjY1YWE1MzUxNmIxMTU5NTAzY2MyNmViNzM4NTI5ZDM0NDgwOTE0MTZhYmE3Yzc3ODRlNWY2ODE=",
)
ID_GRUPO_BLOQUEIO = 7603
ID_GRUPO_PERMISSAO = 7604
PAYLOAD = {
    "atendimento": {"isBloqueiaAtendimentoSemAgendamento": True},
    "gruposUsuario": [{"idGrupoBloqueio": ID_GRUPO_BLOQUEIO, "idGrupoPermissao": ID_GRUPO_PERMISSAO}],
}

TENTATIVAS = 3
PAUSA_ENTRE_REQUISICOES = 0.2  # segundos


def ler_emails(arquivo: Path) -> list[str]:
    with open(arquivo, encoding="utf-8-sig", newline="") as f:
        leitor = csv.DictReader(f)
        if COLUNA_EMAIL not in (leitor.fieldnames or []):
            sys.exit(f"Coluna '{COLUNA_EMAIL}' não encontrada em {arquivo.name}")
        emails, vistos = [], set()
        for linha in leitor:
            email = (linha.get(COLUNA_EMAIL) or "").strip().lower()
            if email and email not in vistos:
                vistos.add(email)
                emails.append(email)
    return emails


def emails_ja_ok(log: Path) -> set[str]:
    if not log.exists():
        return set()
    with open(log, encoding="utf-8", newline="") as f:
        return {l["email"] for l in csv.DictReader(f) if l["status"] == "OK"}


def registrar(log: Path, email: str, status: str, http: int | str, resposta: str) -> None:
    log.parent.mkdir(exist_ok=True)
    novo = not log.exists()
    with open(log, "a", encoding="utf-8", newline="") as f:
        w = csv.writer(f)
        if novo:
            w.writerow(["data_hora", "email", "status", "http", "resposta"])
        w.writerow([datetime.datetime.now().isoformat(timespec="seconds"), email, status, http, resposta[:500]])


def configurar(sessao: requests.Session, email: str) -> tuple[bool, int | str, str]:
    url = URL.format(email=quote(email, safe=""))
    for tentativa in range(1, TENTATIVAS + 1):
        try:
            r = sessao.put(url, json=PAYLOAD, timeout=30)
        except requests.RequestException as e:
            if tentativa == TENTATIVAS:
                return False, "erro", str(e)
            time.sleep(2 * tentativa)
            continue
        # 429/5xx: tenta de novo; o resto é resposta definitiva
        if (r.status_code == 429 or r.status_code >= 500) and tentativa < TENTATIVAS:
            time.sleep(2 * tentativa)
            continue
        return r.ok, r.status_code, r.text.strip()
    return False, "erro", "sem resposta"


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--dry-run", action="store_true", help="não envia nada, só lista")
    ap.add_argument("--limite", type=int, help="processa só os N primeiros pendentes")
    ap.add_argument("--reprocessar", action="store_true", help="ignora o log e envia todos")
    args = ap.parse_args()

    emails = ler_emails(ARQUIVO)
    ok_anteriores = set() if args.reprocessar else emails_ja_ok(LOG)
    pendentes = [e for e in emails if e not in ok_anteriores]
    if args.limite:
        pendentes = pendentes[: args.limite]

    print(f"{len(emails)} e-mails no CSV | {len(ok_anteriores & set(emails))} já OK | {len(pendentes)} a processar")
    if args.dry_run:
        for e in pendentes:
            print(f"  [dry-run] PUT {URL.format(email=quote(e, safe=''))}")
        return

    sessao = requests.Session()
    sessao.headers.update({
        "accept": "application/json",
        "clinicaNasNuvens-cid": CID,
        "authorization": AUTH,
        "Content-Type": "application/json",
    })

    total_ok = total_erro = 0
    for i, email in enumerate(pendentes, 1):
        sucesso, http, resposta = configurar(sessao, email)
        registrar(LOG, email, "OK" if sucesso else "ERRO", http, resposta)
        if sucesso:
            total_ok += 1
            print(f"[{i}/{len(pendentes)}] ✓ {email}")
        else:
            total_erro += 1
            print(f"[{i}/{len(pendentes)}] ✗ {email} -> {http}: {resposta[:200]}")
        time.sleep(PAUSA_ENTRE_REQUISICOES)

    print(f"\nConcluído: {total_ok} OK, {total_erro} com erro. Log: {LOG}")


if __name__ == "__main__":
    main()
