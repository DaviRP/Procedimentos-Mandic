"""
Agendamentos — tela do app que coleta as agendas do OdontoSig para o banco de agendamentos.

    1. Coleta com o robô odontosig.py (login, unidade e período informados na hora).
    2. Grava em dados/Banco de Agendamentos.xlsx, sem duplicar: coletar de novo o mesmo
       período atualiza as linhas que já existem.
    3. Resumo por unidade, coletas feitas e consulta dos agendamentos.
    4. Revisão: cada agendamento pode ser editado e precisa ser aprovado (coluna "Aprovado")
       antes de subir, como os planos de tratamento.
    5. Integra os agendamentos aprovados no Clínica nas Nuvens com o robô cnn_agenda.py (cada
       Tipo agenda de um jeito; os tipos prontos estão em cnn_agenda.TIPOS). O resultado de cada
       linha vai para a coluna "Status integração" — linha com status não é integrada de novo.

O app_planos.py chama configurar() ao iniciar e atende as rotas /api/agendamentos/*.
"""
import os
import re
import shutil
import sys
import threading
import time
import traceback
import unicodedata
from datetime import date, datetime
from pathlib import Path

import openpyxl
from openpyxl.styles import Font, PatternFill

# O Python portátil do pacote Windows não procura módulos na pasta do script: garante o odontosig.py
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cnn_agenda  # noqa: E402
import odontosig  # noqa: E402

PASTA_DADOS = None
BANCO = None
PASTA_BACKUPS = None
BACKUPS_MANTIDOS = 30

ABA_AGENDAMENTOS = "Agendamentos"
ABA_COLETAS = "Coletas"
COLUNAS = {
    ABA_AGENDAMENTOS: [
        "Origem", "Unidade", "Data", "Hora", "PG", "Nome", "Tipo", "Coordenador", "Agendado com",
        "Turma", "Observações", "Cancelado", "Cancelado em", "Coletado em", "Atualizado em",
        "Status integração", "Integrado em", "Mensagem integração", "Aprovado", "Editado em", "Chave",
    ],
    ABA_COLETAS: [
        "Coletado em", "Origem", "Unidade", "Data início", "Data fim", "Páginas", "Agendamentos lidos",
        "Novos", "Atualizados", "Sem mudança", "Situação", "Mensagem",
    ],
}
CORES = {ABA_AGENDAMENTOS: "272F63", ABA_COLETAS: "6B7488"}
ORIGEM = "OdontoSig"
# Campos que identificam um agendamento (coletar de novo o mesmo período não duplica)
CAMPOS_CHAVE = ("Origem", "Unidade", "Data", "Hora", "PG", "Nome", "Agendado com")
# Campos que podem mudar entre uma coleta e outra (cancelamento, observação...)
CAMPOS_ATUALIZAVEIS = ("Tipo", "Coordenador", "Turma", "Observações", "Cancelado", "Cancelado em")
# Linha editada no app: a coleta seguinte só atualiza o cancelamento (não desfaz a edição)
CAMPOS_ATUALIZAVEIS_EDITADO = ("Cancelado", "Cancelado em")
# Campos que a tela de edição pode mudar
CAMPOS_EDITAVEIS = ("Data", "Hora", "PG", "Nome", "Tipo", "Agendado com", "Turma", "Observações")
# A coluna "Chave" guarda a identidade do agendamento no OdontoSig no momento da coleta. Ela não
# muda quando a linha é editada, para a próxima coleta achar a mesma linha (e não duplicar).

trava_banco = threading.RLock()
trava_log = threading.Lock()
registro = []  # (n, hora, texto) — log da tela de agendamentos


def configurar(pasta_dados):
    """Aponta o módulo para a pasta de dados do app (a mesma do banco de planos)."""
    global PASTA_DADOS, BANCO, PASTA_BACKUPS
    PASTA_DADOS = Path(pasta_dados)
    BANCO = PASTA_DADOS / "Banco de Agendamentos.xlsx"
    PASTA_BACKUPS = PASTA_DADOS / "backups"
    odontosig.PASTA_ERROS = cnn_agenda.PASTA_ERROS = PASTA_DADOS / "erros"
    odontosig.log = cnn_agenda.log = log


# ── Utilitários ───────────────────────────────────────────────────────────────
def texto(valor):
    if valor is None:
        return ""
    if isinstance(valor, datetime):
        # O Excel devolve as datas como datetime: sem horário, mostra só a data
        return valor.strftime("%d/%m/%Y" if (valor.hour, valor.minute) == (0, 0) else "%d/%m/%Y %H:%M")
    if isinstance(valor, date):
        return valor.strftime("%d/%m/%Y")
    return str(valor).strip()


def normalizar(valor):
    valor = unicodedata.normalize("NFKD", texto(valor))
    valor = "".join(c for c in valor if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", valor).strip().lower()


def como_data(valor):
    if isinstance(valor, datetime):
        return valor.date()
    if isinstance(valor, date):
        return valor
    try:
        return datetime.strptime(texto(valor)[:10], "%d/%m/%Y").date()
    except ValueError:
        return None


def log(*args, sep=" ", **_):
    mensagem = sep.join(str(a) for a in args)
    with trava_log:
        for linha in mensagem.split("\n"):
            if linha.strip():
                registro.append((len(registro) + 1, datetime.now().strftime("%H:%M:%S"), linha))
        del registro[:-5000]
    sys.__stdout__.write(mensagem + "\n")


def novas_linhas_log(desde):
    with trava_log:
        return [l for l in registro if l[0] > desde]


# ── Banco (planilha) ──────────────────────────────────────────────────────────
def abrir_banco():
    """Abre o banco (criando-o, ou as abas/colunas que faltarem). Devolve o workbook."""
    if BANCO.exists():
        wb = openpyxl.load_workbook(BANCO)
    else:
        wb = openpyxl.Workbook()
        wb.remove(wb.active)
    for aba, colunas in COLUNAS.items():
        if aba not in wb.sheetnames:
            ws = wb.create_sheet(aba)
            ws.append(colunas)
            for celula in ws[1]:
                celula.font = Font(bold=True, color="FFFFFF")
                celula.fill = PatternFill("solid", fgColor=CORES[aba])
            ws.freeze_panes = "A2"
            continue
        ws = wb[aba]
        existentes = [texto(c.value) for c in ws[1]]
        for nome in colunas:
            if nome not in existentes:
                existentes.append(nome)
                ws.cell(row=1, column=len(existentes), value=nome)
    preencher_chaves(wb[ABA_AGENDAMENTOS])
    return wb


def preencher_chaves(ws):
    """Linhas coletadas antes da coluna Chave existir: grava a chave calculada pelos campos."""
    cabecalho = [texto(c.value) for c in ws[1]]
    i_chave = cabecalho.index("Chave")
    for linha in ws.iter_rows(min_row=2):
        if linha[i_chave].value in (None, "") and any(c.value not in (None, "") for c in linha):
            linha[i_chave].value = chave(dict(zip(cabecalho, (c.value for c in linha))))


def banco_aberto_no_excel():
    return any((BANCO.parent / nome).exists() for nome in (f"~${BANCO.name}", f".~lock.{BANCO.name}#"))


def salvar_banco(wb):
    if banco_aberto_no_excel():
        raise ValueError("O banco de agendamentos está aberto no Excel. Feche a planilha e tente de novo "
                         "(senão, ao salvar no Excel, as alterações do app se perdem).")
    PASTA_DADOS.mkdir(parents=True, exist_ok=True)
    temporario = BANCO.with_name(f"~tmp_{BANCO.name}")
    wb.save(temporario)
    with open(temporario, "rb+") as f:
        os.fsync(f.fileno())
    for _ in range(5):
        try:
            os.replace(temporario, BANCO)
            return
        except PermissionError:
            time.sleep(1)
    temporario.unlink(missing_ok=True)
    raise ValueError("Não consegui gravar o banco de agendamentos: o arquivo está travado por outro programa "
                     "(Excel, OneDrive, antivírus). Feche-o e tente de novo.")


def fazer_backup(motivo):
    """Cópia datada em dados/backups. Nome 'Agendamentos ...' para não misturar com os
    backups do banco de planos ('Banco ...'), que têm a própria contagem de 30."""
    if not BANCO or not BANCO.exists():
        return
    try:
        PASTA_BACKUPS.mkdir(parents=True, exist_ok=True)
        with trava_banco:
            shutil.copy2(BANCO, PASTA_BACKUPS / f"Agendamentos {datetime.now():%Y-%m-%d %H%M%S} ({motivo}).xlsx")
        for antigo in sorted(PASTA_BACKUPS.glob("Agendamentos *.xlsx"))[:-BACKUPS_MANTIDOS]:
            antigo.unlink(missing_ok=True)
    except Exception as e:
        log(f"Atenção: não consegui fazer o backup do banco de agendamentos ({motivo}): {e}")


def chave_da_linha(linha):
    """Identidade gravada (coluna Chave); linhas antigas sem ela: a calculada pelos campos."""
    return texto(linha.get("Chave")) or chave(linha)


def chave(linha):
    return "|".join(
        como_data(linha.get(c)).isoformat() if c == "Data" and como_data(linha.get(c)) else normalizar(linha.get(c))
        for c in CAMPOS_CHAVE
    )


def ler_aba(aba):
    """Linhas da aba como dicts {coluna: valor}."""
    with trava_banco:
        if not BANCO.exists():
            return []
        wb = openpyxl.load_workbook(BANCO, read_only=True)
        if aba not in wb.sheetnames:
            wb.close()
            return []
        linhas = wb[aba].iter_rows(values_only=True)
        cabecalho = [texto(c) for c in next(linhas, [])]
        dados = [dict(zip(cabecalho, valores)) for valores in linhas if any(v not in (None, "") for v in valores)]
        wb.close()
        return dados


def gravar_agendamentos(linhas):
    """Acrescenta os agendamentos novos e atualiza os que já existem. Devolve as contagens."""
    agora = datetime.now()
    novos = atualizados = iguais = 0
    with trava_banco:
        wb = abrir_banco()
        ws = wb[ABA_AGENDAMENTOS]
        cabecalho = [texto(c.value) for c in ws[1]]
        col = {nome: i + 1 for i, nome in enumerate(cabecalho)}

        existentes, editadas = {}, set()
        for n, valores in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
            dados = dict(zip(cabecalho, valores))
            existentes[chave_da_linha(dados)] = n
            if dados.get("Editado em"):
                editadas.add(n)

        for linha in linhas:
            linha = {"Origem": ORIGEM, **linha}
            k = chave(linha)
            n = existentes.get(k)
            if n is None:
                ws.append([None] * len(cabecalho))
                n = ws.max_row
                for nome, valor in linha.items():
                    if nome in col:
                        ws.cell(row=n, column=col[nome], value=valor)
                ws.cell(row=n, column=col["Data"]).number_format = "DD/MM/YYYY"
                ws.cell(row=n, column=col["Coletado em"], value=agora).number_format = "DD/MM/YYYY HH:MM"
                ws.cell(row=n, column=col["Chave"], value=k)
                existentes[k] = n
                novos += 1
            else:
                mudou = False
                for nome in (CAMPOS_ATUALIZAVEIS_EDITADO if n in editadas else CAMPOS_ATUALIZAVEIS):
                    celula = ws.cell(row=n, column=col[nome])
                    if texto(celula.value) != texto(linha.get(nome)):
                        celula.value = linha.get(nome)
                        mudou = True
                if mudou:
                    ws.cell(row=n, column=col["Atualizado em"], value=agora).number_format = "DD/MM/YYYY HH:MM"
                    atualizados += 1
                else:
                    iguais += 1
        salvar_banco(wb)
    return {"novos": novos, "atualizados": atualizados, "iguais": iguais}


def registrar_coleta(dados):
    with trava_banco:
        wb = abrir_banco()
        ws = wb[ABA_COLETAS]
        cabecalho = [texto(c.value) for c in ws[1]]
        ws.append([dados.get(nome) for nome in cabecalho])
        n = ws.max_row
        for nome, formato in (("Coletado em", "DD/MM/YYYY HH:MM"), ("Data início", "DD/MM/YYYY"),
                              ("Data fim", "DD/MM/YYYY")):
            ws.cell(row=n, column=cabecalho.index(nome) + 1).number_format = formato
        salvar_banco(wb)


def resumo_banco():
    """Por unidade: total, cancelados, primeira e última data, última coleta."""
    resumo = {}
    for linha in ler_aba(ABA_AGENDAMENTOS):
        u = texto(linha.get("Unidade")) or "(sem unidade)"
        r = resumo.setdefault(u, {"unidade": u, "total": 0, "cancelados": 0, "de": None, "ate": None,
                                  "integrados": 0, "aguardando": 0, "aprovados": 0, "erros": 0, "ultima_coleta": None})
        r["total"] += 1
        sit = situacao(linha)
        r[{"cancelado": "cancelados", "integrado": "integrados", "aguardando": "aguardando",
           "aprovado": "aprovados", "erro": "erros"}[sit]] += 1
        d = como_data(linha.get("Data"))
        if d:
            r["de"] = min(r["de"] or d, d)
            r["ate"] = max(r["ate"] or d, d)
    for coleta_feita in ler_aba(ABA_COLETAS):
        u = texto(coleta_feita.get("Unidade"))
        if u in resumo:
            resumo[u]["ultima_coleta"] = texto(coleta_feita.get("Coletado em"))
    for r in resumo.values():
        r["de"], r["ate"] = texto(r["de"]), texto(r["ate"])
    return sorted(resumo.values(), key=lambda r: r["unidade"])


def coletas_recentes(limite=30):
    return [{k: texto(v) for k, v in c.items()} for c in ler_aba(ABA_COLETAS)][::-1][:limite]


def situacao(linha):
    """cancelado / integrado / erro (tem status, mas não integrou) / aprovado / aguardando (aprovação)."""
    if normalizar(linha.get("Cancelado")) == "sim":
        return "cancelado"
    status = normalizar(linha.get("Status integração"))
    if status == "integrado":
        return "integrado"
    if status:
        return "erro"
    return "aprovado" if normalizar(linha.get("Aprovado")) == "sim" else "aguardando"


def linhas_tabela(unidade="", busca="", de="", ate="", limite=500, situacao_filtro=""):
    """Agendamentos filtrados, mais recentes primeiro (no máximo 'limite')."""
    alvo_busca = normalizar(busca)
    d_de = como_data(de) if de else None
    d_ate = como_data(ate) if ate else None
    resultado = []
    for linha in ler_aba(ABA_AGENDAMENTOS):
        if unidade and texto(linha.get("Unidade")) != unidade:
            continue
        d = como_data(linha.get("Data"))
        if (d_de and (not d or d < d_de)) or (d_ate and (not d or d > d_ate)):
            continue
        if alvo_busca and alvo_busca not in normalizar(" ".join(texto(v) for v in linha.values())):
            continue
        if situacao_filtro and situacao(linha) != situacao_filtro:
            continue
        resultado.append(linha)
    resultado.sort(key=lambda l: (como_data(l.get("Data")) or date.min, texto(l.get("Hora"))), reverse=True)
    return {"total": len(resultado), "tipos_prontos": [normalizar(t) for t in cnn_agenda.TIPOS],
            "linhas": [{**{k: texto(v) for k, v in l.items()}, "Chave": chave_da_linha(l), "situacao": situacao(l),
                        "Hora": texto(l.get("Hora")),
                        "DataISO": como_data(l.get("Data")).isoformat() if como_data(l.get("Data")) else ""}
                       for l in resultado[:limite]]}


def estado(log_desde=0):
    return {
        "unidades": odontosig.UNIDADES,
        "tipos": [{"chave": k, "nome": v["nome"]} for k, v in cnn_agenda.TIPOS.items()],
        "banco": {"caminho": str(BANCO), "existe": BANCO.exists(), "aberto_no_excel": banco_aberto_no_excel()},
        "coleta": coleta,
        "integracao": integracao,
        "log": novas_linhas_log(log_desde),
    }


# ── Coleta (robô em segundo plano) ────────────────────────────────────────────
coleta = {"rodando": False, "unidade": "", "unidades": [], "feitas": 0, "pagina": 0, "lidos": 0,
          "novos": 0, "atualizados": 0, "erros": 0, "inicio": None, "fim": None, "mensagem": ""}


def ler_data_iso(valor, nome):
    try:
        return datetime.strptime(texto(valor), "%Y-%m-%d").date()
    except ValueError:
        raise ValueError(f"Informe a {nome}.") from None


def iniciar_coleta(opcoes):
    usuario = texto(opcoes.get("usuario"))
    senha = opcoes.get("senha") or ""
    unidades = [u for u in (opcoes.get("unidades") or []) if u in odontosig.UNIDADES]
    if not usuario or not senha:
        raise ValueError("Informe o usuário e a senha do OdontoSig.")
    if not unidades:
        raise ValueError("Escolha pelo menos uma unidade.")
    inicio = ler_data_iso(opcoes.get("inicio"), "data de início")
    fim = ler_data_iso(opcoes.get("fim"), "data de término")
    if fim < inicio:
        raise ValueError("A data de término é anterior à data de início.")
    if banco_aberto_no_excel():
        raise ValueError("Feche o banco de agendamentos no Excel antes de coletar: o app precisa gravar nele.")
    with trava_banco:
        if coleta["rodando"]:
            raise ValueError("Já há uma coleta em andamento.")
        if integracao["rodando"]:
            raise ValueError("Há uma integração de agendamentos em andamento. Espere terminar para coletar.")
        coleta.update({"rodando": True, "unidade": "", "unidades": unidades, "feitas": 0, "pagina": 0,
                       "lidos": 0, "novos": 0, "atualizados": 0, "erros": 0, "inicio": time.time(),
                       "fim": None, "mensagem": ""})
    odontosig.PARAR.clear()
    args = (usuario, senha, unidades, inicio, fim, bool(opcoes.get("headless", True)))
    threading.Thread(target=rodar_coleta, args=args, daemon=True).start()


def parar():
    odontosig.PARAR.set()
    cnn_agenda.PARAR.set()
    if coleta["rodando"]:
        log("Parada solicitada: o robô termina a página atual, grava o que leu e encerra.")
    if integracao["rodando"]:
        log("Parada solicitada: o robô termina o agendamento atual, grava o status e encerra.")


def rodar_coleta(usuario, senha, unidades, inicio, fim, headless):
    fazer_backup("antes de coletar")
    log(f"Coleta de {inicio:%d/%m/%Y} a {fim:%d/%m/%Y} — {len(unidades)} unidade(s).")
    try:
        for unidade in unidades:
            if odontosig.PARAR.is_set():
                break
            coleta.update({"unidade": unidade, "pagina": 0})
            log(f"── {unidade} ──")
            registro_coleta = {"Coletado em": datetime.now(), "Origem": ORIGEM, "Unidade": unidade,
                               "Data início": inicio, "Data fim": fim}
            linhas = []
            situacao, mensagem = "ok", ""

            def ao_ler_pagina(numero, da_pagina):
                coleta["pagina"] = numero
                coleta["lidos"] += len(da_pagina)

            try:
                linhas = odontosig.coletar_unidade(usuario, senha, unidade, inicio, fim, headless, ao_ler_pagina)
            except odontosig.Interrompido as e:
                linhas = e.args[0] if e.args else []
                situacao, mensagem = "interrompida", "Parada pelo usuário; gravadas as páginas já lidas."
                log("Coleta interrompida: gravando o que já foi lido.")
            except Exception as e:
                situacao = "erro"
                mensagem = str(e).splitlines()[0] if str(e) else type(e).__name__
                coleta["erros"] += 1
                log(f"ERRO em {unidade}: {mensagem}")
                if "não aceitou o login" in mensagem:
                    registro_coleta.update({"Situação": situacao, "Mensagem": mensagem})
                    registrar_coleta(registro_coleta)
                    break  # mesmo login nas outras unidades: não adianta seguir

            contagem = gravar_agendamentos(linhas) if linhas else {"novos": 0, "atualizados": 0, "iguais": 0}
            coleta["novos"] += contagem["novos"]
            coleta["atualizados"] += contagem["atualizados"]
            if linhas:
                log(f"Gravado no banco: {contagem['novos']} novo(s), {contagem['atualizados']} atualizado(s), "
                    f"{contagem['iguais']} sem mudança.")
            registro_coleta.update({
                "Páginas": coleta["pagina"], "Agendamentos lidos": len(linhas), "Novos": contagem["novos"],
                "Atualizados": contagem["atualizados"], "Sem mudança": contagem["iguais"],
                "Situação": situacao, "Mensagem": mensagem,
            })
            registrar_coleta(registro_coleta)
            coleta["feitas"] += 1
        coleta["mensagem"] = "Coleta concluída." if not coleta["erros"] else "Coleta concluída com erro(s): veja o registro."
        log(coleta["mensagem"])
    except Exception as e:
        traceback.print_exc()
        coleta["mensagem"] = f"Erro: {type(e).__name__}: {e}"
        log(coleta["mensagem"])
    finally:
        coleta.update({"rodando": False, "fim": time.time()})


# ── Integração no Clínica nas Nuvens ──────────────────────────────────────────
integracao = {"rodando": False, "total": 0, "feitos": 0, "integrados": 0, "nao_encontrados": 0, "erros": 0,
              "atual": "", "inicio": None, "fim": None, "mensagem": ""}


def pendentes_integracao(tipos=None, unidade="", de="", ate="", so_aprovados=True):
    """Agendamentos prontos para integrar: tipo com robô pronto, não cancelados, sem Status
    integração, aprovados no app (so_aprovados), com unidade conhecida no Clínica nas Nuvens.
    Ordem: unidade, data, hora."""
    tipos = {cnn_agenda.chave_tipo(t) for t in (tipos or cnn_agenda.TIPOS)} & set(cnn_agenda.TIPOS)
    d_de = como_data(de) if de else None
    d_ate = como_data(ate) if ate else None
    linhas = []
    for linha in ler_aba(ABA_AGENDAMENTOS):
        d = como_data(linha.get("Data"))
        if (cnn_agenda.chave_tipo(linha.get("Tipo")) not in tipos or normalizar(linha.get("Cancelado")) == "sim"
                or texto(linha.get("Status integração")) or not d
                or (so_aprovados and normalizar(linha.get("Aprovado")) != "sim")
                or texto(linha.get("Unidade")) not in cnn_agenda.CLINICAS
                or (unidade and texto(linha.get("Unidade")) != unidade)
                or (d_de and d < d_de) or (d_ate and d > d_ate)):
            continue
        linhas.append({**linha, "Data": d, "Hora": texto(linha.get("Hora")), "Nome": texto(linha.get("Nome")),
                       "Agendado com": texto(linha.get("Agendado com"))})
    linhas.sort(key=lambda l: (texto(l.get("Unidade")), l["Data"], l["Hora"]))
    return linhas


def contar_pendentes(tipos=None, unidade="", de="", ate=""):
    """Por unidade e tipo: quantos aguardam aprovação e quantos estão aprovados (prontos para subir)."""
    contagem = {}
    for linha in pendentes_integracao(tipos, unidade, de, ate, so_aprovados=False):
        c = contagem.setdefault((texto(linha.get("Unidade")), texto(linha.get("Tipo"))), {"aguardando": 0, "aprovados": 0})
        c["aprovados" if normalizar(linha.get("Aprovado")) == "sim" else "aguardando"] += 1
    return [{"unidade": u, "tipo": t, "pendentes": c["aprovados"], **c} for (u, t), c in sorted(contagem.items())]


def marcar_integracao(linha, status, mensagem=""):
    """Grava o resultado do agendamento na linha dele (achada pela chave, não pela posição)."""
    with trava_banco:
        wb = abrir_banco()
        ws = wb[ABA_AGENDAMENTOS]
        cabecalho = [texto(c.value) for c in ws[1]]
        col = {nome: i + 1 for i, nome in enumerate(cabecalho)}
        alvo = chave_da_linha(linha)
        for n, valores in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
            if chave_da_linha(dict(zip(cabecalho, valores))) == alvo:
                ws.cell(row=n, column=col["Status integração"], value=status)
                ws.cell(row=n, column=col["Integrado em"], value=datetime.now()).number_format = "DD/MM/YYYY HH:MM"
                ws.cell(row=n, column=col["Mensagem integração"], value=mensagem or None)
                break
        else:
            raise ValueError(f"não achei no banco o agendamento de {texto(linha.get('Nome'))} "
                             f"em {texto(linha.get('Data'))} {texto(linha.get('Hora'))}")
        salvar_banco(wb)


def iniciar_integracao(opcoes):
    usuario = texto(opcoes.get("usuario"))
    senha = opcoes.get("senha") or ""
    if not usuario or not senha:
        raise ValueError("Informe o usuário e a senha do Clínica nas Nuvens.")
    tipos = [t for t in (opcoes.get("tipos") or []) if t in cnn_agenda.TIPOS]
    if not tipos:
        raise ValueError("Escolha pelo menos um tipo de agendamento.")
    de = ler_data_iso(opcoes["de"], "data inicial") if opcoes.get("de") else None
    ate = ler_data_iso(opcoes["ate"], "data final") if opcoes.get("ate") else None
    try:
        limite = int(opcoes.get("limite") or 0) or None
    except ValueError:
        raise ValueError("O limite precisa ser um número.") from None
    if banco_aberto_no_excel():
        raise ValueError("Feche o banco de agendamentos no Excel antes de integrar: o app grava o status de cada "
                         "agendamento nele.")
    linhas = pendentes_integracao(tipos, texto(opcoes.get("unidade")), texto(de), texto(ate))[:limite]
    if not linhas:
        raise ValueError("Nenhum agendamento aprovado aguardando integração com esses filtros. "
                         "Aprove os agendamentos em 'Agendamentos no banco'.")
    with trava_banco:
        if integracao["rodando"]:
            raise ValueError("A integração de agendamentos já está em andamento.")
        if coleta["rodando"]:
            raise ValueError("Há uma coleta em andamento. Espere terminar para integrar.")
        integracao.update({"rodando": True, "total": len(linhas), "feitos": 0, "integrados": 0, "nao_encontrados": 0,
                           "erros": 0, "atual": "", "inicio": time.time(), "fim": None, "mensagem": ""})
    cnn_agenda.PARAR.clear()
    args = (usuario, senha, linhas, bool(opcoes.get("headless", True)), opcoes.get("ao_login"))
    threading.Thread(target=rodar_integracao, args=args, daemon=True).start()
    return {"total": len(linhas)}


def rodar_integracao(usuario, senha, linhas, headless, ao_login=None):
    fazer_backup("antes de integrar agendamentos")
    por_clinica = {}
    for linha in linhas:
        por_clinica.setdefault(cnn_agenda.CLINICAS[texto(linha["Unidade"])], []).append(linha)
    log(f"Integração de {len(linhas)} agendamento(s) no Clínica nas Nuvens — "
        + ", ".join(f"{c}: {len(l)}" for c, l in por_clinica.items()))

    def ao_terminar(linha, status, mensagem):
        try:
            marcar_integracao(linha, status, mensagem)
        except Exception as e:
            # Sem gravar o status, rodar de novo agendaria em dobro: para tudo
            cnn_agenda.PARAR.set()
            log(f"ERRO ao gravar o status no banco: {e}. Integração interrompida para não agendar em dobro. "
                f"Confira no Clínica nas Nuvens o agendamento de {linha['Nome']} ({status}) e anote no banco.")
            integracao["erros"] += 1
            return
        integracao["feitos"] += 1
        chave_contador = {"integrado": "integrados", "paciente não encontrado": "nao_encontrados"}.get(status, "erros")
        integracao[chave_contador] += 1

    login_original = cnn_agenda.fazer_login

    def fazer_login(driver, u, s):
        login_original(driver, u, s)
        if ao_login:
            ao_login()

    cnn_agenda.fazer_login = fazer_login
    try:
        cnn_agenda.integrar(usuario, senha, por_clinica, headless, ao_terminar)
        if cnn_agenda.PARAR.is_set() and integracao["feitos"] < integracao["total"]:
            integracao["mensagem"] = f"Integração parada: {integracao['feitos']} de {integracao['total']} feitos."
        else:
            integracao["mensagem"] = (f"Integração concluída: {integracao['integrados']} agendado(s), "
                                      f"{integracao['nao_encontrados']} paciente(s) não encontrado(s), "
                                      f"{integracao['erros']} erro(s).")
    except cnn_agenda.ErroLogin as e:
        integracao["erros"] += 1
        integracao["mensagem"] = f"O Clínica nas Nuvens não aceitou o login: {e}."
    except Exception as e:
        traceback.print_exc()
        integracao["erros"] += 1
        integracao["mensagem"] = f"Erro: {type(e).__name__}: {e}"
    finally:
        cnn_agenda.fazer_login = login_original
        integracao.update({"rodando": False, "fim": time.time()})
        log(integracao["mensagem"])


# ── Revisão: aprovar e editar ─────────────────────────────────────────────────
def _linhas_por_chave(ws):
    cabecalho = [texto(c.value) for c in ws[1]]
    i = {nome: cabecalho.index(nome) for nome in cabecalho}
    por_chave = {}
    for linha in ws.iter_rows(min_row=2):
        dados = {nome: linha[j].value for nome, j in i.items()}
        por_chave[chave_da_linha(dados)] = (linha, dados)
    return i, por_chave


def aprovar_agendamentos(chaves, aprovado):
    """Marca/desmarca 'Aprovado'. Só vale para os que ainda não subiram nem foram cancelados."""
    chaves = [texto(k) for k in chaves or [] if texto(k)]
    if not chaves:
        raise ValueError("Nenhum agendamento selecionado.")
    with trava_banco:
        if integracao["rodando"]:
            raise ValueError("Há uma integração de agendamentos em andamento. Espere terminar para mudar aprovações.")
        wb = abrir_banco()
        i, por_chave = _linhas_por_chave(wb[ABA_AGENDAMENTOS])
        alterados = ignorados = 0
        for k in chaves:
            linha, dados = por_chave.get(k, (None, None))
            if linha is None or situacao(dados) not in ("aguardando", "aprovado"):
                ignorados += 1
                continue
            linha[i["Aprovado"]].value = "Sim" if aprovado else None
            alterados += 1
        salvar_banco(wb)
    log(f"{'Aprovado(s)' if aprovado else 'Aprovação removida de'} {alterados} agendamento(s)"
        + (f" ({ignorados} ignorado(s): já integrados, com status ou cancelados)" if ignorados else "") + ".")
    return {"alterados": alterados, "ignorados": ignorados}


def editar_agendamento(dados):
    """Altera os campos de um agendamento que ainda não subiu. Se ele tinha dado erro (ou paciente
    não encontrado), o status é limpo para entrar de novo na fila."""
    k = texto(dados.get("chave"))
    novos = dados.get("campos") or {}
    try:
        data = datetime.strptime(texto(novos.get("Data")), "%Y-%m-%d")
    except ValueError:
        raise ValueError("Informe a data do agendamento.") from None
    hora = texto(novos.get("Hora"))
    if not re.fullmatch(r"([01]\d|2[0-3]):[0-5]\d", hora):
        raise ValueError("Informe a hora no formato HH:MM (ex.: 08:30).")
    if not texto(novos.get("Nome")):
        raise ValueError("Informe o nome do paciente.")
    if not texto(novos.get("Tipo")):
        raise ValueError("Informe o tipo do agendamento.")
    valores = {nome: texto(novos.get(nome)) or None for nome in CAMPOS_EDITAVEIS}
    valores["Data"], valores["Hora"] = data, hora
    valores["Tipo"] = texto(novos.get("Tipo")).upper()

    agora = datetime.now()
    with trava_banco:
        if integracao["rodando"]:
            raise ValueError("Há uma integração de agendamentos em andamento. Espere terminar para editar.")
        wb = abrir_banco()
        i, por_chave = _linhas_por_chave(wb[ABA_AGENDAMENTOS])
        linha, atual = por_chave.get(k, (None, None))
        if linha is None:
            raise ValueError("Esse agendamento não está mais no banco. Atualize a lista e tente de novo.")
        sit = situacao(atual)
        if sit == "integrado":
            raise ValueError("Esse agendamento já foi integrado no Clínica nas Nuvens: não dá para editar por aqui.")
        if sit == "cancelado":
            raise ValueError("Esse agendamento está cancelado no OdontoSig.")
        mudou = [nome for nome in CAMPOS_EDITAVEIS if texto(atual.get(nome)) != texto(valores[nome])]
        for nome in mudou:
            linha[i[nome]].value = valores[nome]
        linha[i["Data"]].number_format = "DD/MM/YYYY"
        if mudou:
            linha[i["Editado em"]].value = agora
            linha[i["Editado em"]].number_format = "DD/MM/YYYY HH:MM"
        if sit == "erro":  # corrigido: volta para a fila
            for nome in ("Status integração", "Integrado em", "Mensagem integração"):
                linha[i[nome]].value = None
        linha[i["Aprovado"]].value = "Sim" if dados.get("aprovado") else None
        salvar_banco(wb)
    log(f"Agendamento editado: {valores['Nome']} · {data:%d/%m/%Y} {hora}"
        + (f" · alterado: {', '.join(mudou)}" if mudou else " · sem mudança nos campos")
        + (" · status de erro limpo" if sit == "erro" else "") + (" · aprovado" if dados.get("aprovado") else ""))
    return {"alterados": mudou}
