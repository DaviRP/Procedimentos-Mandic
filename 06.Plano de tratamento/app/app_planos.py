"""
App de Planos de Tratamento — interface local (abre no navegador) para:

    1. Gerar o template que os colaboradores preenchem (produtos por orçamento).
    2. Importar um template preenchido: converte produtos -> procedimentos
       (TransformadorDePlanos) e acrescenta as linhas no banco de dados com a Clínica.
    3. Mostrar o banco: planos a integrar, integrados, com erro, para revisar.
    4. Integrar os pendentes no Clínica nas Nuvens (fluxo do 'Plano de tratamento.py':
       cadastro + autorização), clínica por clínica.

Não precisa instalar nada além do que os scripts já usam (openpyxl, selenium).

    python app_planos.py
"""
import importlib.util
import json
import os
import re
import shutil
import subprocess
import sys
import threading
import time
import traceback
import unicodedata
import webbrowser
from datetime import datetime
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from io import BytesIO
from pathlib import Path
from urllib.parse import parse_qs, quote, urlparse

import openpyxl
from openpyxl.comments import Comment
from openpyxl.styles import Alignment, Font, PatternFill
from openpyxl.utils import get_column_letter
from openpyxl.worksheet.datavalidation import DataValidation

PASTA = Path(__file__).resolve().parent
PASTA_WEB = PASTA / "web"
# Código em app/, dados (banco, catálogos, importações...) em ../dados — no projeto e no
# pacote para outros computadores. PLANOS_DADOS aponta para outra pasta de dados, se preciso.
PASTA_DADOS = Path(os.environ.get("PLANOS_DADOS") or PASTA.parent / "dados").resolve()
PASTA_IMPORTADOS = PASTA_DADOS / "importados"
PASTA_CONVERSOES = PASTA_DADOS / "conversoes"
PASTA_CATALOGOS = PASTA_DADOS / "catalogos"
PASTA_ERROS = PASTA_DADOS / "erros"
ARQ_CONFIG = PASTA_DADOS / "app_config.json"
PASTA_BACKUPS = PASTA_DADOS / "backups"
ARQ_HISTORICO = PASTA_DADOS / "logs" / "historico_status.jsonl"  # toda mudança de Status feita pelo robô
BACKUPS_MANTIDOS = 30

BANCO = PASTA_DADOS / "Banco de Planos de Tratamento.xlsx"
ABA_PLANO = "Plano de Tratamento"
ABA_REVISAR = "Revisar"
ABA_SEM = "Sem equivalência"
ABA_IMPORTACOES = "Importações"

PORTA = 8765

CLINICAS = [
    "TESTES - GRUPO MANDIC",
    "ARARAS - GRUPO MANDIC",
    "FORTALEZA - GRUPO MANDIC",
    "SÃO PAULO - GRUPO MANDIC",
    "CURITIBA - GRUPO MANDIC",
    "GRANDE VITORIA - GRUPO MANDIC",
    "BRASILIA - GRUPO MANDIC",
    "CAMPINAS - GRUPO MANDIC",
    "BELO HORIZONTE - GRUPO MANDIC",
    "RIO DE JANEIRO - GRUPO MANDIC",
]

# Catálogos (Template Procedimentos, Grupos e Produtos) são procurados nestas pastas;
# os carregados pelo app ficam em PASTA_CATALOGOS
PASTAS_CATALOGO = list(dict.fromkeys([PASTA_CATALOGOS, PASTA_DADOS / "planilhas", PASTA_DADOS,
                                      PASTA.parent.parent / "01.GruposDeEquivalencia"]))

# Abas do catálogo mostradas no app: (chave, aba, [colunas exibidas])
ABAS_CATALOGO = [
    ("procedimentos", "Procedimentos", ["Nome do procedimento", "Especialidades", "Tipo", "Código TUSS", "Valor paciente"]),
    ("grupos", "Procedimentos e Grupos", ["Nome procedimento", "Nome do Grupo", "quantidade", "Produto principal"]),
    ("produtos", "Grupos de equivalencia", ["Nome do Grupos", "IDPRD", "Nome Produto"]),
]

# Colunas comuns às abas do banco (vindas da conversão) e as acrescentadas pelo app
CAB = [("Orçamento", "orc"), ("PG", "pg"), ("Paciente", "paciente"), ("Data Criação", "data"),
       ("Perfil Tratamento", "perfil"), ("Especialidade", "especialidade"),
       ("Coordenador", "coordenador"), ("Aluno Associado", "aluno")]
EXTRAS = [("Clinica", "clinica"), ("Importado em", "importado_em"), ("Arquivo de origem", "arquivo")]

COLUNAS = {
    ABA_PLANO: CAB + [("Procedimento (sistema novo)", "proc"), ("Quantidade", "qtd"),
                      ("Regra aplicada", "regra"), ("Itens de origem", "origem")]
               + EXTRAS[:1] + [("Status", "status"), ("Numero do plano CNN", "numero"), ("Aprovado", "aprovado")]
               + EXTRAS[1:] + [("Resolvido manualmente em", "resolvido_em")],
    ABA_REVISAR: CAB + [("Sugestão", "sugestao"), ("Qtd", "qtd"), ("Candidatos", "candidatos"),
                        ("Motivo", "motivo"), ("Itens de origem", "origem")] + EXTRAS + [("Resolvido", "resolvido")],
    ABA_SEM: CAB + [("Tipo", "tipo"), ("Código", "codigo"), ("Descrição", "desc"), ("Qtd", "qtd"),
                    ("Grupo encontrado", "grupo"), ("Motivo", "motivo")] + EXTRAS + [("Resolvido", "resolvido")],
    ABA_IMPORTACOES: [("Data", "data"), ("Arquivo", "arquivo"), ("Clinica", "clinica"), ("Catálogo", "catalogo"),
                      ("Orçamentos", "orcamentos"), ("Linhas no plano", "plano"), ("Para revisar", "revisar"),
                      ("Sem equivalência", "sem_eq"), ("Orçamentos já existentes (ignorados)", "ignorados"),
                      ("Relatório", "relatorio")],
}
CORES = {ABA_PLANO: "2E7D32", ABA_REVISAR: "EF6C00", ABA_SEM: "C62828", ABA_IMPORTACOES: "455A64"}

STATUS_INTEGRADOS = ("autorizado", "cadastrado", "resolvido manualmente")
STATUS_ERRO = ("erro", "erro autorização")
STATUS_SO_AUTORIZAR = "aguardando autorização"  # nova tentativa só da autorização (fica em A integrar)

trava_banco = threading.Lock()


def texto(valor):
    return str(valor).strip() if valor is not None else ""


def normalizar(valor):
    valor = unicodedata.normalize("NFKD", texto(valor))
    valor = "".join(c for c in valor if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", valor).strip().lower()


def carregar_modulo(nome_arquivo, nome):
    spec = importlib.util.spec_from_file_location(nome, PASTA / nome_arquivo)
    modulo = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(modulo)
    return modulo


transformador = carregar_modulo("TransformadorDePlanos.py", "transformador")
plano_tratamento = carregar_modulo("Plano de tratamento.py", "plano_tratamento")
cofre = carregar_modulo("cofre.py", "cofre")
agendamentos = carregar_modulo("agendamentos.py", "agendamentos")  # tela Agendamentos (coleta do OdontoSig)
agendamentos.configurar(PASTA_DADOS)


# ── Configuração (lembra o último catálogo de cada clínica) ────────────────────

def ler_config():
    try:
        return json.loads(ARQ_CONFIG.read_text(encoding="utf-8"))
    except Exception:
        return {}


trava_config = threading.Lock()


def gravar_config(config):
    # Cópia + os.replace: o arquivo (que guarda as senhas protegidas) nunca fica pela metade
    temporario = ARQ_CONFIG.with_name(f"~tmp_{ARQ_CONFIG.name}")
    temporario.write_text(json.dumps(config, ensure_ascii=False, indent=2), encoding="utf-8")
    os.replace(temporario, ARQ_CONFIG)


# ── Logins e senhas lembrados (protegidos pelo cofre do sistema, ver cofre.py) ─

def credenciais_resumo():
    """O que está salvo, sem nenhuma senha (para a tela montar a lista)."""
    cred = ler_config().get("credenciais") or {}
    return {"suportado": cofre.suportado(), "logins": sorted(cred.get("logins") or {}, key=normalizar),
            "ultimo": cred.get("ultimo") or "", "descontos": sorted(cred.get("descontos") or {})}


def usar_credenciais(usuario):
    """Senha do login escolhido + senhas de desconto salvas."""
    cred = ler_config().get("credenciais") or {}
    usuario = texto(usuario)
    if usuario not in (cred.get("logins") or {}):
        raise ValueError("Esse login não está salvo.")
    senha = cofre.ler(f"login:{usuario}", cred["logins"][usuario])
    if senha is None:
        raise ValueError("Não consegui abrir a senha salva deste login (salva em outro computador ou usuário?). "
                         "Digite de novo com 'Lembrar' ligado.")
    descontos = {}
    for clinica, guardado in (cred.get("descontos") or {}).items():
        valor = cofre.ler(f"desconto:{clinica}", guardado)
        if valor is not None:
            descontos[clinica] = valor
    return {"usuario": usuario, "senha": senha, "descontos": descontos}


def guardar_credenciais(usuario, senha, descontos):
    with trava_config:
        config = ler_config()
        cred = config.setdefault("credenciais", {})
        cred.setdefault("logins", {})[usuario] = cofre.guardar(f"login:{usuario}", senha)
        for clinica, valor in (descontos or {}).items():
            if valor:
                cred.setdefault("descontos", {})[clinica] = cofre.guardar(f"desconto:{clinica}", valor)
        cred["ultimo"] = usuario
        gravar_config(config)


def esquecer_credenciais(dados):
    """{"usuario": X} esquece um login; {"descontos": true} esquece as senhas de desconto."""
    with trava_config:
        config = ler_config()
        cred = config.get("credenciais") or {}
        usuario = texto(dados.get("usuario"))
        if usuario and usuario in (cred.get("logins") or {}):
            cofre.apagar(f"login:{usuario}", cred["logins"].pop(usuario))
            if cred.get("ultimo") == usuario:
                cred["ultimo"] = next(iter(cred["logins"]), "")
            log(f"Login esquecido: {usuario}")
        if dados.get("descontos"):
            for clinica, guardado in (cred.pop("descontos", None) or {}).items():
                cofre.apagar(f"desconto:{clinica}", guardado)
            log("Senhas de desconto esquecidas.")
        config["credenciais"] = cred
        gravar_config(config)
    return credenciais_resumo()


def listar_catalogos():
    catalogos = []
    for pasta in PASTAS_CATALOGO:
        if not pasta.exists():
            continue
        for arq in sorted(pasta.glob("Template Procedimentos*.xlsx")):
            if arq.name.startswith("~$"):
                continue
            catalogos.append({"caminho": str(arq), "nome": arq.name, "pasta": pasta.name,
                              "modificado": datetime.fromtimestamp(arq.stat().st_mtime).strftime("%d/%m/%Y %H:%M")})
    return catalogos


def catalogo_ativo():
    """Caminho do catálogo em uso no app (None se nenhum foi escolhido ou o arquivo sumiu)."""
    caminho = ler_config().get("catalogo_ativo")
    if not caminho:
        return None
    # Gravado relativo à pasta de dados (o app pode ser copiado para outro computador);
    # caminho antigo absoluto que não existe mais: procura o arquivo de mesmo nome em catalogos/
    for candidato in (PASTA_DADOS / caminho, PASTA_CATALOGOS / Path(caminho.replace("\\", "/")).name):
        if candidato.is_file():
            return str(candidato)
    return None


def exigir_catalogo():
    caminho = catalogo_ativo()
    if not caminho:
        raise ValueError("Nenhum catálogo carregado. Carregue a planilha de procedimentos, grupos e produtos na tela Catálogo.")
    return caminho


def validar_catalogo(caminho):
    """Confere se a planilha tem as abas/colunas do catálogo. Devolve as contagens."""
    transformador.print = lambda *a, **k: None
    try:
        grupo_procs, _, procs = transformador.carregar_ficha(str(caminho))
        _, _, _, produtos = transformador.carregar_grupos(str(caminho))
    except KeyError as e:
        raise ValueError(f"A planilha não tem a aba {e} do catálogo.")
    return {"procedimentos": len(procs), "grupos": len(grupo_procs), "produtos": len(produtos)}


def ativar_catalogo(caminho):
    caminho = str(caminho)
    if caminho not in {c["caminho"] for c in listar_catalogos()}:
        raise ValueError("Catálogo não encontrado.")
    contagem = validar_catalogo(caminho)
    with trava_config:
        config = ler_config()
        try:
            config["catalogo_ativo"] = Path(caminho).resolve().relative_to(PASTA_DADOS).as_posix()
        except ValueError:  # catálogo fora da pasta de dados (ex.: pasta 01.GruposDeEquivalencia)
            config["catalogo_ativo"] = caminho
        config["catalogo_ativado_em"] = datetime.now().strftime("%d/%m/%Y %H:%M")
        gravar_config(config)
    log(f"Catálogo em uso: {Path(caminho).name} ({contagem['procedimentos']} procedimentos, "
        f"{contagem['grupos']} grupos, {contagem['produtos']} produtos)")
    return contagem


def carregar_catalogo(conteudo, nome_arquivo):
    """Guarda a planilha enviada em PASTA_CATALOGOS e passa a usá-la como catálogo do app."""
    if not nome_arquivo.lower().endswith((".xlsx", ".xlsm")):
        raise ValueError("O catálogo precisa ser uma planilha .xlsx")
    PASTA_CATALOGOS.mkdir(exist_ok=True)
    nome = re.sub(r"[^\w\-., ]+", "_", Path(nome_arquivo).stem)
    if not nome.startswith("Template Procedimentos"):  # listar_catalogos procura por este começo
        nome = f"Template Procedimentos - {nome}"
    destino = PASTA_CATALOGOS / f"{nome} ({datetime.now():%Y-%m-%d %H%M}).xlsx"
    destino.write_bytes(conteudo)
    try:
        validar_catalogo(destino)
    except Exception:
        destino.unlink(missing_ok=True)
        raise
    return {**ativar_catalogo(destino), "nome": destino.name}


cache_catalogo = {}


def dados_catalogo(aba):
    """Linhas de uma aba do catálogo ativo para a tela (só as colunas de ABAS_CATALOGO)."""
    caminho = exigir_catalogo()
    definicao = next((d for d in ABAS_CATALOGO if d[0] == aba), None)
    if not definicao:
        raise ValueError(f"Aba desconhecida: {aba}")
    chave = (caminho, Path(caminho).stat().st_mtime, aba)
    if chave not in cache_catalogo:
        _, nome_aba, colunas = definicao
        linhas = transformador.ler(caminho, nome_aba, None)
        cabecalho = [transformador.chave(c) for c in linhas[0]] if linhas else []
        posicoes = [(c, cabecalho.index(transformador.chave(c))) for c in colunas if transformador.chave(c) in cabecalho]
        dados = []
        for linha in linhas[1:]:
            item = {c: texto(linha[i]) if i < len(linha) else "" for c, i in posicoes}
            if any(item.values()):
                dados.append(item)
        cache_catalogo[chave] = {"colunas": [c for c, _ in posicoes], "linhas": dados}
    return cache_catalogo[chave]


def info_catalogo():
    caminho = catalogo_ativo()
    info = {"ativo": None, "disponiveis": listar_catalogos()}
    if caminho:
        config = ler_config()
        info["ativo"] = {"caminho": caminho, "nome": Path(caminho).name, "ativado_em": config.get("catalogo_ativado_em", ""),
                         **{d[0]: len(dados_catalogo(d[0])["linhas"]) for d in ABAS_CATALOGO}}
    return info


# ── Banco de dados (planilha) ──────────────────────────────────────────────────

def formatar_cabecalho(ws, colunas, cor):
    for c in ws[1]:
        c.font = Font(bold=True, color="FFFFFF")
        c.fill = PatternFill("solid", fgColor=cor)
    for i, nome in enumerate(colunas, start=1):
        ws.column_dimensions[get_column_letter(i)].width = min(max(12, len(nome) + 4), 45)
    ws.freeze_panes = "A2"


def abrir_banco():
    """Abre o banco (criando-o, ou as abas/colunas que faltarem). Devolve o workbook."""
    if BANCO.exists():
        wb = openpyxl.load_workbook(BANCO)
    else:
        wb = openpyxl.Workbook()
        wb.remove(wb.active)

    for aba, colunas in COLUNAS.items():
        nomes = [n for n, _ in colunas]
        if aba not in wb.sheetnames:
            ws = wb.create_sheet(aba)
            ws.append(nomes)
            formatar_cabecalho(ws, nomes, CORES[aba])
            continue
        ws = wb[aba]
        existentes = [texto(c.value) for c in ws[1]]
        for nome in nomes:
            if nome not in existentes:
                existentes.append(nome)
                ws.cell(row=1, column=len(existentes), value=nome)
    return wb


def banco_aberto_no_excel():
    """True se o Excel (~$arquivo) ou o LibreOffice (.~lock.arquivo#) está com o banco aberto.

    Com o banco aberto, o que o app grava pode ser perdido: ao salvar, o Excel escreve
    por cima a versão que ele carregou (no Mac não há trava; no Windows, o app nem grava)."""
    return any((BANCO.parent / nome).exists() for nome in (f"~${BANCO.name}", f".~lock.{BANCO.name}#"))


def salvar_banco(wb):
    if banco_aberto_no_excel():
        raise ValueError("O banco está aberto no Excel. Feche a planilha e tente de novo "
                         "(senão, ao salvar no Excel, as alterações do app se perdem).")
    # Cópia + os.replace: uma interrupção no meio nunca corrompe o banco
    temporario = BANCO.with_name(f"~tmp_{BANCO.name}")
    wb.save(temporario)
    with open(temporario, "rb+") as f:
        os.fsync(f.fileno())  # garante no disco antes da troca (queda de energia)
    for tentativa in range(5):
        try:
            os.replace(temporario, BANCO)
            return
        except PermissionError:
            # Windows: Excel, OneDrive ou antivírus segurando o arquivo por um instante
            time.sleep(1)
    temporario.unlink(missing_ok=True)
    raise ValueError("Não consegui gravar o banco: o arquivo está travado por outro programa "
                     "(Excel, OneDrive, antivírus). Feche-o e tente de novo.")


def fazer_backup(motivo):
    """Cópia datada do banco em dados/backups (mantém as BACKUPS_MANTIDOS mais recentes)."""
    if not BANCO.exists():
        return
    try:
        PASTA_BACKUPS.mkdir(parents=True, exist_ok=True)
        with trava_banco:
            destino = PASTA_BACKUPS / f"Banco {datetime.now():%Y-%m-%d %H%M%S} ({motivo}).xlsx"
            shutil.copy2(BANCO, destino)
        for antigo in sorted(PASTA_BACKUPS.glob("Banco *.xlsx"))[:-BACKUPS_MANTIDOS]:
            antigo.unlink(missing_ok=True)
    except Exception as e:
        log(f"Atenção: não consegui fazer o backup do banco ({motivo}): {e}")


def ler_aba_banco(aba):
    """Linhas da aba como lista de dicts {nome da coluna: valor} (+ '_linha')."""
    with trava_banco:
        if not BANCO.exists():
            return []
        conteudo = BANCO.read_bytes()
    wb = openpyxl.load_workbook(BytesIO(conteudo), read_only=True, data_only=True)
    try:
        if aba not in wb.sheetnames:
            return []
        linhas = wb[aba].iter_rows(values_only=True)
        cabecalho = [texto(c) for c in next(linhas, [])]
        dados = []
        for num, linha in enumerate(linhas, start=2):
            if not any(v not in (None, "") for v in linha):
                continue
            item = {cabecalho[i]: linha[i] for i in range(min(len(cabecalho), len(linha))) if cabecalho[i]}
            item["_linha"] = num
            dados.append(item)
        return dados
    finally:
        wb.close()


def acrescentar(ws, colunas, linhas):
    cabecalho = [texto(c.value) for c in ws[1]]
    for linha in linhas:
        valores = [None] * len(cabecalho)
        for nome, chave in colunas:
            valor = linha.get(chave, "")
            valores[cabecalho.index(nome)] = valor if valor != "" else None
        ws.append(valores)


def orcamentos_existentes(wb):
    """{(clínica normalizada, orçamento)} já presentes em qualquer aba do banco."""
    existentes = set()
    for aba in (ABA_PLANO, ABA_REVISAR, ABA_SEM):
        ws = wb[aba]
        cabecalho = [texto(c.value) for c in ws[1]]
        i_orc, i_cli = cabecalho.index("Orçamento"), cabecalho.index("Clinica")
        for linha in ws.iter_rows(min_row=2, values_only=True):
            if linha[i_orc] not in (None, ""):
                existentes.add((normalizar(linha[i_cli]), texto(linha[i_orc])))
    return existentes


# ── Importação ─────────────────────────────────────────────────────────────────

def importar(conteudo, nome_arquivo, clinica):
    if clinica not in CLINICAS:
        raise ValueError(f"Clínica inválida: {clinica}")
    catalogo = exigir_catalogo()
    if not nome_arquivo.lower().endswith((".xlsx", ".xlsm")):
        raise ValueError("A planilha de origem precisa ser .xlsx")

    agora = datetime.now()
    PASTA_IMPORTADOS.mkdir(exist_ok=True)
    nome_seguro = re.sub(r"[^\w\-. ]+", "_", Path(nome_arquivo).name)
    origem = PASTA_IMPORTADOS / f"{agora:%Y%m%d_%H%M%S}_{nome_seguro}"
    origem.write_bytes(conteudo)

    log(f"Convertendo {nome_arquivo} para {clinica} (catálogo: {Path(catalogo).name})")
    avisos = []
    transformador.print = lambda *a, **k: avisos.append(" ".join(str(x) for x in a))
    resultado = transformador.converter(str(origem), catalogo)
    for aviso in avisos:
        log(f"  {aviso}")

    # Relatório completo da conversão (mesmo formato do TransformadorDePlanos)
    PASTA_CONVERSOES.mkdir(exist_ok=True)
    relatorio = PASTA_CONVERSOES / f"Conversao_{agora:%Y%m%d_%H%M%S}_{re.sub(r'[^A-Za-z0-9]+', '_', clinica)}.xlsx"
    transformador.salvar(resultado["itens"], resultado["plano"], resultado["revisar"], resultado["sem_eq"], str(relatorio))

    fazer_backup("antes de importar")
    with trava_banco:
        if integracao["rodando"]:
            raise ValueError("Há uma integração em andamento. Aguarde terminar para importar.")
        wb = abrir_banco()
        existentes = orcamentos_existentes(wb)

        extras = {"clinica": clinica, "importado_em": agora.strftime("%d/%m/%Y %H:%M"), "arquivo": Path(nome_arquivo).name}
        ignorados = set()

        def novos(linhas):
            saida = []
            for linha in linhas:
                if (normalizar(clinica), texto(linha["orc"])) in existentes:
                    ignorados.add(texto(linha["orc"]))
                    continue
                saida.append({**linha, **extras})
            return saida

        plano, revisar, sem_eq = novos(resultado["plano"]), novos(resultado["revisar"]), novos(resultado["sem_eq"])
        acrescentar(wb[ABA_PLANO], COLUNAS[ABA_PLANO], plano)
        acrescentar(wb[ABA_REVISAR], COLUNAS[ABA_REVISAR], revisar)
        acrescentar(wb[ABA_SEM], COLUNAS[ABA_SEM], sem_eq)

        resumo = {"data": agora.strftime("%d/%m/%Y %H:%M"), "arquivo": Path(nome_arquivo).name, "clinica": clinica,
                  "catalogo": Path(catalogo).name, "orcamentos": resultado["orcamentos"], "plano": len(plano),
                  "revisar": len(revisar), "sem_eq": len(sem_eq), "ignorados": len(ignorados),
                  "relatorio": relatorio.name}
        acrescentar(wb[ABA_IMPORTACOES], COLUNAS[ABA_IMPORTACOES], [resumo])
        salvar_banco(wb)

    log(f"Importação concluída: {len(plano)} linha(s) no plano, {len(revisar)} para revisar, "
        f"{len(sem_eq)} sem equivalência, {len(ignorados)} orçamento(s) já existentes ignorados.")
    return {**resumo, "avisos": avisos}


# ── Aprovação e plano manual ───────────────────────────────────────────────────

def aprovar(planos, aprovado):
    """Marca/desmarca 'Aprovado' nas linhas pendentes dos planos [{clinica, pg, perfil}]."""
    chaves = {(normalizar(p.get("clinica")), texto(p.get("pg")), normalizar(p.get("perfil"))) for p in planos}
    if not chaves:
        raise ValueError("Nenhum plano selecionado.")
    with trava_banco:
        wb = abrir_banco()
        ws = wb[ABA_PLANO]
        cabecalho = [texto(c.value) for c in ws[1]]
        i_cli, i_pg, i_perfil = cabecalho.index("Clinica"), cabecalho.index("PG"), cabecalho.index("Perfil Tratamento")
        i_status, i_aprovado = cabecalho.index("Status"), cabecalho.index("Aprovado")
        alteradas = 0
        for linha in ws.iter_rows(min_row=2):
            chave = (normalizar(linha[i_cli].value), texto(linha[i_pg].value), normalizar(linha[i_perfil].value))
            if chave in chaves and categoria(linha[i_status].value) == "pendentes":
                linha[i_aprovado].value = "Sim" if aprovado else None
                alteradas += 1
        salvar_banco(wb)
    log(f"{'Aprovado(s)' if aprovado else 'Aprovação removida de'} {len(chaves)} plano(s) ({alteradas} linha(s)).")
    return {"planos": len(chaves), "linhas": alteradas}


def resolver_erro(dados):
    """Plano com erro: 'tentar' devolve para A integrar (aprovado); 'manual' tira da fila.

    Plano que já foi criado no sistema (erro na autorização) não é cadastrado de novo:
    volta como 'aguardando autorização' e o robô só autoriza, pelo N° do plano.
    """
    acao = dados.get("acao")
    if acao not in ("tentar", "manual"):
        raise ValueError("Ação inválida.")
    alvo = (normalizar(dados.get("clinica")), texto(dados.get("pg")), normalizar(dados.get("perfil")))
    numero_informado = re.sub(r"\D", "", texto(dados.get("numero")))
    with trava_banco:
        wb = abrir_banco()
        ws = wb[ABA_PLANO]
        cab = [texto(c.value) for c in ws[1]]
        col = {nome: cab.index(nome) for nome in ("Clinica", "PG", "Perfil Tratamento", "Status",
                                                    "Numero do plano CNN", "Aprovado", "Resolvido manualmente em")}
        linhas = [l for l in ws.iter_rows(min_row=2)
                  if (normalizar(l[col["Clinica"]].value), texto(l[col["PG"]].value),
                      normalizar(l[col["Perfil Tratamento"]].value)) == alvo
                  and texto(l[col["Status"]].value).lower() in STATUS_ERRO]
        if not linhas:
            raise ValueError("Plano com erro não encontrado (a lista pode estar desatualizada).")
        numero = numero_informado or next((texto(l[col["Numero do plano CNN"]].value) for l in linhas
                                           if texto(l[col["Numero do plano CNN"]].value)), "")
        ja_criado = any(texto(l[col["Status"]].value).lower() == "erro autorização" for l in linhas)

        if acao == "tentar":
            if ja_criado and not numero:
                raise ValueError("Este plano já foi criado no sistema, mas sem o N° do plano. "
                                 "Informe o N° para o robô só autorizar.")
            novo_status = STATUS_SO_AUTORIZAR if ja_criado else None
        else:
            novo_status = "resolvido manualmente"
        agora = datetime.now().strftime("%d/%m/%Y %H:%M")
        for l in linhas:
            l[col["Status"]].value = novo_status
            if numero:
                l[col["Numero do plano CNN"]].value = int(numero) if numero.isdigit() else numero
            if acao == "tentar":
                l[col["Aprovado"]].value = "Sim"
            else:
                l[col["Resolvido manualmente em"]].value = agora
        salvar_banco(wb)

    quem = f"{texto(dados.get('perfil'))} · PG {texto(dados.get('pg'))} · {texto(dados.get('clinica'))}"
    if acao == "manual":
        log(f"Plano resolvido manualmente: {quem}" + (f" · N° {numero}" if numero else ""))
        mensagem = "Plano marcado como resolvido manualmente."
    elif ja_criado:
        log(f"Plano volta para A integrar só para autorizar (N° {numero}): {quem}")
        mensagem = f"Plano N° {numero} volta para A integrar: o robô só vai autorizar."
    else:
        log(f"Plano volta para A integrar para cadastrar de novo: {quem}")
        mensagem = "Plano volta para A integrar, já aprovado."
    return {"mensagem": mensagem, "linhas": len(linhas)}


cache_procedimentos = {}


def procedimentos_do_catalogo(catalogo=None):
    """Nomes dos procedimentos do catálogo (aba Procedimentos + Procedimentos e Grupos)."""
    arq = Path(catalogo or exigir_catalogo())
    if not arq.is_file():
        raise ValueError("Catálogo não encontrado.")
    chave = (str(arq), arq.stat().st_mtime)
    if chave not in cache_procedimentos:
        transformador.print = lambda *a, **k: None
        _, _, procs = transformador.carregar_ficha(str(arq))
        cache_procedimentos[chave] = sorted(set(procs.values()), key=normalizar)
    return cache_procedimentos[chave]


def validar_procedimentos(procedimentos):
    """[(nome com a grafia do catálogo, quantidade)] — falha se algum não existir no catálogo ativo."""
    conhecidos = {normalizar(n): n for n in procedimentos_do_catalogo()}
    validados = []
    for p in procedimentos:
        nome = texto(p.get("nome"))
        if normalizar(nome) not in conhecidos:
            raise ValueError(f'O procedimento "{nome}" não existe no catálogo.')
        nome = conhecidos[normalizar(nome)]  # grafia exata do sistema
        try:
            quantidade = int(p.get("quantidade") or 0)
        except (TypeError, ValueError):
            quantidade = 0
        if not 1 <= quantidade <= 100:
            raise ValueError(f'Quantidade de "{nome}" precisa ser de 1 a 100.')
        validados.append((nome, quantidade))
    return validados


def mover_para_integrar(dados):
    """Leva um item de Revisar/Sem equivalência para a aba Plano de Tratamento com os
    procedimentos escolhidos, e marca o item de origem como resolvido."""
    aba = {"revisar": ABA_REVISAR, "sem_eq": ABA_SEM}.get(dados.get("aba"))
    if not aba:
        raise ValueError("Origem inválida.")
    procedimentos = [p for p in dados.get("procedimentos") or [] if texto(p.get("nome"))]
    if not procedimentos:
        raise ValueError("Escolha pelo menos um procedimento.")
    validados = validar_procedimentos(procedimentos)
    num_linha = int(dados.get("linha") or 0)
    agora = datetime.now()

    with trava_banco:
        wb = abrir_banco()
        ws = wb[aba]
        cabecalho = [texto(c.value) for c in ws[1]]
        if not 2 <= num_linha <= ws.max_row:
            raise ValueError("Item não encontrado no banco.")
        origem = {cabecalho[i]: c.value for i, c in enumerate(ws[num_linha]) if i < len(cabecalho)}
        # Confere que é o mesmo item mostrado na tela (o banco pode ter sido editado no Excel)
        if texto(origem.get("Orçamento")) != texto(dados.get("orcamento")) or texto(origem.get("PG")) != texto(dados.get("pg")):
            raise ValueError("O banco mudou desde que a lista foi carregada. Atualize a página e tente de novo.")
        if texto(origem.get("Resolvido")):
            raise ValueError(f"Este item já foi resolvido: {texto(origem.get('Resolvido'))}")

        if aba == ABA_REVISAR:
            itens_origem = texto(origem.get("Itens de origem"))
        else:
            itens_origem = f"{texto(origem.get('Qtd'))}x {texto(origem.get('Descrição'))}"
        base = {
            "orc": origem.get("Orçamento"), "pg": origem.get("PG"), "paciente": origem.get("Paciente"),
            "data": origem.get("Data Criação"), "perfil": origem.get("Perfil Tratamento"),
            "especialidade": origem.get("Especialidade"), "coordenador": origem.get("Coordenador"),
            "aluno": origem.get("Aluno Associado"), "origem": itens_origem,
            "regra": f"revisão manual ({aba})", "clinica": origem.get("Clinica"),
            "aprovado": "Sim" if dados.get("aprovado") else "",
            "importado_em": agora.strftime("%d/%m/%Y %H:%M"), "arquivo": origem.get("Arquivo de origem"),
        }
        acrescentar(wb[ABA_PLANO], COLUNAS[ABA_PLANO], [{**base, "proc": nome, "qtd": qtd} for nome, qtd in validados])

        resumo = "; ".join(f"{qtd}x {nome}" for nome, qtd in validados)
        ws.cell(row=num_linha, column=cabecalho.index("Resolvido") + 1,
                value=f"Movido para A integrar em {agora:%d/%m/%Y %H:%M}: {resumo}")

        # Aviso: o paciente já tem um plano com este perfil integrado -> será criado outro plano
        ws_plano = wb[ABA_PLANO]
        cab_plano = [texto(c.value) for c in ws_plano[1]]
        chave = (normalizar(base["clinica"]), texto(base["pg"]), normalizar(base["perfil"]))
        ja_integrado = any(
            (normalizar(l[cab_plano.index("Clinica")]), texto(l[cab_plano.index("PG")]),
             normalizar(l[cab_plano.index("Perfil Tratamento")])) == chave
            and categoria(l[cab_plano.index("Status")]) == "integrados"
            for l in ws_plano.iter_rows(min_row=2, values_only=True)
        )
        salvar_banco(wb)

    log(f"Movido para A integrar ({aba}): {texto(base['paciente'])} (PG {texto(base['pg'])}) · "
        f"{texto(base['perfil'])} · {resumo}")
    aviso = (f"O paciente já tem um plano '{texto(base['perfil'])}' integrado: este item vai gerar um novo plano."
             if ja_integrado else "")
    return {"procedimentos": len(validados), "aviso": aviso}


def editar_plano(dados):
    """Troca os procedimentos/quantidades de um plano em A integrar (ainda não criado no sistema).

    Reaproveita as linhas do plano na ordem; procedimentos a mais viram linhas novas (cópia da
    1ª linha) e linhas que sobram são esvaziadas — não apagadas, para não mudar o número das
    outras linhas, que o histórico do robô usa para recuperar Status."""
    alvo = (normalizar(dados.get("clinica")), texto(dados.get("pg")), normalizar(dados.get("perfil")))
    procedimentos = [p for p in dados.get("procedimentos") or [] if texto(p.get("nome"))]
    if not procedimentos:
        raise ValueError("O plano precisa de pelo menos um procedimento.")
    validados = validar_procedimentos(procedimentos)
    agora = datetime.now()

    with trava_banco:
        if integracao["rodando"]:
            raise ValueError("Há uma integração em andamento. Aguarde terminar para editar o plano.")
        wb = abrir_banco()
        ws = wb[ABA_PLANO]
        cab = [texto(c.value) for c in ws[1]]
        col = {nome: cab.index(nome) for nome in ("Clinica", "PG", "Perfil Tratamento", "Status", "Aprovado",
                                                    "Procedimento (sistema novo)", "Quantidade", "Regra aplicada")}
        linhas = [l for l in ws.iter_rows(min_row=2)
                  if (normalizar(l[col["Clinica"]].value), texto(l[col["PG"]].value),
                      normalizar(l[col["Perfil Tratamento"]].value)) == alvo
                  and categoria(l[col["Status"]].value) == "pendentes"]
        # Confere que é o mesmo plano mostrado na tela (o banco pode ter sido editado no Excel)
        if not linhas or sorted(l[0].row for l in linhas) != sorted(int(n) for n in dados.get("linhas") or []):
            raise ValueError("O banco mudou desde que a lista foi carregada. Atualize a página e tente de novo.")
        if any(texto(l[col["Status"]].value) for l in linhas):
            raise ValueError("Este plano já foi criado no sistema (aguardando só a autorização): "
                             "os procedimentos não podem mais ser alterados por aqui.")

        aprovado = "Sim" if dados.get("aprovado") else None
        regra = f"editado no app em {agora:%d/%m/%Y %H:%M}"
        modelo = [c.value for c in linhas[0]]
        for i, (nome, qtd) in enumerate(validados):
            if i < len(linhas):
                linha = linhas[i]
                mudou = (texto(linha[col["Procedimento (sistema novo)"]].value) != nome
                         or texto(linha[col["Quantidade"]].value) != str(qtd))
                linha[col["Procedimento (sistema novo)"]].value = nome
                linha[col["Quantidade"]].value = qtd
                linha[col["Aprovado"]].value = aprovado
                if mudou:
                    linha[col["Regra aplicada"]].value = regra
            else:
                nova = list(modelo)
                nova[col["Procedimento (sistema novo)"]] = nome
                nova[col["Quantidade"]] = qtd
                nova[col["Aprovado"]] = aprovado
                nova[col["Regra aplicada"]] = regra
                ws.append(nova)
        for linha in linhas[len(validados):]:
            for c in linha:
                c.value = None
        salvar_banco(wb)

    resumo = "; ".join(f"{qtd}x {nome}" for nome, qtd in validados)
    log(f"Plano editado: {texto(dados.get('perfil'))} · PG {texto(dados.get('pg'))} · "
        f"{texto(dados.get('clinica'))} · {resumo}" + (" · aprovado" if aprovado else ""))
    return {"procedimentos": len(validados)}


def descrever_item(aba, item):
    """Texto dos itens de origem de uma linha de Revisar / Sem equivalência."""
    if aba == ABA_REVISAR:
        return texto(item.get("Itens de origem"))
    return f"{texto(item.get('Qtd'))}x {texto(item.get('Descrição'))}"


def itens_do_paciente(clinica, pg):
    """Itens ainda não resolvidos de Revisar e Sem equivalência de um paciente (Clínica + PG)."""
    chave = (normalizar(clinica), texto(pg))
    itens = []
    for aba, nome in ((ABA_REVISAR, "revisar"), (ABA_SEM, "sem_eq")):
        for linha in ler_aba_banco(aba):
            if texto(linha.get("Resolvido")) or (normalizar(linha.get("Clinica")), texto(linha.get("PG"))) != chave:
                continue
            item = {k: (v.strftime("%d/%m/%Y") if isinstance(v, datetime) else texto(v)) for k, v in linha.items()}
            item["_aba"] = nome
            item["_descricao"] = descrever_item(aba, linha)
            itens.append(item)
    # Planos do paciente já no banco (para avisar quando o perfil escolhido juntar com um deles)
    planos = [{"perfil": p["perfil"], "categoria": p["categoria"], "numero": p["numero"]}
              for p in planos_do_banco() if (normalizar(p["clinica"]), p["pg"]) == chave]
    return {"itens": itens, "planos": planos}


def itens_por_paciente():
    """{"Clínica|PG": nº de itens não resolvidos em Revisar + Sem equivalência} (só pacientes com 2 ou mais)."""
    contagem = {}
    for aba in (ABA_REVISAR, ABA_SEM):
        for linha in ler_aba_banco(aba):
            if not texto(linha.get("Resolvido")):
                chave = f"{texto(linha.get('Clinica'))}|{texto(linha.get('PG'))}"
                contagem[chave] = contagem.get(chave, 0) + 1
    return {k: n for k, n in contagem.items() if n > 1}


def mesclar(dados):
    """Junta vários itens de Revisar / Sem equivalência de um mesmo paciente (de um ou mais
    orçamentos) num único plano de tratamento na aba Plano de Tratamento, e marca todos
    os itens de origem como resolvidos."""
    selecionados = dados.get("itens") or []
    if not selecionados:
        raise ValueError("Selecione pelo menos um item para mesclar.")
    perfil = texto(dados.get("perfil")).upper()[:30]
    if not perfil:
        raise ValueError("Informe o perfil de tratamento do plano mesclado.")
    procedimentos = [p for p in dados.get("procedimentos") or [] if texto(p.get("nome"))]
    if not procedimentos:
        raise ValueError("Escolha pelo menos um procedimento.")
    # Mesmo procedimento em mais de uma linha: soma as quantidades
    somados = {}
    for nome, qtd in validar_procedimentos(procedimentos):
        somados[nome] = somados.get(nome, 0) + qtd
    if any(q > 100 for q in somados.values()):
        raise ValueError("A quantidade somada de um procedimento passou de 100.")
    validados = list(somados.items())
    abas = {"revisar": ABA_REVISAR, "sem_eq": ABA_SEM}
    agora = datetime.now()

    with trava_banco:
        wb = abrir_banco()
        origens = []
        for sel in selecionados:
            aba = abas.get(sel.get("aba"))
            if not aba:
                raise ValueError("Origem inválida.")
            ws = wb[aba]
            cabecalho = [texto(c.value) for c in ws[1]]
            num_linha = int(sel.get("linha") or 0)
            if not 2 <= num_linha <= ws.max_row:
                raise ValueError("Item não encontrado no banco.")
            item = {cabecalho[i]: c.value for i, c in enumerate(ws[num_linha]) if i < len(cabecalho)}
            # Confere que é o mesmo item mostrado na tela (o banco pode ter sido editado no Excel)
            if texto(item.get("Orçamento")) != texto(sel.get("orcamento")):
                raise ValueError("O banco mudou desde que a lista foi carregada. Atualize a página e tente de novo.")
            if texto(item.get("Resolvido")):
                raise ValueError(f"O item do orçamento {texto(item.get('Orçamento'))} já foi resolvido: "
                                 f"{texto(item.get('Resolvido'))}")
            origens.append((ws, cabecalho, num_linha, aba, item))

        pacientes = {(normalizar(i.get("Clinica")), texto(i.get("PG"))) for *_, i in origens}
        if len(pacientes) > 1:
            raise ValueError("Só dá para mesclar itens do mesmo paciente (mesma clínica e PG).")

        primeiro = origens[0][4]
        orcamentos = list(dict.fromkeys(texto(i.get("Orçamento")) for *_, i in origens if texto(i.get("Orçamento"))))
        base = {
            "orc": ", ".join(orcamentos), "pg": primeiro.get("PG"), "paciente": primeiro.get("Paciente"),
            "data": primeiro.get("Data Criação"), "perfil": perfil,
            # Especialidade / coordenador / aluno: o primeiro preenchido entre os itens
            **{chave: next((i.get(col) for *_, i in origens if texto(i.get(col))), None)
               for chave, col in (("especialidade", "Especialidade"), ("coordenador", "Coordenador"),
                                  ("aluno", "Aluno Associado"))},
            "origem": " | ".join(d for d in (descrever_item(a, i) for *_, a, i in origens) if d),
            "regra": f"mescla de {len(origens)} item(ns)", "clinica": primeiro.get("Clinica"),
            "aprovado": "Sim" if dados.get("aprovado") else "",
            "importado_em": agora.strftime("%d/%m/%Y %H:%M"), "arquivo": primeiro.get("Arquivo de origem"),
        }
        acrescentar(wb[ABA_PLANO], COLUNAS[ABA_PLANO], [{**base, "proc": nome, "qtd": qtd} for nome, qtd in validados])

        resumo = "; ".join(f"{qtd}x {nome}" for nome, qtd in validados)
        for ws, cabecalho, num_linha, _, _ in origens:
            ws.cell(row=num_linha, column=cabecalho.index("Resolvido") + 1,
                    value=f"Mesclado no plano '{perfil}' em {agora:%d/%m/%Y %H:%M}: {resumo}")

        # Avisos: o perfil escolhido junta com um plano pendente ou repete um já integrado
        chave = (normalizar(base["clinica"]), texto(base["pg"]), normalizar(perfil))
        ws_plano = wb[ABA_PLANO]
        cab_plano = [texto(c.value) for c in ws_plano[1]]
        categorias = {
            categoria(l[cab_plano.index("Status")])
            for l in ws_plano.iter_rows(min_row=2, max_row=ws_plano.max_row - len(validados), values_only=True)
            if (normalizar(l[cab_plano.index("Clinica")]), texto(l[cab_plano.index("PG")]),
                normalizar(l[cab_plano.index("Perfil Tratamento")])) == chave
        }
        salvar_banco(wb)

    log(f"Mesclados {len(origens)} item(ns) de {texto(base['paciente'])} (PG {texto(base['pg'])}) · "
        f"orçamento(s) {base['orc']} · plano '{perfil}' · {resumo}")
    avisos = []
    if "pendentes" in categorias:
        avisos.append(f"O paciente já tinha um plano '{perfil}' a integrar: os procedimentos foram somados a ele.")
    if "integrados" in categorias or "erros" in categorias:
        avisos.append(f"O paciente já tem um plano '{perfil}' criado no sistema: este vai gerar um novo plano.")
    return {"itens": len(origens), "procedimentos": len(validados), "aviso": " ".join(avisos)}


def adicionar_manual(dados):
    """Acrescenta um plano digitado na tela (uma linha por procedimento) na aba Plano de Tratamento."""
    clinica = texto(dados.get("clinica"))
    if clinica not in CLINICAS:
        raise ValueError("Selecione a clínica.")
    # Flexível no que recebe: PG com espaços/pontos ("321.825"), nomes em minúsculas
    dados["pg"] = re.sub(r"[\s.\-]", "", texto(dados.get("pg")))
    dados["paciente"] = texto(dados.get("paciente")).upper()
    dados["perfil"] = texto(dados.get("perfil")).upper()[:30]
    for campo, rotulo in (("pg", "PG"), ("paciente", "Paciente"), ("perfil", "Perfil de tratamento")):
        if not texto(dados.get(campo)):
            raise ValueError(f"Preencha o campo {rotulo}.")

    procedimentos = [p for p in dados.get("procedimentos") or [] if texto(p.get("nome"))]
    if not procedimentos:
        raise ValueError("Adicione pelo menos um procedimento.")

    linhas = []
    agora = datetime.now()
    orcamento = texto(dados.get("orcamento")) or f"MANUAL-{agora:%Y%m%d%H%M%S}"
    for nome, quantidade in validar_procedimentos(procedimentos):
        linhas.append({
            "orc": orcamento, "pg": texto(dados["pg"]), "paciente": texto(dados["paciente"]),
            "data": agora.strftime("%d/%m/%Y"), "perfil": texto(dados["perfil"]),
            "especialidade": texto(dados.get("especialidade")), "coordenador": texto(dados.get("coordenador")),
            "aluno": texto(dados.get("aluno")), "proc": nome, "qtd": quantidade, "regra": "cadastro manual",
            "origem": "", "clinica": clinica, "aprovado": "Sim" if dados.get("aprovado") else "",
            "importado_em": agora.strftime("%d/%m/%Y %H:%M"), "arquivo": "Cadastro manual",
        })

    with trava_banco:
        wb = abrir_banco()
        acrescentar(wb[ABA_PLANO], COLUNAS[ABA_PLANO], linhas)
        salvar_banco(wb)

    log(f"Plano manual adicionado: {texto(dados['paciente'])} (PG {texto(dados['pg'])}) · {texto(dados['perfil'])} · "
        f"{len(linhas)} procedimento(s) · {clinica}" + (" · aprovado" if dados.get("aprovado") else ""))
    return {"linhas": len(linhas), "orcamento": orcamento}


# ── Template para os colaboradores ─────────────────────────────────────────────

DESCRICOES_ORIGEM = {
    "ORCAMENTO_REAL": ("Número do orçamento. Todas as linhas do mesmo orçamento viram um plano por perfil.", "1800199"),
    "PG": ("Número de controle (PG) do paciente no Clínica nas Nuvens.", "92110"),
    "Nome_Paciente": ("Nome do paciente.", "MARIA DA SILVA"),
    "Data_Criacao": ("Data de criação do orçamento.", "11/01/2024"),
    "Perfil_Tratamento": ("Perfil do tratamento. Cada perfil vira um plano (ex.: IMPLANTE, PRÓTESE).", "IMPLANTE"),
    "Nome_Especialidade": ("Especialidade do item.", "Implantodontia"),
    "Coordenador": ("Coordenador responsável (usado como profissional se o aluno não for encontrado).", "Fulano de Tal"),
    "Aluno_Associado": ("Aluno responsável (1ª opção de profissional do plano).", "Beltrano de Tal"),
    "tipo_item": ("Produto ou Procedimento.", "Produto"),
    "codigo_produto": ("Código do produto (TOTVS ou do fabricante). Ajuda a achar o grupo de equivalência.", "01.14.16.00001"),
    "descricao_produto": ("Nome do produto ou procedimento.", "IMPLANTE CONE MORSE 3.5 X 10"),
    "quantidade_produto": ("Quantidade (número inteiro).", "1"),
}


def gerar_template():
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = transformador.ABA_PLANOS
    colunas = transformador.COLS_ORIGEM
    ws.append(colunas)
    formatar_cabecalho(ws, colunas, "1F4E79")
    for i, nome in enumerate(colunas, start=1):
        descricao, _ = DESCRICOES_ORIGEM.get(nome, ("", ""))
        if descricao:
            ws.cell(row=1, column=i).comment = Comment(descricao, "App Planos")
        ws.column_dimensions[get_column_letter(i)].width = max(16, len(nome) + 4)

    i_data = colunas.index("Data_Criacao") + 1
    for linha in range(2, 2001):
        ws.cell(row=linha, column=i_data).number_format = "DD/MM/YYYY"

    tipo = DataValidation(type="list", formula1='"Produto,Procedimento"', allow_blank=True)
    tipo.add(f"{get_column_letter(colunas.index('tipo_item') + 1)}2:{get_column_letter(colunas.index('tipo_item') + 1)}2000")
    quantidade = DataValidation(type="whole", operator="between", formula1="1", formula2="100", allow_blank=True)
    letra_qtd = get_column_letter(colunas.index("quantidade_produto") + 1)
    quantidade.add(f"{letra_qtd}2:{letra_qtd}2000")
    ws.add_data_validation(tipo)
    ws.add_data_validation(quantidade)

    instrucoes = wb.create_sheet("Instruções")
    instrucoes.append(["Como preencher"])
    instrucoes["A1"].font = Font(bold=True, size=14)
    instrucoes.append([f"Preencha a aba \"{transformador.ABA_PLANOS}\": uma linha por produto/procedimento do orçamento. "
                       "Não renomeie as colunas nem a aba."])
    instrucoes.append([])
    instrucoes.append(["Coluna", "O que colocar", "Exemplo"])
    for c in instrucoes[4]:
        c.font = Font(bold=True, color="FFFFFF")
        c.fill = PatternFill("solid", fgColor="1F4E79")
    for nome in colunas:
        descricao, exemplo = DESCRICOES_ORIGEM.get(nome, ("", ""))
        instrucoes.append([nome, descricao, exemplo])
    instrucoes.column_dimensions["A"].width = 22
    instrucoes.column_dimensions["B"].width = 90
    instrucoes.column_dimensions["C"].width = 32
    for linha in instrucoes.iter_rows(min_row=5):
        for c in linha:
            c.alignment = Alignment(wrap_text=True, vertical="top")

    saida = BytesIO()
    wb.save(saida)
    return saida.getvalue()


# ── Visão do banco para a tela ─────────────────────────────────────────────────

def categoria(status):
    status = texto(status).lower()
    if status in STATUS_INTEGRADOS:
        return "integrados"
    if status in STATUS_ERRO:
        return "erros"
    return "pendentes"


def planos_do_banco():
    """Agrupa as linhas da aba Plano de Tratamento em planos (Clínica + PG + Perfil)."""
    planos = {}
    for linha in ler_aba_banco(ABA_PLANO):
        if not texto(linha.get("PG")):
            continue
        chave = (texto(linha.get("Clinica")), texto(linha.get("PG")), texto(linha.get("Perfil Tratamento")),
                 categoria(linha.get("Status")))
        plano = planos.setdefault(chave, {
            "clinica": chave[0], "pg": chave[1], "perfil": chave[2], "categoria": chave[3],
            "paciente": texto(linha.get("Paciente")), "orcamentos": [], "procedimentos": [],
            "status": texto(linha.get("Status")), "numero": texto(linha.get("Numero do plano CNN")),
            "importado_em": texto(linha.get("Importado em")), "linhas": [], "aprovado": True, "itens": [],
        })
        plano["aprovado"] = plano["aprovado"] and normalizar(linha.get("Aprovado")) == "sim"
        orc = texto(linha.get("Orçamento"))
        if orc and orc not in plano["orcamentos"]:
            plano["orcamentos"].append(orc)
        plano["procedimentos"].append(f"{texto(linha.get('Quantidade'))}x {texto(linha.get('Procedimento (sistema novo)'))}")
        plano["itens"].append({"nome": texto(linha.get("Procedimento (sistema novo)")), "qtd": texto(linha.get("Quantidade"))})
        plano["editavel"] = plano.get("editavel", True) and not texto(linha.get("Status"))
        plano["numero"] = plano["numero"] or texto(linha.get("Numero do plano CNN"))
        plano["linhas"].append(linha["_linha"])
    return list(planos.values())


def resumo_banco():
    planos = planos_do_banco()
    por_clinica = {}
    vazio = {"pendentes": 0, "aprovados": 0, "integrados": 0, "erros": 0, "revisar": 0, "sem_eq": 0}
    for p in planos:
        contagem = por_clinica.setdefault(p["clinica"] or "(sem clínica)", dict(vazio))
        contagem[p["categoria"]] += 1
        if p["categoria"] == "pendentes" and p["aprovado"]:
            contagem["aprovados"] += 1
    for aba, chave in ((ABA_REVISAR, "revisar"), (ABA_SEM, "sem_eq")):
        for linha in ler_aba_banco(aba):
            if texto(linha.get("Resolvido")):
                continue
            contagem = por_clinica.setdefault(texto(linha.get("Clinica")) or "(sem clínica)", dict(vazio))
            contagem[chave] += 1
    return por_clinica


def linhas_tabela(aba):
    if aba in ("pendentes", "integrados", "erros"):
        return [p for p in planos_do_banco() if p["categoria"] == aba]
    nome = {"revisar": ABA_REVISAR, "sem_eq": ABA_SEM, "importacoes": ABA_IMPORTACOES}.get(aba)
    if not nome:
        raise ValueError(f"Aba desconhecida: {aba}")
    return [{k: (v.strftime("%d/%m/%Y") if isinstance(v, datetime) else texto(v)) for k, v in linha.items()}
            for linha in ler_aba_banco(nome) if not texto(linha.get("Resolvido"))]


# ── Log e integração ───────────────────────────────────────────────────────────

registro = []          # (nº, hora, texto)
trava_log = threading.Lock()


def log(*args, sep=" ", **_):
    mensagem = sep.join(str(a) for a in args)
    with trava_log:
        for linha in mensagem.split("\n"):
            if not linha.strip():
                continue
            registro.append((len(registro) + 1, datetime.now().strftime("%H:%M:%S"), linha))
        del registro[:-5000]
    sys.__stdout__.write(mensagem + "\n")


integracao = {"rodando": False, "total": 0, "concluidos": 0, "autorizados": 0, "cadastrados": 0, "erros": 0,
              "inicio": None, "fim": None, "clinica": "", "mensagem": ""}


def registrar_historico(plano, linhas, valor, numero):
    """Acrescenta a mudança de Status no histórico (JSONL, gravado antes do banco).

    Se o banco for sobrescrito (ex.: salvo no Excel por cima), o histórico ainda diz quais
    planos já foram criados no sistema e com que número — e reconciliar_historico() recupera."""
    clinica, pg, perfil = plano or ("", "", "")
    registro_json = {"hora": datetime.now().isoformat(timespec="seconds"), "clinica": clinica, "pg": pg,
                     "perfil": perfil, "linhas": sorted(linhas), "status": valor,
                     "numero": None if numero is None else texto(numero)}
    ARQ_HISTORICO.parent.mkdir(parents=True, exist_ok=True)
    with open(ARQ_HISTORICO, "a", encoding="utf-8") as f:
        f.write(json.dumps(registro_json, ensure_ascii=False) + "\n")
        f.flush()
        os.fsync(f.fileno())


def chave_da_linha(cabecalho, valores):
    pega = lambda nome: valores[cabecalho.index(nome)] if nome in cabecalho and cabecalho.index(nome) < len(valores) else None
    return (normalizar(pega("Clinica")), texto(pega("PG")), normalizar(pega("Perfil Tratamento")))


def conferir_linhas(linhas, linha_para_plano):
    """Confere se as linhas do banco ainda são dos planos que o robô carregou.

    Se alguém inseriu, apagou ou ordenou linhas no Excel durante a integração, os números
    mudaram: procura de novo as linhas de cada plano (mesma clínica, PG e perfil, ainda
    não finalizadas). Sem isso o Status iria para os pacientes errados."""
    wb = openpyxl.load_workbook(BytesIO(BANCO.read_bytes()), read_only=True)
    try:
        todas = list(wb[ABA_PLANO].iter_rows(values_only=True))
    finally:
        wb.close()
    cabecalho = [texto(c) for c in todas[0]]
    i_status = cabecalho.index("Status") if "Status" in cabecalho else None
    chave_em = lambda n: chave_da_linha(cabecalho, todas[n - 1]) if 2 <= n <= len(todas) else None

    planos = {}
    for l in linhas:
        plano = linha_para_plano.get(l)
        if plano:
            planos.setdefault(plano, []).append(l)
    corrigidas = []
    for (clinica, pg, perfil), originais in planos.items():
        esperada = (normalizar(clinica), texto(pg), normalizar(perfil))
        if all(chave_em(n) == esperada for n in originais):
            corrigidas += originais
            continue
        achadas = [n for n in range(2, len(todas) + 1) if chave_em(n) == esperada
                   and texto(todas[n - 1][i_status] if i_status is not None and i_status < len(todas[n - 1]) else "").lower()
                   in ("", STATUS_SO_AUTORIZAR, "cadastrado")]
        if not achadas:
            raise plano_tratamento.ErroGravacao(
                f"as linhas do plano '{perfil}' (PG {pg}) não estão mais no banco — ele foi editado durante a integração")
        log(f"  Atenção: as linhas do plano '{perfil}' (PG {pg}) mudaram de posição no banco "
            f"({originais} → {achadas}). O banco foi editado durante a integração?")
        corrigidas += achadas
    return corrigidas or list(linhas)


def reconciliar_historico():
    """Antes de integrar: plano com Status vazio no banco, mas que o histórico diz que já foi
    criado no sistema (cadastrado/autorizado/erro autorização), tem o Status recuperado.
    Acontece quando o banco é sobrescrito (Excel salvo por cima) depois da gravação do robô.
    Sem isso, o plano seria cadastrado de novo no sistema."""
    if not ARQ_HISTORICO.exists() or not BANCO.exists():
        return 0
    ultimo = {}
    for texto_linha in ARQ_HISTORICO.read_text(encoding="utf-8").splitlines():
        try:
            r = json.loads(texto_linha)
        except ValueError:
            continue
        ultimo[(normalizar(r["clinica"]), texto(r["pg"]), normalizar(r["perfil"]), tuple(r["linhas"]))] = r
    criados = [r for r in ultimo.values() if r["status"] in ("cadastrado", "autorizado", "erro autorização")]
    if not criados:
        return 0

    with trava_banco:
        wb = abrir_banco()
        ws = wb[ABA_PLANO]
        cabecalho = [texto(c.value) for c in ws[1]]
        i_status, i_numero = cabecalho.index("Status"), cabecalho.index("Numero do plano CNN")
        recuperados = []
        for r in criados:
            esperada = (normalizar(r["clinica"]), texto(r["pg"]), normalizar(r["perfil"]))
            linhas = r["linhas"]
            if not all(2 <= n <= ws.max_row for n in linhas):
                continue
            valores = [[c.value for c in ws[n]] for n in linhas]
            if all(chave_da_linha(cabecalho, v) == esperada and not texto(v[i_status]) for v in valores):
                numero = r["numero"] or next((h["numero"] for h in reversed(list(ultimo.values()))
                                              if h["linhas"] == linhas and h["numero"]), None)
                for n in linhas:
                    ws.cell(row=n, column=i_status + 1, value=r["status"])
                    if numero:
                        ws.cell(row=n, column=i_numero + 1, value=int(numero) if str(numero).isdigit() else numero)
                recuperados.append(f"{r['perfil']} (PG {r['pg']}, Nº {numero or '?'}) → {r['status']}")
        if recuperados:
            salvar_banco(wb)
    for item in recuperados:
        log(f"Status recuperado do histórico (o banco tinha perdido): {item}")
    return len(recuperados)


def rodar_integracao(opcoes):
    mod = plano_tratamento
    mod.ARQUIVO = BANCO
    mod.PASTA = PASTA_DADOS
    mod.PASTA_ERROS = PASTA_ERROS
    mod.ABA = ABA_PLANO
    mod.FILTRO_CLINICAS = {opcoes["clinica"]} if opcoes.get("clinica") else None
    mod.LIMITE_PACIENTES = opcoes.get("limite") or None
    mod.HEADLESS = bool(opcoes.get("headless"))
    mod.AUTORIZAR_APOS_CADASTRO = bool(opcoes.get("autorizar", True))
    mod.MODO_REVISAO = False
    mod.EXIGIR_APROVACAO = True  # só sobem os planos aprovados no app
    mod.USUARIO_CNN = opcoes["usuario"]
    mod.SENHA_CNN = opcoes["senha"]
    mod.SENHAS_DESCONTO = dict(opcoes.get("senhas_desconto") or {})
    mod.print = log

    # 'Lembrar': guarda login e senhas só depois que o Clínica nas Nuvens aceitar o login
    login_original = getattr(mod, "_fazer_login_original", mod.fazer_login)
    mod._fazer_login_original = login_original
    guardado = []

    def fazer_login(driver, wait):
        login_original(driver, wait)
        if opcoes.get("lembrar") and not guardado:
            guardado.append(True)
            try:
                guardar_credenciais(opcoes["usuario"], opcoes["senha"], opcoes.get("senhas_desconto"))
                log("Login aceito: usuário e senhas guardados no cofre do sistema para as próximas vezes.")
            except Exception as e:
                log(f"Atenção: o login funcionou, mas não consegui guardar as senhas: {e}")

    mod.fazer_login = fazer_login
    mod.PARAR.clear()

    finais = {"autorizado", "erro", "erro autorização"} | (set() if mod.AUTORIZAR_APOS_CADASTRO else {"cadastrado"})
    linha_para_plano = {}
    feitos = set()

    original = getattr(mod, "_marcar_status_original", mod.marcar_status)
    mod._marcar_status_original = original

    def marcar_status(linhas, valor, numero_plano=None):
        # 1º o histórico (não depende do Excel), depois o banco, conferindo as linhas
        for plano in {linha_para_plano.get(l) for l in linhas}:
            registrar_historico(plano, [l for l in linhas if linha_para_plano.get(l) == plano], valor, numero_plano)
        with trava_banco:
            if banco_aberto_no_excel():
                log("  Atenção: o banco está aberto no Excel. NÃO salve a planilha no Excel até a integração "
                    "terminar — senão o Status gravado agora se perde.")
            try:
                corrigidas = conferir_linhas(linhas, linha_para_plano)
                if sorted(corrigidas) != sorted(linhas):
                    # As linhas mudaram de lugar: o histórico passa a apontar para as posições novas
                    for plano in {linha_para_plano.get(l) for l in linhas}:
                        novas = [n for n in corrigidas if n not in linhas] or corrigidas
                        registrar_historico(plano, novas, valor, numero_plano)
                original(corrigidas, valor, numero_plano=numero_plano)
            except Exception as e:
                mod.PARAR.set()
                if isinstance(e, mod.ErroGravacao):
                    raise
                raise mod.ErroGravacao(f"{type(e).__name__}: {e}") from e
        planos = {linha_para_plano.get(l) for l in linhas} - {None}
        with trava_log:
            if valor == "autorizado":
                integracao["autorizados"] += len(planos)
            elif valor == "cadastrado":
                integracao["cadastrados"] += len(planos)
            elif valor in STATUS_ERRO:
                integracao["erros"] += len(planos)
            if valor in finais:
                feitos.update(planos)
                integracao["concluidos"] = len(feitos)

    mod.marcar_status = marcar_status

    try:
        fazer_backup("antes de integrar")
        reconciliar_historico()
        pacientes = mod.carregar_pacientes()
        if mod.LIMITE_PACIENTES:
            pacientes = dict(list(pacientes.items())[:mod.LIMITE_PACIENTES])
        for (clinica, pg), dados in pacientes.items():
            for perfil, plano in dados["planos"].items():
                for l in plano["linhas"]:
                    linha_para_plano[l] = (clinica, pg, perfil)
        integracao["total"] = len(set(linha_para_plano.values()))
        if not integracao["total"]:
            log("Nenhum plano aprovado aguardando integração.")
            return

        log(f"Iniciando integração de {integracao['total']} plano(s)"
            + (f" — {opcoes['clinica']}" if opcoes.get("clinica") else " — todas as clínicas"))

        # Reinicia a sessão se ela cair (até 5 vezes seguidas), retomando pelos pendentes
        quedas = 0
        while not mod.PARAR.is_set():
            try:
                mod.executar()
                break
            except mod.ErroLogin as e:
                log(f"ERRO de login: {e}. Confira o usuário e a senha e inicie de novo.")
                break
            except mod.ErroGravacao as e:
                log(f"ERRO ao gravar no banco: {e}")
                log("Integração interrompida para não cadastrar planos em dobro. O que foi feito está no "
                    f"histórico ({ARQ_HISTORICO.name}) e será recuperado na próxima integração. "
                    "Feche o banco no Excel e inicie de novo.")
                break
            except Exception as e:
                quedas += 1
                log(f"ERRO na sessão: {type(e).__name__}: {texto(e).splitlines()[0] if texto(e) else ''}")
                log("".join(traceback.format_exc(limit=3)))
                if quedas >= 5:
                    log("A sessão caiu 5 vezes seguidas — integração interrompida.")
                    break
                log("Reiniciando em 10 segundos...")
                if mod.PARAR.wait(10):
                    break
    except Exception as e:
        log(f"ERRO: {type(e).__name__}: {e}")
    finally:
        mod.marcar_status = original
        mod.fazer_login = login_original
        mod.USUARIO_CNN = mod.SENHA_CNN = None  # as senhas não ficam guardadas depois da execução
        mod.SENHAS_DESCONTO = {}
        integracao["rodando"] = False
        integracao["fim"] = time.time()
        log("Integração finalizada." if not mod.PARAR.is_set() else "Integração parada.")


def clinicas_para_integrar(clinica=None):
    """Clínicas com planos aprovados aguardando integração."""
    return [c for c, n in resumo_banco().items() if n["aprovados"] and (not clinica or c == clinica)]


def iniciar_integracao(opcoes):
    opcoes["usuario"] = texto(opcoes.get("usuario"))
    opcoes["senha"] = opcoes.get("senha") or ""
    if not opcoes["usuario"] or not opcoes["senha"]:
        raise ValueError("Informe o usuário e a senha do Clínica nas Nuvens.")
    if opcoes.get("autorizar", True):
        # Cada unidade tem a sua senha de desconto: exige a de todas as que vão subir planos
        senhas = {normalizar(c): s for c, s in (opcoes.get("senhas_desconto") or {}).items() if s}
        faltando = [c for c in clinicas_para_integrar(opcoes.get("clinica")) if normalizar(c) not in senhas]
        if faltando:
            raise ValueError("Informe a senha do desconto de: " + ", ".join(faltando) + ".")
    if banco_aberto_no_excel():
        raise ValueError("Feche o banco no Excel antes de integrar: se ele for salvo no Excel durante a "
                         "integração, os status gravados pelo robô se perdem.")
    with trava_banco:
        if integracao["rodando"]:
            raise ValueError("A integração já está em andamento.")
        integracao.update({"rodando": True, "total": 0, "concluidos": 0, "autorizados": 0, "cadastrados": 0,
                           "erros": 0, "inicio": time.time(), "fim": None, "clinica": opcoes.get("clinica") or ""})
    threading.Thread(target=rodar_integracao, args=(opcoes,), daemon=True).start()


# ── Fechar o app com segurança ─────────────────────────────────────────────────

fechando = threading.Event()  # depois de setado, nenhuma gravação nova é aceita
servidor_ativo = None


def fechar_app():
    """Conferência final antes de encerrar. Devolve o relatório [{ok, texto}].

    Ordem: bloqueia gravações novas → espera a que estiver em andamento → recupera do
    histórico algum Status do robô que o banco tenha perdido → backup → confere se o
    banco abre e tem as abas → remove sobra de gravação interrompida → encerra o servidor."""
    if integracao["rodando"]:
        raise ValueError("Há uma integração em andamento. Pare a integração antes de fechar o app.")
    if agendamentos.coleta["rodando"]:
        raise ValueError("Há uma coleta de agendamentos em andamento. Pare a coleta antes de fechar o app.")
    if agendamentos.integracao["rodando"]:
        raise ValueError("Há uma integração de agendamentos em andamento. Pare antes de fechar o app.")
    fechando.set()
    relatorio = []
    item = lambda ok, texto_item: relatorio.append({"ok": ok, "texto": texto_item})
    try:
        with trava_banco:
            pass  # espera terminar qualquer gravação em andamento
        item(True, "Nenhuma gravação em andamento: tudo o que foi feito no app já está no banco.")

        if not BANCO.exists():
            item(True, "Banco ainda não criado (nada importado): nada a conferir.")
        else:
            excel_aberto = banco_aberto_no_excel()
            if excel_aberto:
                item(False, "O banco está aberto no Excel. O app não gravou nada enquanto ele estava aberto; "
                            "se você editou a planilha, salve e feche o Excel.")
            elif ARQ_HISTORICO.exists():
                recuperados = reconciliar_historico()
                item(True, f"Status do robô conferidos com o histórico: {recuperados} recuperado(s)." if recuperados
                     else "Status do robô conferidos com o histórico: todos estão no banco.")
            else:
                item(True, "Status do robô: nenhuma integração registrada no histórico ainda, nada a conferir.")

            with trava_banco:
                conteudo = BANCO.read_bytes()
                sobra = BANCO.with_name(f"~tmp_{BANCO.name}")
                if sobra.exists():
                    sobra.unlink()
                    item(True, "Arquivo temporário de uma gravação interrompida removido (o banco não foi afetado).")
            try:
                wb = openpyxl.load_workbook(BytesIO(conteudo), read_only=True)
                faltando = [aba for aba in (ABA_PLANO, ABA_REVISAR, ABA_SEM) if aba not in wb.sheetnames]
                linhas = sum(max(wb[aba].max_row - 1, 0) for aba in (ABA_PLANO, ABA_REVISAR, ABA_SEM) if aba in wb.sheetnames)
                wb.close()
                if faltando:
                    item(False, f"O banco abriu, mas está sem a(s) aba(s): {', '.join(faltando)}. Restaure um backup de dados/backups.")
                else:
                    item(True, f"Banco íntegro: abre normalmente, com {linhas} linha(s) nas abas de planos.")
            except Exception as e:
                item(False, f"O banco não abriu ({type(e).__name__}). Restaure um backup de dados/backups.")

            antes = set(PASTA_BACKUPS.glob("Banco *.xlsx")) if PASTA_BACKUPS.exists() else set()
            fazer_backup("ao fechar o app")
            novos = set(PASTA_BACKUPS.glob("Banco *.xlsx")) - antes if PASTA_BACKUPS.exists() else set()
            if novos and next(iter(novos)).stat().st_size == len(conteudo):
                item(True, f"Backup feito: dados/backups/{next(iter(novos)).name}")
            else:
                item(False, "Não consegui confirmar o backup de fechamento (veja o log).")
    except Exception as e:
        item(False, f"Erro na conferência final: {type(e).__name__}: {e}")

    if agendamentos.BANCO.exists():
        agendamentos.fazer_backup("ao fechar o app")
        item(True, "Backup do banco de agendamentos feito em dados/backups.")

    for r in relatorio:
        log(("✔ " if r["ok"] else "⚠ ") + r["texto"])
    log("App fechado pelo botão Fechar app.")
    # Responde à tela primeiro; o servidor sai logo depois
    threading.Timer(0.8, lambda: servidor_ativo and servidor_ativo.shutdown()).start()
    return {"relatorio": relatorio, "tudo_ok": all(r["ok"] for r in relatorio)}


def abrir_no_sistema(caminho):
    if sys.platform == "darwin":
        subprocess.Popen(["open", str(caminho)])
    elif os.name == "nt":
        os.startfile(str(caminho))
    else:
        subprocess.Popen(["xdg-open", str(caminho)])


# ── Servidor HTTP ──────────────────────────────────────────────────────────────

class Handler(BaseHTTPRequestHandler):
    def log_message(self, *args):
        pass  # sem log de cada requisição no terminal

    def responder(self, dados, status=200):
        corpo = json.dumps(dados, ensure_ascii=False, default=str).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(corpo)))
        self.end_headers()
        self.wfile.write(corpo)

    def arquivo(self, conteudo, nome, tipo):
        self.send_response(200)
        self.send_header("Content-Type", tipo)
        self.send_header("Content-Disposition", f"attachment; filename*=UTF-8''{quote(nome)}")
        self.send_header("Content-Length", str(len(conteudo)))
        self.end_headers()
        self.wfile.write(conteudo)

    def host_valido(self):
        """Só atende pedidos feitos para 127.0.0.1/localhost: outro site que aponte o próprio
        domínio para 127.0.0.1 não consegue usar o app (nem ler as senhas guardadas)."""
        porta = self.server.server_address[1]
        if self.headers.get("Host", "") in (f"127.0.0.1:{porta}", f"localhost:{porta}"):
            return True
        self.responder({"erro": "Endereço não permitido."}, 403)
        return False

    def do_GET(self):
        if not self.host_valido():
            return
        url = urlparse(self.path)
        params = {k: v[0] for k, v in parse_qs(url.query).items()}
        try:
            if url.path in ("/", "/index.html"):
                corpo = (PASTA_WEB / "index.html").read_bytes()
                self.send_response(200)
                self.send_header("Content-Type", "text/html; charset=utf-8")
                self.send_header("Content-Length", str(len(corpo)))
                self.end_headers()
                self.wfile.write(corpo)

            elif url.path == "/api/estado":
                desde = int(params.get("log_desde", 0))
                with trava_log:
                    novas = [l for l in registro if l[0] > desde]
                ativo = catalogo_ativo()
                self.responder({
                    "clinicas": CLINICAS,
                    "catalogo": {"nome": Path(ativo).name} if ativo else None,
                    "banco": {"caminho": str(BANCO), "existe": BANCO.exists(), "aberto_no_excel": banco_aberto_no_excel()},
                    "resumo": resumo_banco(),
                    "integracao": integracao,
                    "log": novas,
                })

            elif url.path == "/api/linhas":
                aba = params.get("aba", "pendentes")
                resposta = {"linhas": linhas_tabela(aba)}
                if aba in ("revisar", "sem_eq"):
                    resposta["por_paciente"] = itens_por_paciente()
                self.responder(resposta)

            elif url.path == "/api/credenciais":
                self.responder(credenciais_resumo())

            elif url.path == "/api/itens-paciente":
                self.responder(itens_do_paciente(params.get("clinica", ""), params.get("pg", "")))

            elif url.path == "/api/procedimentos":
                self.responder({"procedimentos": procedimentos_do_catalogo()})

            elif url.path == "/api/catalogo":
                self.responder(info_catalogo())

            elif url.path == "/api/agendamentos/estado":
                self.responder(agendamentos.estado(int(params.get("log_desde", 0))))

            elif url.path == "/api/agendamentos/resumo":
                self.responder({"resumo": agendamentos.resumo_banco(), "coletas": agendamentos.coletas_recentes()})

            elif url.path == "/api/agendamentos/pendentes":
                self.responder({"pendentes": agendamentos.contar_pendentes(
                    [t for t in params.get("tipos", "").split(",") if t] or None, params.get("unidade", ""))})

            elif url.path == "/api/agendamentos/linhas":
                self.responder(agendamentos.linhas_tabela(params.get("unidade", ""), params.get("busca", ""),
                                                          params.get("de", ""), params.get("ate", ""),
                                                          situacao_filtro=params.get("situacao", "")))

            elif url.path == "/api/catalogo/dados":
                self.responder(dados_catalogo(params.get("aba", "procedimentos")))

            elif url.path == "/api/template":
                self.arquivo(gerar_template(), "Template Planos de Tratamento.xlsx",
                             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")

            elif url.path == "/api/relatorio":
                arq = PASTA_CONVERSOES / Path(params.get("nome", "")).name
                if not arq.is_file():
                    return self.responder({"erro": "Relatório não encontrado."}, 404)
                self.arquivo(arq.read_bytes(), arq.name,
                             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")

            else:
                self.responder({"erro": "não encontrado"}, 404)
        except Exception as e:
            traceback.print_exc()
            self.responder({"erro": f"{type(e).__name__}: {e}"}, 500)

    def do_POST(self):
        if not self.host_valido():
            return
        url = urlparse(self.path)
        params = {k: v[0] for k, v in parse_qs(url.query).items()}
        tamanho = int(self.headers.get("Content-Length") or 0)
        corpo = self.rfile.read(tamanho) if tamanho else b""
        try:
            if fechando.is_set():
                return self.responder({"erro": "O app está fechando."}, 409)
            if url.path == "/api/fechar":
                self.responder(fechar_app())

            elif url.path == "/api/credenciais/usar":
                self.responder(usar_credenciais(json.loads(corpo or b"{}").get("usuario")))

            elif url.path == "/api/credenciais/esquecer":
                self.responder(esquecer_credenciais(json.loads(corpo or b"{}")))

            elif url.path == "/api/importar":
                resumo = importar(corpo, params.get("nome", "planilha.xlsx"), params.get("clinica", ""))
                self.responder(resumo)

            elif url.path == "/api/resolver-erro":
                self.responder(resolver_erro(json.loads(corpo or b"{}")))

            elif url.path == "/api/aprovar":
                dados = json.loads(corpo or b"{}")
                self.responder(aprovar(dados.get("planos") or [], bool(dados.get("aprovado"))))

            elif url.path == "/api/catalogo/carregar":
                self.responder(carregar_catalogo(corpo, params.get("nome", "catalogo.xlsx")))

            elif url.path == "/api/catalogo/usar":
                self.responder(ativar_catalogo(json.loads(corpo or b"{}").get("caminho", "")))

            elif url.path == "/api/mover":
                self.responder(mover_para_integrar(json.loads(corpo or b"{}")))

            elif url.path == "/api/editar-plano":
                self.responder(editar_plano(json.loads(corpo or b"{}")))

            elif url.path == "/api/mesclar":
                self.responder(mesclar(json.loads(corpo or b"{}")))

            elif url.path == "/api/manual":
                self.responder(adicionar_manual(json.loads(corpo or b"{}")))

            elif url.path == "/api/integrar":
                iniciar_integracao(json.loads(corpo or b"{}"))
                self.responder({"ok": True})

            elif url.path == "/api/parar":
                plano_tratamento.PARAR.set()
                log("Parada solicitada: o robô termina o paciente atual e encerra.")
                self.responder({"ok": True})

            elif url.path == "/api/agendamentos/coletar":
                agendamentos.iniciar_coleta(json.loads(corpo or b"{}"))
                self.responder({"ok": True})

            elif url.path == "/api/agendamentos/integrar":
                opcoes = json.loads(corpo or b"{}")
                if opcoes.get("lembrar"):
                    usuario, senha = texto(opcoes.get("usuario")), opcoes.get("senha") or ""

                    def ao_login():
                        try:
                            guardar_credenciais(usuario, senha, None)
                        except Exception as e:
                            agendamentos.log(f"Atenção: o login funcionou, mas não consegui guardá-lo: {e}")
                    opcoes["ao_login"] = ao_login
                self.responder(agendamentos.iniciar_integracao(opcoes))

            elif url.path == "/api/agendamentos/aprovar":
                dados = json.loads(corpo or b"{}")
                self.responder(agendamentos.aprovar_agendamentos(dados.get("chaves"), bool(dados.get("aprovado"))))

            elif url.path == "/api/agendamentos/editar":
                self.responder(agendamentos.editar_agendamento(json.loads(corpo or b"{}")))

            elif url.path == "/api/agendamentos/parar":
                agendamentos.parar()
                self.responder({"ok": True})

            elif url.path == "/api/agendamentos/abrir-banco":
                if not agendamentos.BANCO.exists():
                    return self.responder({"erro": "O banco de agendamentos ainda não existe — faça a primeira coleta."}, 400)
                abrir_no_sistema(agendamentos.BANCO)
                self.responder({"ok": True})

            elif url.path == "/api/abrir-banco":
                if not BANCO.exists():
                    return self.responder({"erro": "O banco ainda não existe — importe uma planilha primeiro."}, 400)
                abrir_no_sistema(BANCO)
                self.responder({"ok": True})

            elif url.path == "/api/abrir-relatorio":
                arq = PASTA_CONVERSOES / Path(params.get("nome", "")).name
                if not arq.is_file():
                    return self.responder({"erro": "Relatório não encontrado."}, 404)
                abrir_no_sistema(arq)
                self.responder({"ok": True})

            else:
                self.responder({"erro": "não encontrado"}, 404)
        except ValueError as e:
            self.responder({"erro": str(e)}, 400)
        except Exception as e:
            traceback.print_exc()
            log(f"ERRO: {type(e).__name__}: {e}")
            self.responder({"erro": f"{type(e).__name__}: {e}"}, 500)


def abrir_navegador(endereco):
    """Abre o app no Google Chrome; se não achar o Chrome, usa o navegador padrão."""
    try:
        if sys.platform == "darwin":
            subprocess.run(["open", "-a", "Google Chrome", endereco], check=True, capture_output=True)
            return
        if sys.platform == "win32":
            # O Chrome raramente está no PATH do Windows: procura nos lugares de instalação
            for base in (os.environ.get("PROGRAMFILES"), os.environ.get("PROGRAMFILES(X86)"), os.environ.get("LOCALAPPDATA")):
                chrome = Path(base or "") / "Google" / "Chrome" / "Application" / "chrome.exe"
                if base and chrome.is_file():
                    subprocess.Popen([str(chrome), endereco])
                    return
        for nome in ("chrome", "google-chrome", "windows-default"):
            try:
                webbrowser.get(nome).open(endereco)
                return
            except webbrowser.Error:
                continue
    except Exception:
        pass
    print("Google Chrome não encontrado — abrindo no navegador padrão.")
    webbrowser.open(endereco)


def main():
    # Console do Windows nem sempre aceita ✔/→: troca por "?" em vez de derrubar o app
    for fluxo in (sys.stdout, sys.stderr):
        try:
            fluxo.reconfigure(errors="replace")
        except (AttributeError, ValueError):
            pass
    for porta in range(PORTA, PORTA + 20):
        try:
            servidor = ThreadingHTTPServer(("127.0.0.1", porta), Handler)
            break
        except OSError:
            continue
    else:
        raise SystemExit("Nenhuma porta livre entre 8765 e 8784.")

    global servidor_ativo
    servidor_ativo = servidor
    endereco = f"http://127.0.0.1:{porta}"
    fazer_backup("ao abrir o app")
    agendamentos.fazer_backup("ao abrir o app")
    print(f"App de Planos de Tratamento rodando em {endereco}  (Ctrl+C para fechar)")
    threading.Timer(0.8, abrir_navegador, args=(endereco,)).start()
    try:
        servidor.serve_forever()
    except KeyboardInterrupt:
        plano_tratamento.PARAR.set()
        agendamentos.parar()
        print("\nFechando o app.")
        return
    servidor.server_close()
    print("\nApp fechado com segurança. Pode fechar esta janela.")


if __name__ == "__main__":
    main()
