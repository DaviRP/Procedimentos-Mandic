import csv
import os
import time

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains


# ── Configuração ──────────────────────────────────────────────────────────────
PASTA = os.path.dirname(os.path.abspath(__file__))
ARQUIVO_SAIDA = os.path.join(PASTA, "Questionarios_Perguntas.csv")
CLINICA = "GRANDE VITORIA - GRUPO MANDIC"
HEADLESS = True

URL_ANAMNESE = "https://app.clinicanasnuvens.com.br/anamnese"
URL_BASE = "https://app.clinicanasnuvens.com.br"

COLUNAS = ["Questionario", "Pergunta", "Ordem"]


def clicar_js(driver, elemento):
    driver.execute_script("arguments[0].click();", elemento)


def salvar_saida(linhas):
    """Grava o CSV em cópia temporária + os.replace (não corrompe se interromper).

    utf-8-sig para o Excel abrir os acentos corretamente.
    """
    temporario = ARQUIVO_SAIDA + ".tmp"
    with open(temporario, "w", newline="", encoding="utf-8-sig") as f:
        escritor = csv.DictWriter(f, fieldnames=COLUNAS)
        escritor.writeheader()
        escritor.writerows(linhas)
    os.replace(temporario, ARQUIVO_SAIDA)


# ── Passos no site ────────────────────────────────────────────────────────────
def login_e_clinica(driver, wait):
    print("Abrindo página de login...")
    driver.get(URL_BASE + "/")

    campo_email = wait.until(EC.presence_of_element_located(
        (By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[1]/input")
    ))
    campo_email.send_keys("mmerlo++++dpegoraro@bionexo.com")
    driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[2]/button").click()
    print("E-mail preenchido, avançando para senha...")

    campo_senha = wait.until(EC.element_to_be_clickable((By.ID, "password")))
    campo_senha.click()
    campo_senha.send_keys("CNN@foguete")
    driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[4]/form/div[4]/button").click()
    time.sleep(5)
    print("Login realizado com sucesso.")

    for popup in driver.find_elements(By.XPATH, "//button[text()='X']"):
        if popup.is_displayed():
            clicar_js(driver, popup)
            time.sleep(1)
            print("Popup inicial fechado.")
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
    print(f"Clínica '{CLINICA}' selecionada.")


def listar_modelos(driver, wait):
    """Percorre a lista de modelos (aba padrão da tela de anamnese, com paginação, se houver)
    e devolve [(nome do modelo na lista, url de edição)] sem repetir.
    """
    seletor_link = "a[href*='/anamnese/modelo/visualiza/']"
    modelos = {}
    paginas = [URL_ANAMNESE]
    visitadas = set()

    while paginas:
        pagina = paginas.pop(0)
        if pagina in visitadas:
            continue
        visitadas.add(pagina)

        driver.get(pagina)
        wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, seletor_link)))
        time.sleep(1)

        # Lê nome (1ª coluna da linha) e link via JS — mais rápido e sem elementos "stale".
        itens = driver.execute_script("""
            return [...document.querySelectorAll(arguments[0])].map(a => {
                const tr = a.closest('tr');
                const td = tr ? tr.querySelector('td') : null;
                return [td ? td.textContent.trim() : '', a.href];
            });
        """, seletor_link)
        for nome, url in itens:
            modelos.setdefault(url, nome)

        for a in driver.find_elements(By.CSS_SELECTOR, "a.itemPaginacao"):
            href = a.get_attribute("href")
            if href and href not in visitadas:
                paginas.append(href)

    return [(nome, url) for url, nome in modelos.items()]


def ler_perguntas_do_modelo(driver, wait, url):
    """Abre o modelo e devolve (nome do modelo, [perguntas na ordem])."""
    driver.get(url)
    campo_nome = wait.until(EC.presence_of_element_located((By.ID, "nome-modelo")))
    wait.until(EC.presence_of_element_located((By.ID, "menu-perguntas")))
    time.sleep(0.5)

    nome_modelo = (campo_nome.get_attribute("value") or "").strip()

    # textContent em vez de .text: o menu tem rolagem e itens fora da área visível voltariam vazios.
    perguntas = driver.execute_script("""
        const itens = [...document.querySelectorAll('#menu-perguntas .menu-item')].map((item, i) => {
            const ordem = item.querySelector('input.ordem');
            const titulo = item.querySelector('.menu-title');
            return {
                ordem: ordem ? parseInt(ordem.value, 10) : i,
                titulo: titulo ? titulo.textContent.replace(/\\s+/g, ' ').trim() : '',
            };
        });
        itens.sort((a, b) => a.ordem - b.ordem);
        return itens.filter(i => i.titulo).map(i => i.titulo);
    """)
    return nome_modelo, perguntas


# ── Execução ──────────────────────────────────────────────────────────────────
def executar():
    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)

    linhas_saida = []
    erros = []

    try:
        login_e_clinica(driver, wait)

        modelos = listar_modelos(driver, wait)
        print(f"\n{len(modelos)} modelo(s) de anamnese encontrado(s).")
        total = len(modelos)

        for idx, (nome_lista, url) in enumerate(modelos, start=1):
            print(f"\n[{idx}/{total}] {nome_lista}")
            try:
                nome_modelo, perguntas = ler_perguntas_do_modelo(driver, wait, url)
                nome_modelo = nome_modelo or nome_lista
                print(f"  {len(perguntas)} pergunta(s).")

                for ordem, pergunta in enumerate(perguntas, start=1):
                    linhas_saida.append({"Questionario": nome_modelo, "Pergunta": pergunta, "Ordem": ordem})
                salvar_saida(linhas_saida)

            except Exception as e:
                if "invalid session" in str(e).lower() or "no such window" in str(e).lower():
                    raise  # navegador caiu: reinicia tudo
                print(f"  ERRO: {str(e).splitlines()[0] if str(e) else type(e).__name__}")
                erros.append(nome_lista)

        print(f"\nConcluído! {len(linhas_saida)} linha(s) gravada(s) em: {ARQUIVO_SAIDA}")
        if erros:
            print(f"Modelos com erro (rode de novo para tentar): {', '.join(erros)}")

    finally:
        driver.quit()


# Reinicia em caso de erro geral (são poucos modelos, então recomeça do zero)
while True:
    try:
        executar()
        break
    except Exception as e:
        print(f"\nERRO: {e}")
        print("Reiniciando em 10 segundos...")
        time.sleep(10)
