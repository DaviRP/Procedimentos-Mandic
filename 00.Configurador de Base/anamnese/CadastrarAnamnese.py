import csv
import os
import re
import sys
import time
import unicodedata
from datetime import datetime

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import TimeoutException


# ── Configuração ──────────────────────────────────────────────────────────────
PASTA = os.path.dirname(os.path.abspath(__file__))
ARQUIVO = os.path.join(PASTA, "Questionarios_Perguntas.csv")
CLINICA = "CAMPINAS - GRUPO MANDIC"   # clínica ONDE os questionários serão cadastrados
HEADLESS = True             # True = sem janela; pode trocar na hora com --headless / --visivel
LIMITE_QUESTIONARIOS = 100    # teste com 1; depois None = todos
CHECAR_EXISTENTE = True     # pula questionários cujo nome já existe na lista de modelos
PULAR_PERGUNTA_NAO_ENCONTRADA = True  # True = salva o questionário sem ela; False = não salva e marca erro
SALVAR_PRINTS_ERRO = True   # print + HTML de cada erro na pasta erros/
GERAR_LOG = True            # log com horário na pasta logs/

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_ANAMNESE = URL_BASE + "/anamnese"

COL_STATUS = "Cadastro"
STATUS_FINAIS = ("cadastrado", "já existia", "erro", "pergunta não encontrada")

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


# ── CSV ───────────────────────────────────────────────────────────────────────
def ler_csv():
    with open(ARQUIVO, newline="", encoding="utf-8-sig") as f:
        leitor = csv.DictReader(f)
        return list(leitor.fieldnames), list(leitor)


def carregar_questionarios():
    """Agrupa o CSV por questionário, com as perguntas na ordem da coluna 'Ordem'.

    Pula questionários que já tenham qualquer linha com status na coluna Cadastro.
    """
    _, linhas = ler_csv()
    questionarios = {}
    for n, linha in enumerate(linhas):
        nome = (linha.get("Questionario") or "").strip()
        pergunta = (linha.get("Pergunta") or "").strip()
        if not nome or not pergunta:
            continue
        q = questionarios.setdefault(nome, {"nome": nome, "perguntas": [], "status": set()})
        try:
            ordem = int(linha.get("Ordem") or 0)
        except ValueError:
            ordem = 0
        q["perguntas"].append({"nome": pergunta, "ordem": ordem, "linha": n})
        q["status"].add(normalizar(linha.get(COL_STATUS)))

    finais = {normalizar(s) for s in STATUS_FINAIS}
    pendentes = []
    for q in questionarios.values():
        if q["status"] & finais:
            continue
        q["perguntas"].sort(key=lambda p: p["ordem"])
        pendentes.append(q)
    return pendentes


def marcar_status(status_por_linha):
    """Grava {índice da linha: status} na coluna Cadastro (cópia temporária + os.replace)."""
    cabecalho, linhas = ler_csv()
    if COL_STATUS not in cabecalho:
        cabecalho.append(COL_STATUS)
    for n, valor in status_por_linha.items():
        linhas[n][COL_STATUS] = valor

    temporario = ARQUIVO + ".tmp"
    with open(temporario, "w", newline="", encoding="utf-8-sig") as f:
        escritor = csv.DictWriter(f, fieldnames=cabecalho)
        escritor.writeheader()
        escritor.writerows(linhas)
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


def visivel(driver, by, seletor, timeout=15):
    return WebDriverWait(driver, timeout).until(EC.visibility_of_element_located((by, seletor)))


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


def modelos_existentes(driver, wait):
    """Lê os nomes de todos os modelos da lista (aba padrão de /anamnese, com paginação)."""
    seletor_link = "a[href*='/anamnese/modelo/visualiza/']"
    nomes = set()
    paginas = [URL_ANAMNESE]
    visitadas = set()

    while paginas:
        pagina = paginas.pop(0)
        if pagina in visitadas:
            continue
        visitadas.add(pagina)
        driver.get(pagina)
        try:
            wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, seletor_link)))
        except TimeoutException:
            break  # nenhum modelo cadastrado ainda
        time.sleep(1)

        for nome in driver.execute_script("""
            return [...document.querySelectorAll(arguments[0])].map(a => {
                const td = a.closest('tr') ? a.closest('tr').querySelector('td') : null;
                return td ? td.textContent : '';
            });
        """, seletor_link):
            nomes.add(normalizar(nome))

        for a in driver.find_elements(By.CSS_SELECTOR, "a.itemPaginacao"):
            href = a.get_attribute("href")
            if href and href not in visitadas:
                paginas.append(href)
    return nomes


def abrir_novo_modelo(driver, wait):
    """Adicionar ▸ Adicionar modelo de anamnese."""
    driver.get(URL_ANAMNESE)
    clicar_js(driver, wait.until(EC.presence_of_element_located((By.ID, "btn-adicionar-novo"))))
    time.sleep(0.5)
    item = wait.until(EC.presence_of_element_located((
        By.XPATH,
        "//a[contains(@class,'menu-link')][.//span[normalize-space()='Adicionar modelo de anamnese']]",
    )))
    clicar_js(driver, item)
    wait.until(EC.presence_of_element_located((By.ID, "nome-modelo")))
    time.sleep(0.5)


def perguntas_no_modelo(driver):
    """Títulos das perguntas já adicionadas ao modelo (menu lateral), normalizados.

    Lê o texto do link: no modelo recém-montado o nome fica direto no <a class="menu-link">,
    sem o <span class="menu-title"> que aparece nos modelos já salvos.
    """
    return [normalizar(t) for t in driver.execute_script("""
        return [...document.querySelectorAll('#menu-perguntas .menu-item a.menu-link')].map(a => a.textContent);
    """)]


def adicionar_pergunta(driver, wait, pergunta):
    """Abre 'Adicionar perguntas', pesquisa pelo nome, marca o check da pergunta exata e adiciona.

    Devolve True se adicionou, False se a pergunta não apareceu na pesquisa.
    """
    alvo = normalizar(pergunta)
    qtd_antes = len(perguntas_no_modelo(driver))

    # Abre a janela de seleção, se ainda não estiver aberta.
    campos = [c for c in driver.find_elements(By.ID, "pesquisa-pergunta-nome") if c.is_displayed()]
    if not campos:
        clicar_js(driver, wait.until(EC.presence_of_element_located((By.ID, "btn-add-pergunta"))))
        campos = [visivel(driver, By.ID, "pesquisa-pergunta-nome")]
    preencher(driver, campos[0], pergunta)
    clicar_js(driver, driver.find_element(By.ID, "btn-pesquisar-perguntas"))

    # Espera aparecer na lista um check cujo texto é exatamente o da pergunta.
    id_check = None
    fim = time.time() + 10
    while time.time() < fim and not id_check:
        time.sleep(0.5)
        for id_, texto in driver.execute_script("""
            return [...document.querySelectorAll('input.check-selecao-pergunta')]
                .filter(c => c.offsetParent !== null)
                .map(c => {
                    const label = document.querySelector("label[for='" + c.id + "']");
                    return [c.id, label ? label.textContent : ''];
                });
        """):
            if normalizar(texto) == alvo:
                id_check = id_
                break
    if not id_check:
        return False

    check = driver.find_element(By.ID, id_check)
    if not check.is_selected():
        clicar_js(driver, check)
        time.sleep(0.3)
    if not check.is_selected():
        raise Exception(f"não consegui marcar o check da pergunta '{pergunta}'")

    clicar_js(driver, driver.find_element(By.ID, "btn-adicionar-perguntas"))

    # Confere que a pergunta entrou no menu do modelo.
    try:
        WebDriverWait(driver, 10).until(lambda d: len(perguntas_no_modelo(d)) > qtd_antes)
    except TimeoutException:
        raise Exception(f"a pergunta '{pergunta}' não entrou no modelo depois de 'Adicionar pergunta'")
    if alvo not in perguntas_no_modelo(driver):
        raise Exception(f"entrou uma pergunta diferente de '{pergunta}' no modelo")
    time.sleep(0.5)
    return True


def fechar_janela_perguntas(driver):
    """Se a janela de seleção de perguntas ainda estiver aberta, fecha antes de salvar."""
    for botao in driver.find_elements(By.CSS_SELECTOR, ".modal.show [data-bs-dismiss='modal']"):
        if botao.is_displayed():
            clicar_js(driver, botao)
            time.sleep(0.8)
            return


def salvar(driver):
    """Clica em Salvar do formulário do modelo e espera sair da tela."""
    url_antes = driver.current_url
    botoes = [
        b for b in driver.find_elements(By.XPATH, "//button[@type='submit'][contains(normalize-space(.),'Salvar')]")
        if b.is_displayed()
    ]
    if not botoes:
        raise Exception("botão Salvar não encontrado")
    clicar_js(driver, botoes[0])
    try:
        WebDriverWait(driver, 20).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("depois de Salvar a tela não mudou (verifique campos obrigatórios/mensagem de erro)")


def cadastrar_questionario(driver, wait, q):
    """Cadastra o modelo e devolve {linha: status} para gravar no CSV."""
    abrir_novo_modelo(driver, wait)
    preencher(driver, driver.find_element(By.ID, "nome-modelo"), q["nome"])
    log("  Nome do modelo preenchido.")

    status = {}
    total = len(q["perguntas"])
    for i, p in enumerate(q["perguntas"], start=1):
        if adicionar_pergunta(driver, wait, p["nome"]):
            log(f"    ({i}/{total}) + {p['nome']}")
            status[p["linha"]] = "cadastrado"
        else:
            log(f"    ({i}/{total}) NÃO ENCONTRADA: {p['nome']}")
            status[p["linha"]] = "pergunta não encontrada"

    faltando = [n for n, s in status.items() if s != "cadastrado"]
    if faltando and not PULAR_PERGUNTA_NAO_ENCONTRADA:
        raise Exception(f"{len(faltando)} pergunta(s) não encontrada(s) — questionário não foi salvo")

    fechar_janela_perguntas(driver)
    adicionadas = len(perguntas_no_modelo(driver))
    if adicionadas != total - len(faltando):
        raise Exception(f"o modelo tem {adicionadas} pergunta(s), esperado {total - len(faltando)}")

    salvar(driver)
    log(f"  Salvo com {adicionadas} pergunta(s). ({driver.current_url})")
    return status


# ── Execução ──────────────────────────────────────────────────────────────────
def executar():
    questionarios = carregar_questionarios()
    if LIMITE_QUESTIONARIOS:
        questionarios = questionarios[:LIMITE_QUESTIONARIOS]

    log(f"{len(questionarios)} questionário(s) a cadastrar na clínica '{CLINICA}'.")
    if not questionarios:
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
        existentes = modelos_existentes(driver, wait) if CHECAR_EXISTENTE else set()
        inicio = time.time()
        total = len(questionarios)

        for idx, q in enumerate(questionarios, start=1):
            log(f"\n[{idx}/{total}] {q['nome']} ({len(q['perguntas'])} perguntas)")
            todas_linhas = [p["linha"] for p in q["perguntas"]]
            try:
                if normalizar(q["nome"]) in existentes:
                    log("  Já existe um modelo com esse nome — pulando.")
                    marcar_status({n: "já existia" for n in todas_linhas})
                else:
                    marcar_status(cadastrar_questionario(driver, wait, q))

            except Exception as e:
                if "invalid session" in str(e).lower() or "no such window" in str(e).lower():
                    raise  # navegador caiu: reinicia tudo
                log(f"  ERRO: {str(e).splitlines()[0] if str(e) else type(e).__name__}")
                salvar_evidencia(driver, q["nome"])
                marcar_status({n: "erro" for n in todas_linhas})

            media = (time.time() - inicio) / idx
            log(f"  Média {media:.1f}s/questionário — ETA {media * (total - idx) / 60:.1f} min")

        log("\nCadastro concluído!")

    finally:
        driver.quit()


# Permite escolher na hora de rodar, sem editar o arquivo:
#   python CadastrarAnamnese.py --headless   → sem janela
#   python CadastrarAnamnese.py --visivel    → com janela
# Sem argumento, vale o HEADLESS da configuração.
if "--headless" in sys.argv:
    HEADLESS = True
elif "--visivel" in sys.argv:
    HEADLESS = False

if GERAR_LOG:
    os.makedirs(os.path.join(PASTA, "logs"), exist_ok=True)
    _arquivo_log = open(os.path.join(PASTA, "logs", f"anamnese_{datetime.now():%Y%m%d_%H%M%S}.log"),
                        "a", encoding="utf-8")

# Reinicia em caso de erro geral, retomando dos questionários sem status na coluna Cadastro
while True:
    try:
        executar()
        break
    except Exception as e:
        log(f"\nERRO: {e}")
        log("Reiniciando em 10 segundos...")
        time.sleep(10)
