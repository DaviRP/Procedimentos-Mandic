import builtins
import ctypes
import openpyxl
import os
import queue
import re
import shutil
import sys
import threading
import time
import unicodedata
from collections import deque
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException, StaleElementReferenceException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
## Atualiza grupos de equivalência JÁ EXISTENTES no sistema: acha o grupo pelo nome
## (a linha com produtos > 0), abre a edição e adiciona os produtos da planilha um a um.

# Planilha única com uma aba por script (ver Template Procedimentos, Grupos e Produtos.xlsx)
ARQUIVO = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Template Procedimentos, Grupos e Produtos(CAMPINAS).xlsx")
ABA = "Grupos de equivalências"
# Coluna de controle deste script (criada se não existir). Linha preenchida = já processada.
COLUNA_ATUALIZACAO = "Atualização"
CLINICA = "CAMPINAS - GRUPO MANDIC"
URL_LISTA = "https://app.clinicanasnuvens.com.br/grupo-equivalencia/lista"

PASTA = os.path.dirname(os.path.abspath(__file__))
PASTA_ERROS = os.path.join(PASTA, "erros")
PASTA_LOGS = os.path.join(PASTA, "logs")

# Quantos navegadores atualizam ao mesmo tempo (cada Chrome usa ~0,5–1 GB de RAM)
NUM_NAVEGADORES = 1
# Segundos entre o login de um navegador e o do próximo
INTERVALO_ENTRE_LOGINS = 5
# True = roda sem abrir a janela do Chrome
HEADLESS = True

# Quantos grupos processar nesta execução (None = todos). Use 1 no primeiro teste.
LIMITE_GRUPOS = None
# Tentativas num mesmo grupo antes de marcá-lo como erro na planilha
MAX_TENTATIVAS = 3
# A planilha é gravada a cada N produtos tentados (e sempre no fim do grupo ou num erro).
# Cada gravação leva ~2s; se o script cair, os últimos (até N) voltam a ser tentados e saem como "já existia".
GRAVAR_PLANILHA_A_CADA = 80
# Tentativas num mesmo produto (recarregando a edição do grupo entre elas) antes de marcá-lo como erro e seguir
TENTATIVAS_POR_PRODUTO = 3
# True = clica em Salvar uma vez no fim do grupo (se algum produto foi adicionado)
SALVAR_NO_FINAL = True
# Segundos esperando o produto aparecer na lista de sugestões depois de digitar o código
ESPERA_AUTOCOMPLETE = 15
# True = seleciona a 1ª opção que contiver o código (IDPRD) ou o nome do produto da planilha;
# False = seleciona a 1ª opção que aparecer, seja qual for
EXIGIR_PRODUTO_NA_OPCAO = True

# Valores gravados na coluna COLUNA_ATUALIZACAO
ST_ADICIONADO = "adicionado"
ST_JA_EXISTIA = "já existia"
ST_NAO_ENCONTRADO = "produto não encontrado"
ST_ERRO = "erro"
TEXTO_JA_ADICIONADO = "já foi adicionado"   # toastr: "Este produto já foi adicionado"

# True = painel atualizado no terminal; o log detalhado vai para PASTA_LOGS.
# False = log corrido no terminal.
PAINEL = True
# True = salva print (.png) e HTML da tela quando dá erro, em PASTA_ERROS
SALVAR_PRINTS_ERRO = False
# True = grava o log detalhado da execução em PASTA_LOGS
GERAR_LOG = False

# ── Estado compartilhado entre os navegadores ─────────────────────────────────
trava = threading.Lock()           # painel e contadores
trava_planilha = threading.Lock()  # só um navegador por vez grava a planilha
trava_print = threading.Lock()     # linhas do terminal/log não se misturam
progresso = {
    "total": 0, "concluidos": 0, "erros": 0,
    "produtos_total": 0, "produtos_feitos": 0, "produtos_ok": 0, "produtos_ja": 0, "produtos_pulados": 0, "produtos_erro": 0,
    "inicio": time.time(),
}
navegadores = {}                # "N1" -> {status, grupo, etapa, desde, feitos}
eventos = deque(maxlen=12)      # (hora, navegador, cor, texto)
nao_encontrados = []            # (grupo, produto)
erros_execucao = []             # (grupo, motivo) — grupos marcados como erro

painel_ativo = False
log_arquivo = None


def print(*args, sep=" ", end="\n", **kwargs):
    """print com o nome do navegador ([N1], [N2]...) no começo de cada linha.

    Tudo vai para o arquivo de log; no terminal só aparece quando o painel está desligado.
    """
    nome = threading.current_thread().name
    mensagem = sep.join(str(a) for a in args)
    if re.fullmatch(r"N\d+", nome):
        mensagem = "\n".join(f"[{nome}] {linha}" if linha else linha for linha in mensagem.split("\n"))
    with trava_print:
        if log_arquivo:
            hora = f"{datetime.now():%H:%M:%S}"
            for linha in mensagem.split("\n"):
                if linha:
                    log_arquivo.write(f"{hora} {re.sub(r'\033\[[0-9;?]*[A-Za-z]', '', linha)}\n")
            log_arquivo.flush()
        if not painel_ativo:
            builtins.print(mensagem, end=end, **kwargs)


def atualizar(**campos):
    """Atualiza a linha do navegador atual no painel."""
    nome = threading.current_thread().name
    with trava:
        navegadores.setdefault(nome, {"status": "", "grupo": "", "etapa": "", "desde": time.time(), "feitos": 0})
        navegadores[nome].update(campos)


def etapa(texto):
    """Registra no log e mostra no painel o passo em que o navegador está."""
    print(f"  {texto}")
    atualizar(etapa=texto)


def registrar_evento(cor, texto):
    """Linha que aparece em 'Últimos eventos' no painel (e no log)."""
    print(f"  {texto}")
    with trava:
        eventos.append((f"{datetime.now():%H:%M:%S}", threading.current_thread().name, cor, texto))


def resumo_erro(e):
    """'TimeoutException' ou 'Exception: mensagem...' — uma linha só."""
    detalhe = re.sub(r"^Message:\s*(None)?", "", str(e).strip().split("\n")[0]).strip()
    detalhe = re.sub(r";?\s*For documentation on this error.*", "", detalhe)[:70]
    return f"{type(e).__name__}{': ' + detalhe if detalhe else ''}"


def formatar_duracao(segundos):
    segundos = int(segundos)
    horas, resto = divmod(segundos, 3600)
    minutos, segundos = divmod(resto, 60)
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"


def salvar_print_erro(driver, nome):
    """Salva print da tela e HTML da página em erros/<nome>_<hora>.png/.html."""
    if not SALVAR_PRINTS_ERRO:
        return
    try:
        os.makedirs(PASTA_ERROS, exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)[:60]
        base = os.path.join(PASTA_ERROS, f"atualizar_{nome}_{datetime.now():%Y%m%d_%H%M%S}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        print(f"  Print do erro salvo em: {base}.png")
    except Exception as erro:
        print(f"  Não foi possível salvar o print: {erro}")


# ── Painel ─────────────────────────────────────────────────────────────────────
VERDE, VERMELHO, AMARELO, AZUL, CINZA, NEGRITO = "\033[32m", "\033[31m", "\033[33m", "\033[36m", "\033[2m", "\033[1m"
FIM = "\033[0m"

ESTILO_STATUS = {
    "trabalhando": (VERDE, "●"),
    "logando": (AZUL, "◐"),
    "aguardando": (CINZA, "○"),
    "caiu": (VERMELHO, "✖"),
    "finalizado": (CINZA, "✔"),
}


def montar_linha(largura, *partes):
    """Junta pedaços (texto, cor) cortando no limite visível do terminal."""
    saida, usado = "", 0
    for texto, cor in partes:
        texto = texto[:max(0, largura - usado)]
        usado += len(texto)
        saida += f"{cor}{texto}{FIM}" if cor else texto
    return saida


def montar_painel(parar):
    largura, altura = shutil.get_terminal_size((110, 40))
    largura -= 1
    agora = time.time()

    with trava:
        p = dict(progresso)
        navs = {nome: dict(info) for nome, info in navegadores.items()}
        ultimos = list(eventos)
        ultimos_pulados = nao_encontrados[-5:]
        ultimos_erros = erros_execucao[-5:]

    concluidos, total = p["concluidos"], p["total"]
    decorrido = agora - p["inicio"]
    if p["produtos_feitos"]:
        restante = decorrido / p["produtos_feitos"] * max(0, p["produtos_total"] - p["produtos_feitos"])
        termino = datetime.now() + timedelta(seconds=restante)
        previsao = (f"média {decorrido / p['produtos_feitos']:.1f}s/produto   restante {formatar_duracao(restante)}"
                    f"   término {termino:%d/%m %H:%M}")
    else:
        previsao = "calculando previsão..."

    tamanho_barra = max(10, min(50, largura - 40))
    fracao = p["produtos_feitos"] / p["produtos_total"] if p["produtos_total"] else 0
    cheio = int(tamanho_barra * fracao)

    tela = [
        montar_linha(largura, (" Atualização de grupos de equivalência ", NEGRITO), (f"· {CLINICA}", ""),
                     (f"   {datetime.now():%d/%m %H:%M:%S}", CINZA)),
        montar_linha(largura, (" " + "─" * (largura - 2), CINZA)),
        montar_linha(largura, (" Progresso  ", ""), ("█" * cheio, VERDE), ("░" * (tamanho_barra - cheio), CINZA),
                     (f"  {p['produtos_feitos']}/{p['produtos_total']} produtos  {100 * fracao:.1f}%", NEGRITO)),
        montar_linha(largura, ("            ✔ grupos ", ""), (f"{concluidos}/{total}", VERDE),
                     ("   ✖ com erro ", ""), (str(p["erros"]), VERMELHO if p["erros"] else ""),
                     ("   + adicionados ", ""), (str(p["produtos_ok"]), VERDE),
                     ("   = já existiam ", ""), (str(p["produtos_ja"]), ""),
                     ("   ⚠ não encontrados ", ""),
                     (str(p["produtos_pulados"]), AMARELO if p["produtos_pulados"] else ""),
                     ("   ✖ produtos com erro ", ""),
                     (str(p["produtos_erro"]), VERMELHO if p["produtos_erro"] else "")),
        montar_linha(largura, (f"            decorrido {formatar_duracao(decorrido)}   " + previsao, CINZA)),
    ]
    if parar.is_set():
        tela.append(montar_linha(largura, (" ⏸ Parando: cada navegador termina o grupo atual "
                                           "(Ctrl+C de novo sai na hora)", AMARELO)))

    tela += ["", montar_linha(largura, (" Navegadores", NEGRITO))]
    for nome, info in navs.items():
        cor, icone = ESTILO_STATUS.get(info["status"], ("", "·"))
        segundos = int(agora - info["desde"])
        tela.append(montar_linha(
            largura,
            (f"  {nome:<3} ", NEGRITO),
            (f"{icone} {info['status']:<11}", cor),
            (f" {info['feitos']:>4} feitos  ", CINZA),
            (f"{info['grupo'][:36]:<36}  ", ""),
            (info["etapa"], ""),
            (f"  {segundos}s" if info["status"] in ("trabalhando", "logando") else "", CINZA),
        ))

    if ultimos_erros:
        tela += ["", montar_linha(largura, (f" Grupos com erro ({p['erros']} no total" +
                                            (f" — prints em {PASTA_ERROS})" if SALVAR_PRINTS_ERRO else ")"), NEGRITO))]
        for grupo, motivo in ultimos_erros:
            tela.append(montar_linha(largura, (f"  ✖ {grupo}  ", VERMELHO), (motivo, "")))

    if ultimos_pulados:
        tela += ["", montar_linha(largura, (f" Produtos não encontrados ({p['produtos_pulados']} no total"
                                            " — lista completa no resumo final)", NEGRITO))]
        for grupo, produto in ultimos_pulados:
            tela.append(montar_linha(largura, ("  ⚠ ", AMARELO), (produto, ""), (f"  em {grupo}", CINZA)))

    tela += ["", montar_linha(largura, (" Últimos eventos", NEGRITO))]
    espaco = max(1, altura - len(tela) - 2)
    for hora, nome, cor, texto in ultimos[-espaco:]:
        tela.append(montar_linha(largura, (f"  {hora} ", CINZA), (f"{nome:<3} ", NEGRITO), (texto, cor)))

    tela.append("")
    tela.append(montar_linha(largura, (f" Log completo: {log_arquivo.name}" if log_arquivo
                                       else " Log em arquivo desligado (GERAR_LOG = False)", CINZA)))
    return tela[:altura - 1]


def desenhar_painel(parar, parar_painel):
    """Redesenha o painel a cada segundo numa tela separada do terminal."""
    builtins.print("\033[?1049h\033[?25l", end="", flush=True)  # tela alternativa + esconde cursor
    try:
        while True:
            try:
                tela = montar_painel(parar)
                builtins.print("\033[H" + "\n".join(linha + "\033[K" for linha in tela) + "\033[J",
                               end="", flush=True)
            except Exception as e:
                print(f"Falha ao desenhar o painel: {e}")
            if parar_painel.wait(1):
                break
    finally:
        builtins.print("\033[?25h\033[?1049l", end="", flush=True)  # volta ao terminal normal


# ── Planilha ───────────────────────────────────────────────────────────────────

def _salvar_planilha(wb):
    # Salva numa cópia e só depois troca pelo original (os.replace é atômico):
    # se o script for interrompido no meio, a planilha original fica intacta.
    tmp = ARQUIVO + ".tmp"
    wb.save(tmp)
    os.replace(tmp, ARQUIVO)


def _idx_coluna(cabecalho, nome, obrigatoria=True):
    # Busca a coluna pelo nome, ignorando maiúsculas/minúsculas, acentos e espaços nas pontas.
    alvo = normalizar(nome)
    for i, c in enumerate(cabecalho):
        if c and normalizar(c) == alvo:
            return i + 1
    if obrigatoria:
        raise ValueError(f"Coluna '{nome}' não encontrada na aba '{ABA}'. Colunas disponíveis: {cabecalho}")
    return None


def _texto_id(valor):
    """IDPRD como texto: 12345.0 (número no Excel) -> '12345'."""
    if valor is None:
        return ""
    if isinstance(valor, float) and valor.is_integer():
        return str(int(valor))
    return str(valor).strip()


def carregar_grupos():
    """Devolve (col_atualizacao, grupos) só com as linhas sem valor em COLUNA_ATUALIZACAO,
    do grupo com MENOS produtos pendentes para o com MAIS.

    A coluna Status (do cadastro) é ignorada: este script olha só COLUNA_ATUALIZACAO.
    """
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]
    cabecalho = [cell.value for cell in ws[1]]

    col_grupo         = _idx_coluna(cabecalho, "Nome do Grupos")
    col_identificador = _idx_coluna(cabecalho, "IDPRD")
    col_nome          = _idx_coluna(cabecalho, "Nome Produto")

    col_atualizacao = _idx_coluna(cabecalho, COLUNA_ATUALIZACAO, obrigatoria=False)
    if col_atualizacao is None:
        col_atualizacao = len(cabecalho) + 1
        ws.cell(row=1, column=col_atualizacao, value=COLUNA_ATUALIZACAO)
        _salvar_planilha(wb)

    grupos = {}
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        grupo = ws.cell(row=num_row, column=col_grupo).value
        if not grupo or str(ws.cell(row=num_row, column=col_atualizacao).value or "").strip():
            continue
        nome = ws.cell(row=num_row, column=col_nome).value
        identificador = _texto_id(ws.cell(row=num_row, column=col_identificador).value)
        nome_str = str(nome).strip() if nome else ""
        if not (nome_str or identificador):
            continue

        grupo = str(grupo).strip()
        dados = grupos.setdefault(grupo, {"produtos": [], "url": None})
        # Produto repetido no mesmo grupo: uma busca só, e o resultado vai para todas as linhas dele
        chave = identificador or nome_str
        existente = next((p for p in dados["produtos"] if p["chave"] == chave), None)
        if existente:
            existente["linhas"].append(num_row)
        else:
            dados["produtos"].append({"nome": nome_str, "identificador": identificador,
                                      "chave": chave, "linhas": [num_row]})

    # Do grupo com menos produtos para o com mais (sorted é estável: empates mantêm a ordem da planilha)
    grupos = dict(sorted(grupos.items(), key=lambda item: len(item[1]["produtos"])))
    return col_atualizacao, grupos


def marcar_linhas(col, valores):
    """Grava {linha: valor} na coluna de atualização — um navegador por vez."""
    if not valores:
        return
    with trava_planilha:
        wb = openpyxl.load_workbook(ARQUIVO)
        ws = wb[ABA]
        for linha, valor in valores.items():
            ws.cell(row=linha, column=col, value=valor)
        _salvar_planilha(wb)


def marcar_produtos(col, resultados):
    """resultados: [(produto, valor)] -> grava o valor em todas as linhas de cada produto."""
    marcar_linhas(col, {linha: valor for produto, valor in resultados for linha in produto["linhas"]})


# ── Site ───────────────────────────────────────────────────────────────────────

def abrir_sessao():
    """Abre um Chrome, faz login e seleciona a clínica. Devolve o driver."""
    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
        opcoes.add_argument("--window-size=1920,1080")  # sem janela, maximize não funciona
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)

    try:
        # ── Login ──────────────────────────────────────────────────────────────
        driver.get("https://app.clinicanasnuvens.com.br/")

        campo_email = wait.until(EC.presence_of_element_located(
            (By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[1]/input")
        ))
        campo_email.send_keys("mmerlo++++dpegoraro@bionexo.com")
        driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[2]/button").click()

        campo_senha = wait.until(EC.element_to_be_clickable((By.ID, "password")))
        campo_senha.click()
        campo_senha.send_keys("CNN@foguete")
        driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[4]/form/div[4]/button").click()
        time.sleep(5)

        # ── Seleciona a clínica ────────────────────────────────────────────────
        for popup in driver.find_elements(By.XPATH, "//button[text()='X']"):
            if popup.is_displayed():
                driver.execute_script("arguments[0].click();", popup)
                time.sleep(1)
                break

        botao = wait.until(EC.presence_of_element_located((By.ID, "clinica-selecionada")))
        ActionChains(driver).move_to_element(botao).click(botao).perform()
        time.sleep(1)

        campo_busca = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "//input[@placeholder='Pesquisar clínica']")
        ))
        campo_busca.click()
        campo_busca.send_keys(CLINICA)
        time.sleep(2)

        opcao = wait.until(EC.presence_of_element_located(
            (By.XPATH, f"//a[contains(@class,'trocar-clinica') and contains(.,'{CLINICA}')]")
        ))
        driver.execute_script("arguments[0].click();", opcao)
        time.sleep(5)

        driver.get(URL_LISTA)
        time.sleep(3)
    except Exception:
        driver.quit()
        raise

    return driver


SELETOR_OPCOES = "ul.ui-autocomplete li.ui-menu-item"  # lista de sugestões (jQuery UI, presa ao <body>)
# Qualquer elemento cujo próprio texto tenha "foi adicionado" (balão toastr ou outro aviso)
XPATH_AVISO_JA = "//*[contains(text(), 'foi adicionado')]"


def normalizar(texto):
    """Sem acento, minúsculo e com espaços simples — para comparar planilha x sistema."""
    texto = unicodedata.normalize("NFKD", str(texto or "")).encode("ascii", "ignore").decode()
    return " ".join(texto.lower().split())


def _opcoes_visiveis(driver):
    opcoes = []
    for li in driver.find_elements(By.CSS_SELECTOR, SELETOR_OPCOES):
        try:
            if li.is_displayed() and li.text.strip():
                opcoes.append(li)
        except StaleElementReferenceException:
            pass  # a lista foi redesenhada no meio da leitura: essa opção já não existe
    return opcoes


def _esperar(driver, segundos):
    """WebDriverWait que ignora elemento 'velho': quando a lista de sugestões é redesenhada
    no meio da leitura, só tenta de novo em vez de derrubar o produto."""
    return WebDriverWait(driver, segundos, ignored_exceptions=(StaleElementReferenceException,))


def _avisos_ja_adicionado(driver):
    """Elementos visíveis/presentes com o aviso 'Este produto já foi adicionado'."""
    avisos = []
    for el in driver.find_elements(By.XPATH, XPATH_AVISO_JA):
        try:
            if normalizar(TEXTO_JA_ADICIONADO) in normalizar(el.get_attribute("textContent")):
                avisos.append(el)
        except StaleElementReferenceException:
            pass
    return avisos


def localizar_grupo(driver, nome_grupo):
    """Filtra a lista pelo nome e devolve a URL de edição da linha com o mesmo nome
    e Qtd. produtos > 0. Levanta ErroGrupo se não houver exatamente uma."""
    wait = WebDriverWait(driver, 15)
    etapa("Filtrando a lista pelo nome do grupo")
    driver.get(URL_LISTA)

    botao_filtro = wait.until(EC.element_to_be_clickable((By.ID, "btn-drawer-filtro")))
    driver.execute_script("arguments[0].click();", botao_filtro)
    campo = wait.until(EC.visibility_of_element_located((By.ID, "pesquisa")))
    campo.clear()
    campo.send_keys(nome_grupo)
    if campo.get_attribute("value") != nome_grupo:  # máscara/evento apagou parte do texto
        driver.execute_script("arguments[0].value = arguments[1];", campo, nome_grupo)

    tabela_antiga = driver.find_elements(By.CSS_SELECTOR, "table tbody")
    botao_visualizar = campo.find_element(By.XPATH, "./ancestor::form//button[@type='submit']")
    driver.execute_script("arguments[0].click();", botao_visualizar)
    if tabela_antiga:
        try:
            WebDriverWait(driver, 20).until(EC.staleness_of(tabela_antiga[0]))
        except TimeoutException:
            pass  # a tabela pode ter sido atualizada sem recarregar; a leitura abaixo confere o nome
    wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "table tbody")))
    time.sleep(0.5)

    alvo = normalizar(nome_grupo)
    candidatos = []   # (qtd, url)
    mesmo_nome = 0
    for tr in driver.find_elements(By.CSS_SELECTOR, "table tbody tr"):
        tds = tr.find_elements(By.TAG_NAME, "td")
        if len(tds) < 4 or normalizar(tds[0].text) != alvo:
            continue
        mesmo_nome += 1
        qtd = int(re.sub(r"\D", "", tds[1].text) or 0)
        link = tds[3].find_elements(By.CSS_SELECTOR, "a[href*='/grupo-equivalencia/visualizar/']")
        if qtd > 0 and link:
            candidatos.append((qtd, link[0].get_attribute("href")))

    if not candidatos:
        raise ErroGrupo("grupo não encontrado no sistema" if not mesmo_nome
                        else f"grupo encontrado {mesmo_nome}x, mas todos com 0 produtos")
    if len(candidatos) > 1:
        lista = ", ".join(f"{url.rsplit('/', 1)[-1]} ({qtd} prod.)" for qtd, url in candidatos)
        raise ErroGrupo(f"mais de um grupo com produtos: {lista}")
    qtd, url = candidatos[0]
    print(f"  Grupo encontrado: {url} ({qtd} produto(s) no sistema)")
    return url


def abrir_edicao(driver, url):
    etapa("Abrindo a edição do grupo")
    driver.get(url)
    WebDriverWait(driver, 30).until(EC.element_to_be_clickable((By.ID, "produto")))
    time.sleep(1)


# Seleção de uma sugestão do autocomplete (jQuery UI), em ordem de preferência

SELECIONAR_JS = """
var campo = arguments[0], li = arguments[1];
var $ = window.jQuery;
var inst = $(campo).autocomplete('instance') || $(campo).data('ui-autocomplete') || $(campo).data('autocomplete');
var $li = $(li).closest('li.ui-menu-item');
// Mesmo caminho do clique: o menu marca a opção e dispara 'select' do autocomplete,
// que preenche o campo e o código escondido (produto_input)
inst.menu.focus($.Event('mouseenter', {target: $li[0]}), $li);
inst.menu.select($.Event('click', {target: $li[0]}));
"""


def _selecionar_por_js(driver, campo, opcao, posicao):
    driver.execute_script(SELECIONAR_JS, campo, opcao)


def _selecionar_por_mouse(driver, campo, opcao, posicao):
    ActionChains(driver).move_to_element(opcao).click(opcao).perform()


def _selecionar_por_teclado(driver, campo, opcao, posicao):
    for _ in range(posicao + 1):
        campo.send_keys(Keys.ARROW_DOWN)
        time.sleep(0.2)
    campo.send_keys(Keys.RETURN)


def adicionar_produto(driver, produto):
    """Digita o código no campo 'produto', seleciona a sugestão e clica em 'Adicionar produto no grupo'.

    Devolve (ST_ADICIONADO | ST_JA_EXISTIA | ST_NAO_ENCONTRADO, detalhe).
    """
    wait = _esperar(driver, 15)
    busca = produto["identificador"] or produto["nome"]
    campo = wait.until(EC.element_to_be_clickable((By.ID, "produto")))
    campo_codigo = driver.find_element(By.ID, "produto_input")  # hidden: recebe o código do produto escolhido

    # Fecha a lista do produto anterior, para nunca selecionar uma sugestão velha
    campo.send_keys(Keys.ESCAPE)
    try:
        _esperar(driver, 3).until(lambda d: not _opcoes_visiveis(d))
    except TimeoutException:
        pass

    campo.click()
    campo.clear()
    campo.send_keys(busca)

    def e_o_produto(texto):
        """A opção é deste produto? Código como número inteiro ('111' não aceita '1112') ou nome contido."""
        texto = normalizar(texto)
        codigo = produto["identificador"]
        if codigo and re.search(rf"(?<![0-9a-z]){re.escape(normalizar(codigo))}(?![0-9a-z])", texto):
            return True
        return bool(produto["nome"]) and normalizar(produto["nome"]) in texto

    def opcao_do_produto(d):
        """(posição, opção) da 1ª sugestão deste produto; False enquanto não aparecer."""
        opcoes = _opcoes_visiveis(d)
        for posicao, opcao in enumerate(opcoes):
            if not EXIGIR_PRODUTO_NA_OPCAO or e_o_produto(opcao.text):
                return posicao, opcao
        # Busca pelo código que devolveu UM resultado só: é o produto, mesmo que a
        # sugestão mostre só um nome escrito diferente da planilha
        if produto["identificador"] and len(opcoes) == 1 and d.find_element(By.ID, "produto").get_attribute("value") == busca:
            return 0, opcoes[0]
        return False  # lista vazia ou de outra busca — continua esperando

    try:
        posicao, opcao = _esperar(driver, ESPERA_AUTOCOMPLETE).until(opcao_do_produto)
    except TimeoutException:
        vistas = [o.text.split("\n")[0].strip() for o in _opcoes_visiveis(driver)][:3]
        campo.send_keys(Keys.ESCAPE)
        campo.clear()
        return ST_NAO_ENCONTRADO, ("não apareceu nas sugestões" + (f" (apareceu: {vistas})" if vistas else " (busca sem resultado)"))
    try:
        texto_opcao = opcao.text.split("\n")[0].strip()
    except StaleElementReferenceException:
        posicao, opcao = _esperar(driver, ESPERA_AUTOCOMPLETE).until(opcao_do_produto)
        texto_opcao = opcao.text.split("\n")[0].strip()

    # Zera o código escondido: assim só conta como selecionado o produto DESTA busca
    # (depois de um "já existia" o código do produto anterior pode ter ficado ali)
    driver.execute_script("arguments[0].value = '';", campo_codigo)
    selecionado = lambda d: campo_codigo.get_attribute("value").strip() != ""

    # 1º: API do jQuery UI (funciona em headless, sem mouse/teclado); 2º: clique de mouse; 3º: setas + Enter
    for jeito in (_selecionar_por_js, _selecionar_por_mouse, _selecionar_por_teclado):
        try:
            if jeito is not _selecionar_por_js:
                # a tentativa anterior pode ter fechado a lista: busca de novo
                campo.clear()
                campo.send_keys(busca)
                posicao, opcao = _esperar(driver, ESPERA_AUTOCOMPLETE).until(opcao_do_produto)
            jeito(driver, campo, opcao, posicao)
            _esperar(driver, 3).until(selecionado)
            break
        except Exception as e:
            print(f"    seleção via {jeito.__name__.rsplit('_', 1)[-1]} não pegou ({resumo_erro(e)})")
    else:
        campo.clear()
        return ST_NAO_ENCONTRADO, f"apareceu '{texto_opcao}' mas a seleção não pegou"
    time.sleep(0.3)

    # Avisos que já estavam na tela (de um produto anterior) não contam para este
    avisos_antigos = {el.id for el in _avisos_ja_adicionado(driver)}
    aviso_novo = lambda d: any(el.id not in avisos_antigos for el in _avisos_ja_adicionado(d))
    botao_adicionar = wait.until(EC.element_to_be_clickable((By.ID, "adicionar-produto")))
    driver.execute_script("arguments[0].click();", botao_adicionar)

    # Resultado: balão "Este produto já foi adicionado" ou o campo de busca limpo (entrou no grupo)
    def resultado(d):
        if aviso_novo(d):
            return ST_JA_EXISTIA
        if not d.find_element(By.ID, "produto").get_attribute("value").strip():
            return ST_ADICIONADO
        return False

    try:
        status = _esperar(driver, 5).until(resultado)
    except TimeoutException:
        raise Exception(f"sem confirmação depois de adicionar '{texto_opcao}' (nem campo limpo, nem aviso)")
    if status == ST_JA_EXISTIA:
        campo.clear()  # o produto recusado fica no campo de busca
    else:
        # O aviso pode chegar um instante depois de o campo ser limpo: confere de novo
        time.sleep(0.3)
        if aviso_novo(driver):
            status = ST_JA_EXISTIA
    return status, texto_opcao


def salvar_grupo(driver):
    """Clica em Salvar e espera a página sair da edição (o formulário some)."""
    etapa("Salvando o grupo")
    botao_salvar = WebDriverWait(driver, 15).until(EC.element_to_be_clickable(
        (By.XPATH, "//button[@type='submit' and contains(@class,'btn-primary')]")
    ))
    driver.execute_script("arguments[0].click();", botao_salvar)
    try:
        WebDriverWait(driver, 30).until(EC.staleness_of(botao_salvar))
    except TimeoutException:
        raise Exception("o salvamento não foi confirmado (a tela de edição não fechou)")
    time.sleep(1)


class ErroGrupo(Exception):
    """Erro de dado (grupo não existe, ambíguo...): não adianta tentar de novo."""


def adicionar_com_tentativas(driver, url, produto, descricao):
    """adicionar_produto com até TENTATIVAS_POR_PRODUTO tentativas, recarregando a edição
    entre elas. Se todas falharem, devolve (ST_ERRO + motivo) só para este produto.
    Sessão morta (Chrome fechou): levanta a exceção para o navegador reabrir."""
    for tentativa in range(1, TENTATIVAS_POR_PRODUTO + 1):
        try:
            return adicionar_produto(driver, produto)
        except Exception as e:
            if not _sessao_viva(driver):
                raise
            motivo = resumo_erro(e)
            print(f"  Falha no produto {descricao} ({motivo}) — tentativa {tentativa}/{TENTATIVAS_POR_PRODUTO}")
            if tentativa == TENTATIVAS_POR_PRODUTO:
                salvar_print_erro(driver, f"produto_{produto['chave']}")
                return f"{ST_ERRO}: {motivo}", motivo
            abrir_edicao(driver, url)


def atualizar_grupo(driver, col, nome_grupo, dados):
    """Adiciona os produtos pendentes do grupo, um por um, até o fim.

    O resultado de cada produto vai para a planilha a cada GRAVAR_PLANILHA_A_CADA produtos
    (e no fim, ou se der erro no meio); os gravados saem de dados["produtos"], então uma
    nova tentativa continua do produto seguinte.
    """
    if not dados["url"]:
        dados["url"] = localizar_grupo(driver, nome_grupo)
    abrir_edicao(driver, dados["url"])

    pendentes = []     # [(produto, status)] tentados e ainda não gravados na planilha
    adicionou = False

    def gravar():
        nonlocal pendentes
        if not pendentes:
            return
        marcar_produtos(col, pendentes)
        gravados = {id(p) for p, _ in pendentes}
        dados["produtos"] = [p for p in dados["produtos"] if id(p) not in gravados]
        chave_progresso = {ST_ADICIONADO: "produtos_ok", ST_JA_EXISTIA: "produtos_ja",
                           ST_NAO_ENCONTRADO: "produtos_pulados"}
        with trava:
            progresso["produtos_feitos"] += len(pendentes)
            for _, status in pendentes:
                progresso[chave_progresso.get(status, "produtos_erro")] += 1
        print(f"  Planilha atualizada ({len(pendentes)} produto(s)).")
        pendentes = []

    total = len(dados["produtos"])
    try:
        for indice, produto in enumerate(list(dados["produtos"]), start=1):
            descricao = f"{produto['identificador']} {produto['nome']}".strip()
            atualizar(etapa=f"Produto {indice}/{total}: {descricao}")
            status, detalhe = adicionar_com_tentativas(driver, dados["url"], produto, descricao)
            pendentes.append((produto, status))
            if status == ST_ADICIONADO:
                adicionou = True
                print(f"  + {descricao} → {detalhe}")
            elif status == ST_JA_EXISTIA:
                print(f"  = {descricao} já estava no grupo")
            elif status.startswith(ST_ERRO):
                registrar_evento(VERMELHO, f"✖ {descricao} em {nome_grupo} — {detalhe}")
                with trava:
                    erros_execucao.append((f"{nome_grupo} → {descricao}", detalhe))
            else:
                print(f"  Produto não encontrado: {descricao} — {detalhe} — pulando.")
                with trava:
                    nao_encontrados.append((nome_grupo, descricao))
            if len(pendentes) >= GRAVAR_PLANILHA_A_CADA:
                gravar()
    finally:
        # Mesmo com erro no meio, o que já foi tentado vai para a planilha
        try:
            gravar()
        except Exception as erro_gravacao:
            print(f"  Falha ao gravar a planilha: {erro_gravacao}")

    if SALVAR_NO_FINAL and adicionou:
        salvar_grupo(driver)


def _sessao_viva(driver):
    try:
        driver.current_url
        return True
    except Exception:
        return False


def processar_grupo(driver, col, nome_grupo, dados, tentativa, fila):
    """Atualiza o grupo. Erro com a sessão viva: devolve o grupo à fila (até MAX_TENTATIVAS)
    ou marca erro nas linhas que faltaram. Sessão morta: levanta a exceção para o navegador reabrir."""
    nome_navegador = threading.current_thread().name
    try:
        atualizar_grupo(driver, col, nome_grupo, dados)
    except Exception as e:
        print(f"  ERRO no grupo '{nome_grupo}': {type(e).__name__}: {e}")
        motivo = str(e) if isinstance(e, ErroGrupo) else resumo_erro(e)
        if not isinstance(e, ErroGrupo) and not _sessao_viva(driver):
            raise  # Chrome caiu: o navegador reabre e o grupo volta para a fila

        salvar_print_erro(driver, nome_grupo)
        if not isinstance(e, ErroGrupo) and tentativa < MAX_TENTATIVAS:
            registrar_evento(AMARELO, f"↻ {nome_grupo} — {motivo} — tentando de novo ({tentativa}/{MAX_TENTATIVAS}),"
                                      f" faltam {len(dados['produtos'])} produto(s)")
            fila.put((nome_grupo, dados, tentativa + 1))
            return

        with trava:
            progresso["erros"] += 1
            progresso["produtos_feitos"] += len(dados["produtos"])
            erros_execucao.append((nome_grupo, motivo))
        registrar_evento(VERMELHO, f"✖ {nome_grupo} — {motivo}")
        try:
            marcar_produtos(col, [(p, f"{ST_ERRO}: {motivo}") for p in dados["produtos"]])
        except Exception as erro_gravacao:
            print(f"  Falha ao gravar erro na planilha: {erro_gravacao}")
        return

    with trava:
        progresso["concluidos"] += 1
        navegadores[nome_navegador]["feitos"] += 1
    registrar_evento(VERDE, f"✔ {nome_grupo} — concluído")


# ── Navegadores em paralelo ────────────────────────────────────────────────────

def navegador(fila, col, parar, atraso):
    """Um navegador: pega grupos da fila até ela esvaziar."""
    try:
        _navegador(fila, col, parar, atraso)
    finally:
        atualizar(status="finalizado", grupo="", etapa="", desde=time.time())


def _navegador(fila, col, parar, atraso):
    inicio_login = datetime.now() + timedelta(seconds=atraso)
    atualizar(status="aguardando", etapa=f"login às {inicio_login:%H:%M:%S}")
    if parar.wait(atraso):  # escalona os logins para não entrarem todos juntos
        return

    while not parar.is_set() and not fila.empty():
        driver = None
        atual = None
        try:
            atualizar(status="logando", grupo="", etapa="Login e seleção da clínica", desde=time.time())
            driver = abrir_sessao()
            print("Sessão aberta.")
            atualizar(status="aguardando", etapa="Sessão aberta", desde=time.time())

            while not parar.is_set():
                try:
                    atual = fila.get_nowait()
                except queue.Empty:
                    return

                nome_grupo, dados, tentativa = atual
                print(f"\nAtualizando grupo: {nome_grupo} — {len(dados['produtos'])} produto(s)"
                      + (f" (tentativa {tentativa}/{MAX_TENTATIVAS})" if tentativa > 1 else ""))
                atualizar(status="trabalhando", grupo=f"{nome_grupo} ({len(dados['produtos'])} prod.)",
                          etapa="", desde=time.time())
                processar_grupo(driver, col, nome_grupo, dados, tentativa, fila)
                atual = None

        except Exception as e:
            print(f"\nERRO na sessão: {type(e).__name__}: {e}")
            registrar_evento(AMARELO, f"⚠ Sessão caiu ({resumo_erro(e)}) — reabrindo em 10s")
            atualizar(status="caiu", etapa="Reabrindo em 10s", desde=time.time())
            if driver:
                salvar_print_erro(driver, f"sessao_{threading.current_thread().name}")
            if atual:
                fila.put(atual)  # volta para a fila só com os produtos que faltaram
            print("Reabrindo o navegador em 10 segundos...")
            parar.wait(10)

        finally:
            if driver:
                try:
                    driver.quit()
                except Exception:
                    pass


def imprimir_resumo():
    """Resumo final no terminal (fica visível depois que o painel fecha)."""
    print(f"\n{NEGRITO}Resumo da execução{FIM}")
    print(f"  {VERDE}✔ grupos atualizados: {progresso['concluidos']}/{progresso['total']}{FIM}    "
          f"{VERMELHO if progresso['erros'] else ''}✖ grupos com erro: {progresso['erros']}{FIM}    "
          f"produtos adicionados: {progresso['produtos_ok']}    já existiam: {progresso['produtos_ja']}    "
          f"{AMARELO if progresso['produtos_pulados'] else ''}⚠ não encontrados: {progresso['produtos_pulados']}{FIM}    "
          f"{VERMELHO if progresso['produtos_erro'] else ''}✖ produtos com erro: {progresso['produtos_erro']}{FIM}    "
          f"tempo: {formatar_duracao(time.time() - progresso['inicio'])}")
    if erros_execucao:
        print(f"\n  Grupos com erro (marcados '{ST_ERRO}: ...' na coluna {COLUNA_ATUALIZACAO}"
              + (f"; prints em {PASTA_ERROS}):" if SALVAR_PRINTS_ERRO else "):"))
        for grupo, motivo in erros_execucao[:30]:
            print(f"   - {grupo}: {motivo}")
        if len(erros_execucao) > 30:
            print(f"   ... e mais {len(erros_execucao) - 30}" + (" (ver log)" if log_arquivo else ""))
    if nao_encontrados:
        print("\n  Produtos não encontrados (grupo → produto):")
        for grupo, produto in nao_encontrados[:50]:
            print(f"   - {grupo} → {produto}")
        if len(nao_encontrados) > 50:
            print(f"   ... e mais {len(nao_encontrados) - 50}" + (" (ver log)" if log_arquivo else ""))
    if log_arquivo:
        print(f"\n  Log completo: {log_arquivo.name}")


def executar():
    global painel_ativo, log_arquivo

    col, grupos = carregar_grupos()
    if LIMITE_GRUPOS:
        grupos = dict(list(grupos.items())[:LIMITE_GRUPOS])

    if not grupos:
        print(f"Nenhum produto pendente (coluna '{COLUNA_ATUALIZACAO}' vazia).")
        return

    # Cada grupo entra uma vez na fila (menor → maior): nunca dois navegadores no mesmo grupo
    fila = queue.Queue()
    for nome_grupo, dados in grupos.items():
        fila.put((nome_grupo, dados, 1))

    quantidade = min(NUM_NAVEGADORES, len(grupos))
    progresso["total"] = len(grupos)
    progresso["produtos_total"] = sum(len(d["produtos"]) for d in grupos.values())
    progresso["inicio"] = time.time()

    if GERAR_LOG:
        os.makedirs(PASTA_LOGS, exist_ok=True)
        log_arquivo = open(os.path.join(PASTA_LOGS, f"atualizacao_grupos_{datetime.now():%Y%m%d_%H%M%S}.log"),
                           "w", encoding="utf-8")
    print(f"{len(grupos)} grupo(s) a atualizar, {progresso['produtos_total']} produto(s)"
          + (f" (limitado a {LIMITE_GRUPOS} grupo(s) por LIMITE_GRUPOS)" if LIMITE_GRUPOS else "")
          + f". Abrindo {quantidade} navegador(es).")

    for i in range(quantidade):
        navegadores[f"N{i + 1}"] = {"status": "aguardando", "grupo": "", "etapa": "",
                                    "desde": time.time(), "feitos": 0}

    parar = threading.Event()
    parar_painel = threading.Event()
    # Painel só faz sentido num terminal de verdade (não em saída redirecionada para arquivo)
    painel_ativo = PAINEL and sys.stdout.isatty()
    thread_painel = None
    if painel_ativo:
        thread_painel = threading.Thread(target=desenhar_painel, args=(parar, parar_painel), daemon=True)
        thread_painel.start()

    threads = [
        threading.Thread(
            target=navegador,
            args=(fila, col, parar, i * INTERVALO_ENTRE_LOGINS),
            name=f"N{i + 1}",
            daemon=True,
        )
        for i in range(quantidade)
    ]
    for t in threads:
        t.start()

    try:
        while any(t.is_alive() for t in threads):
            time.sleep(1)
    except KeyboardInterrupt:
        print("\nInterrompido: cada navegador termina o grupo atual e fecha "
              "(Ctrl+C de novo para sair na hora).")
        parar.set()
        for t in threads:
            t.join()
    finally:
        parar_painel.set()
        if thread_painel:
            thread_painel.join(timeout=3)
        painel_ativo = False
        imprimir_resumo()
        if fila.empty() and not parar.is_set():
            print("\nTodos os grupos processados!")
        if log_arquivo:
            log_arquivo.close()
            log_arquivo = None


if __name__ == "__main__":
    try:
        executar()
    finally:
        # Devolve o controle de energia ao Windows (no Mac/Linux não existe windll)
        if os.name == "nt":
            ctypes.windll.kernel32.SetThreadExecutionState(0x80000000)  # ES_CONTINUOUS
