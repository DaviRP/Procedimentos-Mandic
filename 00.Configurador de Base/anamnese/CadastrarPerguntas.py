import os
import re
import sys
import time
import unicodedata
from datetime import datetime

import openpyxl
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait, Select
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import TimeoutException


# ── Configuração ──────────────────────────────────────────────────────────────
PASTA = os.path.dirname(os.path.abspath(__file__))
ARQUIVO = os.path.join(PASTA, "Perguntas_Detalhadas.xlsx")
CLINICA = "CAMPINAS - GRUPO MANDIC"   # clínica ONDE as perguntas serão cadastradas
HEADLESS = True             # True = sem janela; pode trocar na hora com --headless / --visivel
LIMITE_PERGUNTAS = None     # ex.: 1 para um teste rápido; None = todas
CHECAR_EXISTENTE = True     # antes de cadastrar, procura a pergunta pelo nome e pula se já existir
SALVAR_PRINTS_ERRO = True   # print + HTML de cada erro na pasta erros/
GERAR_LOG = True            # log com horário na pasta logs/

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_ANAMNESE = URL_BASE + "/anamnese"
URL_NOVA_PERGUNTA = URL_BASE + "/anamnese/pergunta/novo"

COL_STATUS = "Cadastro"
STATUS_FINAIS = ("cadastrado", "já existia", "erro")
TIPOS_COM_ALTERNATIVAS = ("objetiva", "multipla escolha")

SELETOR_ALTERNATIVA = "input[name^='alternativas['][name$='].descricao']"

_arquivo_log = None


def log(msg):
    print(msg)
    if _arquivo_log:
        _arquivo_log.write(f"{datetime.now():%H:%M:%S} {msg}\n")
        _arquivo_log.flush()


def normalizar(texto):
    """Sem acento, minúsculas e espaços simples — para comparar nomes."""
    texto = unicodedata.normalize("NFKD", str(texto or ""))
    texto = "".join(c for c in texto if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", texto).strip().lower()


def eh_sim(valor):
    return normalizar(valor) == "sim"


# ── Planilha ──────────────────────────────────────────────────────────────────
def carregar_perguntas():
    """Lê a planilha (uma linha por opção) e agrupa por pergunta, mantendo a ordem.

    Pula perguntas que já tenham Cadastro = cadastrado / já existia / erro.
    """
    ws = openpyxl.load_workbook(ARQUIVO).active
    cabecalho = [c.value for c in ws[1]]
    idx = {nome: i for i, nome in enumerate(cabecalho)}

    perguntas = {}
    for n, valores in enumerate(ws.iter_rows(min_row=2, values_only=True), start=2):
        nome = str(valores[idx["Nome da pergunta"]] or "").strip()
        if not nome:
            continue
        status = valores[idx[COL_STATUS]] if COL_STATUS in idx else None
        chave = normalizar(nome)

        if chave not in perguntas:
            perguntas[chave] = {
                "nome": nome,
                "tipo": str(valores[idx["Tipo"]] or "").strip(),
                "observacao": eh_sim(valores[idx["Possui observação?"]]),
                "obrigatoria": eh_sim(valores[idx["Campo obrigatório?"]]),
                "opcoes": [],
                "linhas": [],
                "status": normalizar(status),
            }
        p = perguntas[chave]
        p["linhas"].append(n)
        opcao = str(valores[idx["Opção"]] or "").strip()
        if opcao and opcao not in p["opcoes"]:
            p["opcoes"].append(opcao)

    finais = {normalizar(s) for s in STATUS_FINAIS}
    return [p for p in perguntas.values() if p["status"] not in finais]


def marcar_status(linhas, valor):
    """Grava o status nas linhas da pergunta (cópia temporária + os.replace)."""
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    cabecalho = [c.value for c in ws[1]]
    if COL_STATUS in cabecalho:
        col = cabecalho.index(COL_STATUS) + 1
    else:
        col = len(cabecalho) + 1
        ws.cell(row=1, column=col, value=COL_STATUS)
    for linha in linhas:
        ws.cell(row=linha, column=col, value=valor)

    temporario = ARQUIVO + ".tmp.xlsx"
    wb.save(temporario)
    os.replace(temporario, ARQUIVO)


# ── Utilitários de navegador ──────────────────────────────────────────────────
def clicar_js(driver, elemento):
    driver.execute_script("arguments[0].click();", elemento)


def preencher(driver, campo, texto):
    """Digita no campo e confere; se não ficou igual, força o valor via JS."""
    campo.clear()
    campo.send_keys(texto)
    if (campo.get_attribute("value") or "") != texto:
        driver.execute_script("""
            arguments[0].value = arguments[1];
            arguments[0].dispatchEvent(new Event('input', {bubbles: true}));
            arguments[0].dispatchEvent(new Event('change', {bubbles: true}));
        """, campo, texto)
    if (campo.get_attribute("value") or "") != texto:
        raise Exception(f"campo não aceitou o texto '{texto}'")


def marcar_switch(driver, campo, desejado):
    """Deixa o checkbox no estado desejado e confere."""
    if campo.is_selected() != desejado:
        clicar_js(driver, campo)
        time.sleep(0.3)
    if campo.is_selected() != desejado:
        raise Exception(f"switch '{campo.get_attribute('name')}' não ficou {'marcado' if desejado else 'desmarcado'}")


def salvar_evidencia(driver, nome):
    if not SALVAR_PRINTS_ERRO:
        return
    try:
        pasta = os.path.join(PASTA, "erros")
        os.makedirs(pasta, exist_ok=True)
        nome_arquivo = re.sub(r"\W+", "_", nome)[:50]
        base = os.path.join(pasta, f"{datetime.now():%Y%m%d_%H%M%S}_{nome_arquivo}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        log(f"  Evidência salva em {base}.png")
    except Exception:
        pass


# ── Passos no site ────────────────────────────────────────────────────────────
def login_e_clinica(driver, wait):
    log("Abrindo página de login...")
    driver.get(URL_BASE + "/")

    campo_email = wait.until(EC.presence_of_element_located(
        (By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[1]/input")
    ))
    campo_email.send_keys("mmerlo++++dpegoraro@bionexo.com")
    driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[2]/button").click()
    log("E-mail preenchido, avançando para senha...")

    campo_senha = wait.until(EC.element_to_be_clickable((By.ID, "password")))
    campo_senha.click()
    campo_senha.send_keys("CNN@foguete")
    driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[4]/form/div[4]/button").click()
    time.sleep(5)
    log("Login realizado com sucesso.")

    for popup in driver.find_elements(By.XPATH, "//button[text()='X']"):
        if popup.is_displayed():
            clicar_js(driver, popup)
            time.sleep(1)
            log("Popup inicial fechado.")
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
    clicar_js(driver, opcao)
    time.sleep(5)
    log(f"Clínica '{CLINICA}' selecionada.")


def pergunta_ja_existe(driver, wait, nome):
    """Filtra a aba Perguntas pelo nome e diz se há uma pergunta com o nome exatamente igual."""
    driver.get(URL_ANAMNESE)
    aba = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "a.nav-link[href='#tab_pane_perguntas']")))
    clicar_js(driver, aba)
    time.sleep(1)

    clicar_js(driver, wait.until(EC.presence_of_element_located((By.ID, "btn-drawer-filtropesquisa-perguntas"))))
    time.sleep(1)
    campo_nome = wait.until(EC.element_to_be_clickable((By.ID, "pesquisar-por-nome-perguntas")))
    preencher(driver, campo_nome, nome)

    # Guarda um elemento da tabela atual para saber quando ela for recarregada pelo filtro.
    antigos = driver.find_elements(By.CSS_SELECTOR, "#tab_pane_perguntas table tbody")
    clicar_js(driver, driver.find_element(
        By.XPATH, "//input[@id='pesquisar-por-nome-perguntas']/ancestor::form//button[@type='submit']"
    ))
    if antigos:
        try:
            WebDriverWait(driver, 10).until(EC.staleness_of(antigos[0]))
        except TimeoutException:
            pass
    time.sleep(1.5)

    nomes = driver.execute_script("""
        return [...document.querySelectorAll("a[href*='/anamnese/pergunta/']")].map(a => {
            const tr = a.closest('tr');
            return tr ? [...tr.querySelectorAll('td')].map(td => td.textContent) : [];
        });
    """)
    alvo = normalizar(nome)
    return any(alvo in [normalizar(c) for c in celulas] for celulas in nomes)


def abrir_nova_pergunta(driver, wait):
    """Adicionar ▸ Adicionar pergunta da anamnese. Se o menu falhar, abre a URL direto."""
    driver.get(URL_ANAMNESE)
    try:
        clicar_js(driver, wait.until(EC.presence_of_element_located((By.ID, "btn-adicionar-novo"))))
        time.sleep(0.5)
        clicar_js(driver, wait.until(EC.presence_of_element_located(
            (By.CSS_SELECTOR, "a.menu-link[href='/anamnese/pergunta/novo']")
        )))
        wait.until(EC.presence_of_element_located((By.ID, "pergunta")))
    except TimeoutException:
        log("  Menu 'Adicionar' não respondeu — abrindo a tela de nova pergunta pela URL.")
        driver.get(URL_NOVA_PERGUNTA)
        wait.until(EC.presence_of_element_located((By.ID, "pergunta")))


def selecionar_tipo(driver, tipo):
    """Seleciona no #pergunta-tipo a opção cujo texto é igual ao tipo da planilha."""
    campo = driver.find_element(By.ID, "pergunta-tipo")
    select = Select(campo)
    for opcao in select.options:
        if normalizar(opcao.text) == normalizar(tipo):
            select.select_by_value(opcao.get_attribute("value"))
            break
    else:
        raise Exception(f"tipo '{tipo}' não existe no sistema")

    if normalizar(select.first_selected_option.text) != normalizar(tipo):
        raise Exception(f"tipo '{tipo}' não ficou selecionado")
    time.sleep(0.8)  # a tela mostra/esconde a área de alternativas conforme o tipo


def campos_alternativa(driver):
    return [c for c in driver.find_elements(By.CSS_SELECTOR, SELETOR_ALTERNATIVA) if c.is_displayed()]


def preencher_alternativas(driver, wait, opcoes):
    """Preenche uma alternativa por opção, clicando em 'Adicionar alternativa' quando faltar campo."""
    for i, opcao in enumerate(opcoes):
        campos = campos_alternativa(driver)
        if i >= len(campos):
            botao = wait.until(EC.presence_of_element_located((By.ID, "btn-add-alternativa")))
            clicar_js(driver, botao)
            WebDriverWait(driver, 10).until(lambda d: len(campos_alternativa(d)) > i)
            campos = campos_alternativa(driver)
        preencher(driver, campos[i], opcao)

    # Remove campos de alternativa que sobraram vazios (o formulário pode já vir com um em branco).
    for campo in reversed(campos_alternativa(driver)[len(opcoes):]):
        if (campo.get_attribute("value") or "").strip():
            continue
        linha = campo.find_element(By.XPATH, "./ancestor::*[contains(@class,'linha-alternativa')][1]")
        clicar_js(driver, linha.find_element(By.CSS_SELECTOR, "[data-repeater-delete]"))
        time.sleep(0.8)
        try:
            driver.switch_to.alert.accept()
        except Exception:
            pass

    preenchidas = [(c.get_attribute("value") or "").strip() for c in campos_alternativa(driver)]
    preenchidas = [v for v in preenchidas if v]
    if preenchidas != opcoes:
        raise Exception(f"alternativas não conferem: tela={preenchidas} planilha={opcoes}")


def salvar(driver):
    """Clica em Salvar e espera sair da tela de nova pergunta."""
    url_antes = driver.current_url
    botao = driver.find_element(
        By.XPATH, "//button[@type='submit'][contains(normalize-space(.),'Salvar')]"
    )
    clicar_js(driver, botao)
    try:
        WebDriverWait(driver, 15).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("depois de Salvar a tela não mudou (verifique campos obrigatórios/mensagem de erro)")


def cadastrar_pergunta(driver, wait, p):
    abrir_nova_pergunta(driver, wait)

    preencher(driver, driver.find_element(By.ID, "pergunta"), p["nome"])
    selecionar_tipo(driver, p["tipo"])
    log(f"  Nome e tipo ({p['tipo']}) preenchidos.")

    marcar_switch(driver, driver.find_element(By.CSS_SELECTOR, "input[name='temObservacao']"), p["observacao"])
    marcar_switch(driver, driver.find_element(By.CSS_SELECTOR, "input[name='obrigatoria']"), p["obrigatoria"])
    log(f"  Observação: {'Sim' if p['observacao'] else 'Não'} | Obrigatória: {'Sim' if p['obrigatoria'] else 'Não'}")

    if normalizar(p["tipo"]) in TIPOS_COM_ALTERNATIVAS:
        if not p["opcoes"]:
            raise Exception("pergunta objetiva/múltipla escolha sem opções na planilha")
        preencher_alternativas(driver, wait, p["opcoes"])
        log(f"  Alternativas: {', '.join(p['opcoes'])}")

    salvar(driver)
    log(f"  Salvo. ({driver.current_url})")


# ── Execução ──────────────────────────────────────────────────────────────────
def executar():
    perguntas = carregar_perguntas()
    if LIMITE_PERGUNTAS:
        perguntas = perguntas[:LIMITE_PERGUNTAS]

    log(f"{len(perguntas)} pergunta(s) a cadastrar na clínica '{CLINICA}'.")
    if not perguntas:
        return

    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
        log("Modo headless: o Chrome roda sem abrir janela.")
    else:
        log("Modo visível: a janela do Chrome vai abrir.")
    opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)

    try:
        login_e_clinica(driver, wait)
        inicio = time.time()
        total = len(perguntas)

        for idx, p in enumerate(perguntas, start=1):
            log(f"\n[{idx}/{total}] {p['nome']}")
            try:
                if CHECAR_EXISTENTE and pergunta_ja_existe(driver, wait, p["nome"]):
                    log("  Já existe uma pergunta com esse nome — pulando.")
                    marcar_status(p["linhas"], "já existia")
                else:
                    cadastrar_pergunta(driver, wait, p)
                    marcar_status(p["linhas"], "cadastrado")

            except Exception as e:
                if "invalid session" in str(e).lower() or "no such window" in str(e).lower():
                    raise  # navegador caiu: reinicia tudo
                log(f"  ERRO: {str(e).splitlines()[0] if str(e) else type(e).__name__}")
                salvar_evidencia(driver, p["nome"])
                marcar_status(p["linhas"], "erro")

            media = (time.time() - inicio) / idx
            log(f"  Média {media:.1f}s/pergunta — ETA {media * (total - idx) / 60:.1f} min")

        log("\nCadastro concluído!")

    finally:
        driver.quit()


# Permite escolher na hora de rodar, sem editar o arquivo:
#   python CadastrarPerguntas.py --headless   → sem janela
#   python CadastrarPerguntas.py --visivel    → com janela
# Sem argumento, vale o HEADLESS da configuração.
if "--headless" in sys.argv:
    HEADLESS = True
elif "--visivel" in sys.argv:
    HEADLESS = False

if GERAR_LOG:
    os.makedirs(os.path.join(PASTA, "logs"), exist_ok=True)
    _arquivo_log = open(os.path.join(PASTA, "logs", f"cadastro_{datetime.now():%Y%m%d_%H%M%S}.log"),
                        "a", encoding="utf-8")

# Reinicia em caso de erro geral, retomando das perguntas sem status na coluna Cadastro
while True:
    try:
        executar()
        break
    except Exception as e:
        log(f"\nERRO: {e}")
        log("Reiniciando em 10 segundos...")
        time.sleep(10)
