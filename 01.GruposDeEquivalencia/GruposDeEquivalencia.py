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
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys
## Cadastrando grupo: Coping/Cilindro/Ucla/Tampa Proteção Básico — 834 produto(s)

# Planilha única com uma aba por script (ver Template Procedimentos, Grupos e Produtos.xlsx)
ARQUIVO = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Template Procedimentos, Grupos e Produtos(CAMPINAS).xlsx")
ABA = "Grupos de equivalência"
CLINICA = "CAMPINAS - GRUPO MANDIC"
URL_LISTA = "https://app.clinicanasnuvens.com.br/grupo-equivalencia/lista"

PASTA = os.path.dirname(os.path.abspath(__file__))
PASTA_ERROS = os.path.join(PASTA, "erros")
PASTA_LOGS = os.path.join(PASTA, "logs")

# Quantos navegadores cadastram ao mesmo tempo (cada Chrome usa ~0,5–1 GB de RAM)
NUM_NAVEGADORES = 1
# Segundos entre o login de um navegador e o do próximo
INTERVALO_ENTRE_LOGINS = 5
# True = roda sem abrir a janela do Chrome
HEADLESS = False
# Tentativas num mesmo grupo antes de marcá-lo como 'erro' na planilha
MAX_TENTATIVAS = 3
# A tela só aceita até 99 produtos por salvamento: salva, clica em Visualizar e continua no mesmo grupo
PRODUTOS_POR_SALVAMENTO = 99
# Segundos esperando o produto aparecer na lista de sugestões depois de digitar o código
ESPERA_AUTOCOMPLETE = 15
# True = seleciona a 1ª opção que contiver o código (IDPRD) ou o nome do produto da planilha;
# False = seleciona a 1ª opção que aparecer, seja qual for
EXIGIR_PRODUTO_NA_OPCAO = True
# Produto adicionado automaticamente como o 1º de TODOS os grupos (buscado pelo nome).
# None = desliga
PRODUTO_FIXO = "Selecione o produto que deseja"

# True = painel atualizado no terminal; o log detalhado vai para PASTA_LOGS.
# False = log corrido no terminal, como antes.
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
    "produtos_total": 0, "produtos_feitos": 0, "produtos_ok": 0, "produtos_pulados": 0,
    "inicio": time.time(),
}
navegadores = {}                # "N1" -> {status, grupo, etapa, desde, feitos}
eventos = deque(maxlen=12)      # (hora, navegador, cor, texto)
nao_encontrados = []            # (grupo, produto)
erros_execucao = []             # (grupo, motivo) — grupos marcados como 'erro'

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
    detalhe = re.sub(r"^Message:\s*(None)?", "", str(e).strip().split("\n")[0]).strip()[:70]
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
        base = os.path.join(PASTA_ERROS, f"grupo_{nome}_{datetime.now():%Y%m%d_%H%M%S}")
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
    # A previsão é por PRODUTO: os grupos vão do menor para o maior, então a média
    # por grupo subestimaria muito o tempo que falta.
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
        montar_linha(largura, (" Cadastro de grupos de equivalência ", NEGRITO), (f"· {CLINICA}", ""),
                     (f"   {datetime.now():%d/%m %H:%M:%S}", CINZA)),
        montar_linha(largura, (" " + "─" * (largura - 2), CINZA)),
        montar_linha(largura, (" Progresso  ", ""), ("█" * cheio, VERDE), ("░" * (tamanho_barra - cheio), CINZA),
                     (f"  {p['produtos_feitos']}/{p['produtos_total']} produtos  {100 * fracao:.1f}%", NEGRITO)),
        montar_linha(largura, ("            ✔ grupos ", ""), (f"{concluidos}/{total}", VERDE),
                     ("   ✖ grupos com erro ", ""), (str(p["erros"]), VERMELHO if p["erros"] else ""),
                     ("   ⚠ produtos não encontrados ", ""),
                     (str(p["produtos_pulados"]), AMARELO if p["produtos_pulados"] else ""),
                     (f"   decorrido {formatar_duracao(decorrido)}", "")),
        montar_linha(largura, ("            " + previsao, CINZA)),
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
    # Busca a coluna pelo nome, ignorando maiúsculas/minúsculas e espaços nas pontas.
    alvo = nome.strip().lower()
    for i, c in enumerate(cabecalho):
        if c and str(c).strip().lower() == alvo:
            return i + 1
    if obrigatoria:
        raise ValueError(f"Coluna '{nome}' não encontrada na aba '{ABA}'. Colunas disponíveis: {cabecalho}")
    return None


def carregar_grupos():
    """Devolve (col_status, grupos) com os grupos pendentes, do que tem MENOS
    produtos para o que tem MAIS."""
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]
    cabecalho = [cell.value for cell in ws[1]]

    col_grupo         = _idx_coluna(cabecalho, "Nome do Grupos")
    col_identificador = _idx_coluna(cabecalho, "IDPRD")
    col_nome          = _idx_coluna(cabecalho, "Nome Produto")

    # Cria coluna Status se não existir
    col_status = _idx_coluna(cabecalho, "Status", obrigatoria=False)
    if col_status is None:
        col_status = len(cabecalho) + 1
        ws.cell(row=1, column=col_status, value="Status")
        _salvar_planilha(wb)

    # Pré-passagem: coleta grupos que já têm qualquer linha marcada como cadastrado ou erro
    grupos_finalizados = set()
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        g = ws.cell(row=num_row, column=col_grupo).value
        s = ws.cell(row=num_row, column=col_status).value
        if g and str(s or "").strip().lower() in ("cadastrado", "erro"):
            grupos_finalizados.add(str(g).strip())

    grupos = {}
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        grupo         = ws.cell(row=num_row, column=col_grupo).value
        nome          = ws.cell(row=num_row, column=col_nome).value
        identificador = ws.cell(row=num_row, column=col_identificador).value

        if not grupo:
            continue

        grupo = str(grupo).strip()

        # Pula o grupo inteiro se qualquer linha dele já foi cadastrada (ou deu erro)
        if grupo in grupos_finalizados:
            continue

        if grupo not in grupos:
            grupos[grupo] = {"linhas": [], "produtos": []}
            if PRODUTO_FIXO:
                grupos[grupo]["produtos"].append({
                    "nome": PRODUTO_FIXO,
                    "identificador": "",
                    "chave": PRODUTO_FIXO,
                })
        grupos[grupo]["linhas"].append(num_row)

        # O produto fixo já entrou como o 1º do grupo: ignora se também estiver na planilha
        if PRODUTO_FIXO and nome and normalizar(nome) == normalizar(PRODUTO_FIXO):
            continue

        if nome or identificador:
            nome_str = str(nome).strip() if nome else ""
            identificador_str = _texto_id(identificador)
            # Chave de dedup: o IDPRD é o campo realmente único por produto
            chave = identificador_str or nome_str
            ja_existe = any(p["chave"] == chave for p in grupos[grupo]["produtos"])
            if not ja_existe:
                grupos[grupo]["produtos"].append({
                    "nome": nome_str,
                    "identificador": identificador_str,
                    "chave": chave,
                })

    # Do grupo com menos produtos para o com mais (sorted é estável: empates mantêm a ordem da planilha)
    grupos = dict(sorted(grupos.items(), key=lambda item: len(item[1]["produtos"])))

    # wb/ws ficam fora de escopo aqui — arquivo fechado automaticamente
    return col_status, grupos


def _texto_id(valor):
    """IDPRD como texto: 12345.0 (número no Excel) -> '12345'."""
    if valor is None:
        return ""
    if isinstance(valor, float) and valor.is_integer():
        return str(int(valor))
    return str(valor).strip()


def marcar_status(linhas, col_status, valor):
    """Grava o Status nas linhas do grupo — um navegador por vez."""
    with trava_planilha:
        wb = openpyxl.load_workbook(ARQUIVO)
        ws = wb[ABA]
        for linha in linhas:
            ws.cell(row=linha, column=col_status, value=valor)
        _salvar_planilha(wb)


def imprimir_grupos(grupos):
    print(f"\nTotal de grupos pendentes: {len(grupos)}\n")
    for nome, dados in list(grupos.items())[:1]:
        print(f"  [{nome}] — {len(dados['produtos'])} produto(s)")
        for p in dados["produtos"]:
            print(f"    • {p['identificador']} | {p['nome']}")
    print()


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


def normalizar(texto):
    """Sem acento, minúsculo e com espaços simples — para comparar planilha x sistema."""
    texto = unicodedata.normalize("NFKD", str(texto or "")).encode("ascii", "ignore").decode()
    return " ".join(texto.lower().split())


def _opcoes_visiveis(driver):
    return [li for li in driver.find_elements(By.CSS_SELECTOR, SELETOR_OPCOES)
            if li.is_displayed() and li.text.strip()]


def adicionar_produto(driver, produto):
    """Digita o código no campo 'produto', espera o produto aparecer nas sugestões
    (normalmente a 1ª), seleciona e clica em 'Adicionar produto no grupo'.

    Devolve (True, texto da opção escolhida) ou (False, motivo) quando o produto não aparece.
    """
    wait = WebDriverWait(driver, 15)
    busca = produto["identificador"] or produto["nome"]
    campo = wait.until(EC.element_to_be_clickable((By.ID, "produto")))
    campo_codigo = driver.find_element(By.ID, "produto_input")  # hidden: recebe o código do produto escolhido
    # O filtro ao lado do campo (Nome / Código) fica como está (Nome): o código é digitado direto

    # Fecha a lista do produto anterior, para nunca selecionar uma sugestão velha
    campo.send_keys(Keys.ESCAPE)
    try:
        WebDriverWait(driver, 3).until(lambda d: not _opcoes_visiveis(d))
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
        posicao, opcao = WebDriverWait(driver, ESPERA_AUTOCOMPLETE).until(opcao_do_produto)
    except TimeoutException:
        vistas = [o.text.split("\n")[0].strip() for o in _opcoes_visiveis(driver)][:3]
        campo.send_keys(Keys.ESCAPE)
        campo.clear()
        return False, ("não apareceu nas sugestões" + (f" (apareceu: {vistas})" if vistas else " (busca sem resultado)"))
    texto_opcao = opcao.text.split("\n")[0].strip()

    # Seleciona: clique de mouse; se o código não for preenchido, teclado (seta ↓ até a opção + Enter)
    try:
        ActionChains(driver).move_to_element(opcao).click(opcao).perform()
    except Exception:
        driver.execute_script("arguments[0].click();", opcao)
    selecionado = lambda d: campo_codigo.get_attribute("value").strip() != ""
    try:
        WebDriverWait(driver, 3).until(selecionado)
    except TimeoutException:
        for _ in range(posicao + 1):
            campo.send_keys(Keys.ARROW_DOWN)
            time.sleep(0.2)
        campo.send_keys(Keys.RETURN)
        try:
            WebDriverWait(driver, 3).until(selecionado)
        except TimeoutException:
            campo.clear()
            return False, f"apareceu '{texto_opcao}' mas a seleção não pegou"
    time.sleep(0.3)

    botao_adicionar = wait.until(EC.element_to_be_clickable((By.ID, "adicionar-produto")))
    driver.execute_script("arguments[0].click();", botao_adicionar)

    # O campo de busca (e o código escondido) é limpo quando o produto entra no grupo
    try:
        WebDriverWait(driver, 5).until(lambda d: not d.find_element(By.ID, "produto").get_attribute("value").strip())
    except TimeoutException:
        print(f"  Aviso: o campo de busca não foi limpo depois de adicionar '{texto_opcao}' — confira esse grupo.")
    return True, texto_opcao


def salvar_grupo(driver):
    etapa("Salvando o grupo")
    botao_salvar = WebDriverWait(driver, 15).until(EC.element_to_be_clickable(
        (By.XPATH, "//button[@type='submit' and contains(@class,'btn-primary')]")
    ))
    driver.execute_script("arguments[0].click();", botao_salvar)
    time.sleep(2)


def reabrir_pelo_visualizar(driver):
    """Depois de um salvamento parcial: clica em 'Visualizar' (volta ao cadastro do mesmo
    grupo, já salvo) e devolve a URL dele — usada para retomar se algo falhar depois."""
    etapa("Abrindo o grupo salvo (Visualizar) para continuar")
    botao_visualizar = WebDriverWait(driver, 30).until(EC.element_to_be_clickable(
        (By.CSS_SELECTOR, "a.btn[href*='/grupo-equivalencia/visualizar/']")
    ))
    url_grupo = botao_visualizar.get_attribute("href")
    driver.execute_script("arguments[0].click();", botao_visualizar)
    WebDriverWait(driver, 30).until(EC.element_to_be_clickable((By.ID, "produto")))
    time.sleep(1)
    return url_grupo


def cadastrar_grupo(driver, nome_grupo, dados):
    """Cadastra UM grupo com seus produtos, salvando a cada PRODUTOS_POR_SALVAMENTO.

    Devolve (produtos_ok, produtos_pulados). Se o grupo já foi salvo parcialmente numa
    tentativa anterior (dados["retomada"]), continua dele em vez de criar outro.
    """
    wait = WebDriverWait(driver, 15)
    produtos = dados["produtos"]
    retomada = dados.get("retomada")

    if retomada:
        # Já existe no sistema com os produtos até o último salvamento: continua de lá
        etapa(f"Retomando o grupo já salvo a partir do produto {retomada['proximo'] + 1}")
        driver.get(retomada["url"])
        wait.until(EC.element_to_be_clickable((By.ID, "produto")))
        time.sleep(1)
        inicio_produtos = retomada["proximo"]
        produtos_ok = retomada["ok"]
        produtos_pulados = list(retomada["pulados"])
    else:
        # Abre formulário de novo grupo
        etapa("Abrindo formulário de novo grupo")
        driver.get(URL_LISTA)
        botao_novo = wait.until(EC.element_to_be_clickable(
            (By.XPATH, "//a[@href='/grupo-equivalencia/novo']")
        ))
        driver.execute_script("arguments[0].click();", botao_novo)
        time.sleep(2)

        # Preenche o nome do grupo
        campo_nome = wait.until(EC.element_to_be_clickable((By.ID, "grupo-equivalencia-nome")))
        campo_nome.clear()
        campo_nome.send_keys(nome_grupo)
        time.sleep(1)
        inicio_produtos = 0
        produtos_ok = 0
        produtos_pulados = []

    # Um produto por vez: código → sugestão → "Adicionar produto no grupo"
    adicionados_desde_salvar = 0
    for indice_produto in range(inicio_produtos, len(produtos)):
        produto = produtos[indice_produto]
        descricao = f"{produto['identificador']} {produto['nome']}".strip()
        atualizar(etapa=f"Produto {indice_produto + 1}/{len(produtos)}: {descricao}")
        adicionou, detalhe = adicionar_produto(driver, produto)
        if adicionou:
            produtos_ok += 1
            adicionados_desde_salvar += 1
            print(f"  + {descricao} → {detalhe}")
        else:
            print(f"  Produto não encontrado: {descricao} — {detalhe} — pulando.")
            produtos_pulados.append(descricao)

        # Limite da tela: salva e volta ao mesmo grupo pelo Visualizar (se ainda faltar produto)
        if adicionados_desde_salvar >= PRODUTOS_POR_SALVAMENTO and indice_produto + 1 < len(produtos):
            salvar_grupo(driver)
            print(f"  Salvamento parcial: {produtos_ok} produto(s) no grupo até agora.")
            url_grupo = reabrir_pelo_visualizar(driver)
            dados["retomada"] = {"url": url_grupo, "proximo": indice_produto + 1,
                                 "ok": produtos_ok, "pulados": list(produtos_pulados)}
            adicionados_desde_salvar = 0

    salvar_grupo(driver)
    return produtos_ok, produtos_pulados


def _sessao_viva(driver):
    try:
        driver.current_url
        return True
    except Exception:
        return False


def processar_grupo(driver, col_status, nome_grupo, dados, tentativa, fila):
    """Cadastra o grupo e grava o Status. Erro com a sessão viva: devolve o grupo à
    fila (até MAX_TENTATIVAS) ou marca 'erro'. Sessão morta: levanta a exceção para
    o navegador reabrir."""
    nome_navegador = threading.current_thread().name
    linhas = dados["linhas"]
    produtos = dados["produtos"]
    salvou = False
    try:
        produtos_ok, produtos_pulados = cadastrar_grupo(driver, nome_grupo, dados)
        salvou = True
        etapa("Marcando 'cadastrado' na planilha")
        marcar_status(linhas, col_status, "cadastrado")
    except Exception as e:
        print(f"  ERRO no grupo '{nome_grupo}': {type(e).__name__}: {e}")
        motivo = resumo_erro(e)
        if not salvou and not _sessao_viva(driver):
            raise  # Chrome caiu: o navegador reabre e o grupo volta para a fila

        salvar_print_erro(driver, nome_grupo)
        retomada = dados.get("retomada")
        if salvou:
            motivo += " — falhou DEPOIS de salvar: confira no sistema se o grupo foi criado"
        elif tentativa < MAX_TENTATIVAS:
            continua = f" (continua do produto {retomada['proximo'] + 1}, já salvo até ali)" if retomada else ""
            registrar_evento(AMARELO, f"↻ {nome_grupo} — {motivo} — tentando de novo ({tentativa}/{MAX_TENTATIVAS}){continua}")
            fila.put((nome_grupo, dados, tentativa + 1))
            return
        elif retomada:
            motivo += (f" — grupo FICOU SALVO PELA METADE no sistema (produtos 1 a {retomada['proximo']}"
                       f" de {len(produtos)}): {retomada['url']}")

        with trava:
            progresso["erros"] += 1
            progresso["produtos_feitos"] += len(produtos)
            erros_execucao.append((nome_grupo, motivo))
        registrar_evento(VERMELHO, f"✖ {nome_grupo} — {motivo}")
        try:
            marcar_status(linhas, col_status, "erro")
        except Exception as erro_gravacao:
            print(f"  Falha ao gravar erro na planilha: {erro_gravacao}")
        return

    with trava:
        progresso["concluidos"] += 1
        progresso["produtos_feitos"] += len(produtos)
        progresso["produtos_ok"] += produtos_ok
        progresso["produtos_pulados"] += len(produtos_pulados)
        nao_encontrados.extend((nome_grupo, produto) for produto in produtos_pulados)
        navegadores[nome_navegador]["feitos"] += 1
    registrar_evento(AMARELO if produtos_pulados else VERDE,
                     f"✔ {nome_grupo} — {produtos_ok} produto(s)"
                     + (f", {len(produtos_pulados)} não encontrado(s)" if produtos_pulados else ""))


# ── Navegadores em paralelo ────────────────────────────────────────────────────

def navegador(fila, col_status, parar, atraso):
    """Um navegador: pega grupos da fila até ela esvaziar."""
    try:
        _navegador(fila, col_status, parar, atraso)
    finally:
        atualizar(status="finalizado", grupo="", etapa="", desde=time.time())


def _navegador(fila, col_status, parar, atraso):
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
                print(f"\nCadastrando grupo: {nome_grupo} — {len(dados['produtos'])} produto(s)"
                      + (f" (tentativa {tentativa}/{MAX_TENTATIVAS})" if tentativa > 1 else ""))
                atualizar(status="trabalhando", grupo=f"{nome_grupo} ({len(dados['produtos'])} prod.)",
                          etapa="", desde=time.time())
                processar_grupo(driver, col_status, nome_grupo, dados, tentativa, fila)
                atual = None

        except Exception as e:
            print(f"\nERRO na sessão: {type(e).__name__}: {e}")
            registrar_evento(AMARELO, f"⚠ Sessão caiu ({resumo_erro(e)}) — reabrindo em 10s")
            atualizar(status="caiu", etapa="Reabrindo em 10s", desde=time.time())
            if driver:
                salvar_print_erro(driver, f"sessao_{threading.current_thread().name}")
            if atual:
                fila.put(atual)  # o grupo não foi salvo: volta para a fila
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
    print(f"  {VERDE}✔ grupos cadastrados: {progresso['concluidos']}/{progresso['total']}{FIM}    "
          f"{VERMELHO if progresso['erros'] else ''}✖ grupos com erro: {progresso['erros']}{FIM}    "
          f"produtos adicionados: {progresso['produtos_ok']}    "
          f"{AMARELO if progresso['produtos_pulados'] else ''}⚠ não encontrados: {progresso['produtos_pulados']}{FIM}    "
          f"tempo: {formatar_duracao(time.time() - progresso['inicio'])}")
    if erros_execucao:
        print(f"\n  Grupos com erro (marcados 'erro' na planilha"
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

    col_status, grupos = carregar_grupos()

    if not grupos:
        print("Nenhum grupo encontrado.")
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
        log_arquivo = open(os.path.join(PASTA_LOGS, f"cadastro_grupos_{datetime.now():%Y%m%d_%H%M%S}.log"),
                           "w", encoding="utf-8")
    print(f"{len(grupos)} grupo(s) pendente(s), {progresso['produtos_total']} produto(s). "
          f"Abrindo {quantidade} navegador(es). Ordem: do grupo com menos produtos para o com mais.")

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
            args=(fila, col_status, parar, i * INTERVALO_ENTRE_LOGINS),
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
