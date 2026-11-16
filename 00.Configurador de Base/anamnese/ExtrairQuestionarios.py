import csv
import os
import re
import time
from datetime import datetime

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains


# ── Configuração ──────────────────────────────────────────────────────────────
PASTA = os.path.dirname(os.path.abspath(__file__))
ARQUIVO_SAIDA = os.path.join(PASTA, "Questionarios_Perguntas.csv")
CLINICA = "CAMPINAS - GRUPO MANDIC"
HEADLESS = True

URL_ANAMNESE = "https://app.clinicanasnuvens.com.br/anamnese"
URL_BASE = "https://app.clinicanasnuvens.com.br"

COLUNAS = ["Questionario", "Pergunta", "Ordem"]

_arquivo_log = None


def log(msg):
    print(msg)
    if _arquivo_log:
        _arquivo_log.write(f"{datetime.now():%H:%M:%S} {msg}\n")
        _arquivo_log.flush()


def resumo_erro(e):
    """Primeira linha da mensagem; Selenium às vezes lança erro sem texto (ex.: TimeoutException)."""
    texto = (str(e) or "").replace("Message:", "").strip().splitlines()
    return f"{type(e).__name__}: {texto[0]}" if texto and texto[0] else type(e).__name__


def salvar_evidencia(driver, nome):
    """Print + HTML da tela na pasta erros/, para descobrir por que falhou."""
    try:
        pasta = os.path.join(PASTA, "erros")
        os.makedirs(pasta, exist_ok=True)
        base = os.path.join(pasta, f"{datetime.now():%Y%m%d_%H%M%S}_questionarios_{re.sub(r'\W+', '_', nome)[:40]}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        log(f"  Evidência salva em {base}.png (URL: {driver.current_url})")
    except Exception:
        pass


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


SELETOR_MODELO = "a[href*='/anamnese/modelo/visualiza/']"


def ler_modelos_da_tela(driver):
    """[(nome na 1ª coluna, link de edição)] da página da lista que está na tela."""
    return driver.execute_script("""
        return [...document.querySelectorAll(arguments[0])].map(a => {
            const tr = a.closest('tr');
            const td = tr ? tr.querySelector('td') : null;
            return [td ? td.textContent.replace(/\\s+/g, ' ').trim() : '', a.href];
        });
    """, SELETOR_MODELO)


def listar_modelos(driver, wait):
    """Percorre a lista de modelos de /anamnese página por página e devolve
    [(nome do modelo na lista, url de edição)] sem repetir.

    A paginação é por AJAX (/anamnese/modelo/lista?page=N devolve só um pedaço da
    página), então fica em /anamnese e clica no link da página seguinte (data-page),
    esperando a tabela trocar.
    """
    driver.get(URL_ANAMNESE)
    try:
        wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, SELETOR_MODELO)))
    except Exception:
        salvar_evidencia(driver, "lista_modelos")
        raise Exception("nenhum modelo de anamnese apareceu na lista") from None
    time.sleep(1)

    modelos = {}
    pagina = 0
    while True:
        itens = ler_modelos_da_tela(driver)
        novos = [i for i in itens if i[1] not in modelos]
        log(f"  Página {pagina + 1}: {len(itens)} modelo(s), {len(novos)} novo(s)")
        for nome, url in novos:
            modelos[url] = nome

        proxima = [a for a in driver.find_elements(By.CSS_SELECTOR, f"a.itemPaginacao[data-page='{pagina + 1}']")]
        if not proxima or not novos:
            break

        antes = [i[1] for i in itens]
        clicar_js(driver, proxima[0])
        try:
            WebDriverWait(driver, 15).until(
                lambda d: (lambda agora: agora and agora != antes)([i[1] for i in ler_modelos_da_tela(d)])
            )
        except Exception:
            salvar_evidencia(driver, f"lista_modelos_pagina_{pagina + 2}")
            raise Exception(f"a lista de modelos não mudou ao clicar na página {pagina + 2}") from None
        time.sleep(0.5)
        pagina += 1

    return [(nome, url) for url, nome in modelos.items()]


def ler_perguntas_do_modelo(driver, wait, url):
    """Abre o modelo e devolve (nome do modelo, [perguntas na ordem])."""
    driver.get(url)
    try:
        campo_nome = wait.until(EC.presence_of_element_located((By.ID, "nome-modelo")))
    except Exception:
        raise Exception("a tela do modelo abriu sem o campo do nome (#nome-modelo)") from None
    try:
        wait.until(EC.presence_of_element_located((By.ID, "menu-perguntas")))
    except Exception:
        raise Exception("a tela do modelo abriu sem a lista de perguntas (#menu-perguntas)") from None
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
        log(f"\n{len(modelos)} modelo(s) de anamnese encontrado(s).")
        total = len(modelos)

        for idx, (nome_lista, url) in enumerate(modelos, start=1):
            log(f"\n[{idx}/{total}] {nome_lista}")
            try:
                nome_modelo, perguntas = ler_perguntas_do_modelo(driver, wait, url)
                nome_modelo = nome_modelo or nome_lista
                log(f"  {len(perguntas)} pergunta(s).")

                for ordem, pergunta in enumerate(perguntas, start=1):
                    linhas_saida.append({"Questionario": nome_modelo, "Pergunta": pergunta, "Ordem": ordem})
                salvar_saida(linhas_saida)

            except Exception as e:
                if "invalid session" in str(e).lower() or "no such window" in str(e).lower():
                    raise  # navegador caiu: reinicia tudo
                log(f"  ERRO: {resumo_erro(e)}")
                salvar_evidencia(driver, nome_lista)
                erros.append(nome_lista)

        log(f"\nConcluído! {len(linhas_saida)} linha(s) gravada(s) em: {ARQUIVO_SAIDA}")
        if erros:
            log(f"Modelos com erro (rode de novo para tentar): {', '.join(erros)}")

    finally:
        driver.quit()


os.makedirs(os.path.join(PASTA, "logs"), exist_ok=True)
_arquivo_log = open(os.path.join(PASTA, "logs", f"questionarios_{datetime.now():%Y%m%d_%H%M%S}.log"),
                    "a", encoding="utf-8")

# Reinicia em caso de erro geral (são poucos modelos, então recomeça do zero)
while True:
    try:
        executar()
        break
    except Exception as e:
        log(f"\nERRO: {resumo_erro(e)}")
        log("Reiniciando em 10 segundos...")
        time.sleep(10)
