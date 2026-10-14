import csv
import os
import re
import time
import traceback
from pathlib import Path
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains


PASTA = Path(__file__).resolve().parent
PASTA_ERROS = PASTA / "erros"
ARQUIVO = PASTA / "perfis de tratamento.csv"
CLINICA = "BRASILIA - GRUPO MANDIC"

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_LISTA = f"{URL_BASE}/perfil-tratamento/lista"
URL_NOVO = f"{URL_BASE}/perfil-tratamento/novo"

# Quantos perfis cadastrar nesta execução (None = todos). Use 1 para testar.
LIMITE_PERFIS = None

# True = roda sem abrir a janela do Chrome
HEADLESS = False

SELETOR_OPCAO = "input[name^='opcoes['][name$='].nome']"


def texto(valor):
    return str(valor).strip() if valor is not None else ""


# ── Planilha ───────────────────────────────────────────────────────────────────

def ler_csv():
    with open(ARQUIVO, newline="", encoding="utf-8-sig") as f:
        leitor = csv.DictReader(f)
        cabecalho = list(leitor.fieldnames)
        linhas = list(leitor)
    if "Status" not in cabecalho:
        cabecalho.append("Status")
    return cabecalho, linhas


def carregar_perfis():
    """Agrupa o CSV em {perfil: [subperfis]}, na ordem do arquivo.

    Pula perfis cujas linhas já estejam marcadas como 'cadastrado' ou 'erro' na coluna Status.
    """
    _, linhas = ler_csv()
    perfis = {}
    for linha in linhas:
        perfil = texto(linha.get("perfil"))
        subperfil = texto(linha.get("Subperfil"))
        if not perfil:
            continue
        if texto(linha.get("Status")).lower() in ("cadastrado", "erro"):
            continue
        subperfis = perfis.setdefault(perfil, [])
        if subperfil and subperfil not in subperfis:
            subperfis.append(subperfil)
    return perfis


def marcar_status(perfil, valor):
    """Marca todas as linhas do perfil na coluna Status (grava numa cópia e troca, para não corromper)."""
    cabecalho, linhas = ler_csv()
    for linha in linhas:
        if texto(linha.get("perfil")) == perfil:
            linha["Status"] = valor

    temporario = ARQUIVO.with_suffix(".tmp")
    with open(temporario, "w", newline="", encoding="utf-8") as f:
        escritor = csv.DictWriter(f, fieldnames=cabecalho)
        escritor.writeheader()
        escritor.writerows(linhas)
    os.replace(temporario, ARQUIVO)


def salvar_print_erro(driver, nome):
    try:
        PASTA_ERROS.mkdir(exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)
        base = PASTA_ERROS / f"{nome}_{datetime.now():%Y%m%d_%H%M%S}"
        driver.save_screenshot(f"{base}.png")
        with open(f"{base}.html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        print(f"  Print salvo em {base}.png")
    except Exception:
        pass


# ── Utilitários de tela ────────────────────────────────────────────────────────

def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    driver.execute_script("arguments[0].click();", elemento)


def visivel(driver, seletor, timeout=15):
    """Espera e devolve o primeiro elemento visível que casa com o seletor CSS."""
    return WebDriverWait(driver, timeout).until(lambda d: next(
        (e for e in d.find_elements(By.CSS_SELECTOR, seletor) if e.is_displayed()),
        False,
    ))


def campos_opcao(driver):
    """Campos 'Preencha o nome da opção aqui' visíveis, na ordem da tela."""
    return [e for e in driver.find_elements(By.CSS_SELECTOR, SELETOR_OPCAO) if e.is_displayed()]


def digitar(campo, valor):
    campo.clear()
    campo.send_keys(valor)
    if texto(campo.get_attribute("value")) != valor:
        raise Exception(f"o campo ficou '{campo.get_attribute('value')}' em vez de '{valor}'")


# ── Passos na plataforma ───────────────────────────────────────────────────────

def cadastrar_perfil(driver, perfil, subperfis):
    """Adicionar perfil > nome > uma opção por subperfil > Salvar."""
    driver.get(URL_LISTA)
    clicar(driver, visivel(driver, f"a[href='/perfil-tratamento/novo']"))
    WebDriverWait(driver, 15).until(lambda d: "/perfil-tratamento/novo" in d.current_url)

    digitar(visivel(driver, "#perfil-nome"), perfil)

    for i, subperfil in enumerate(subperfis):
        if i > 0:
            # Só cria o próximo campo quando ainda há subperfil para ele (nunca sobra campo vazio)
            quantidade = len(campos_opcao(driver))
            clicar(driver, visivel(driver, "#btn-add-alternativa"))
            try:
                WebDriverWait(driver, 10).until(lambda d: len(campos_opcao(d)) > quantidade)
            except TimeoutException:
                raise Exception(f"'Adicionar opção' não criou o campo para '{subperfil}'")

        campos = campos_opcao(driver)
        if not campos:
            raise Exception("campo de opção não encontrado")
        digitar(campos[-1], subperfil)

    # Confere antes de salvar: um campo por subperfil, nenhum em branco
    preenchidos = [texto(c.get_attribute("value")) for c in campos_opcao(driver)]
    if preenchidos != subperfis:
        raise Exception(f"opções na tela não batem com a planilha: {preenchidos}")

    botoes = [b for b in driver.find_elements(By.CSS_SELECTOR, "button[type='submit']")
              if b.is_displayed() and "salvar" in b.text.lower()]
    if not botoes:
        raise Exception("botão 'Salvar' não encontrado")
    url_antes = driver.current_url
    clicar(driver, botoes[-1])

    try:
        WebDriverWait(driver, 20).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("o perfil não foi salvo (a página continuou no formulário — nome repetido ou campo inválido?)")
    time.sleep(1)


def executar():
    perfis = carregar_perfis()
    if not perfis:
        print("Nenhum perfil pendente na planilha.")
        return

    print(f"{len(perfis)} perfil(is) pendente(s):")
    for perfil, subperfis in perfis.items():
        print(f"  - {perfil}: {', '.join(subperfis)}")

    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
        opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    if not HEADLESS:
        driver.maximize_window()
    wait = WebDriverWait(driver, 15)

    try:
        # ── Login ──────────────────────────────────────────────────────────────
        driver.get(f"{URL_BASE}/")

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

        # ── Loop principal ─────────────────────────────────────────────────────
        inicio = time.time()
        cadastrados = erros = 0

        for numero, (perfil, subperfis) in enumerate(perfis.items(), start=1):
            if LIMITE_PERFIS is not None and numero > LIMITE_PERFIS:
                break
            print(f"\n[{numero}/{len(perfis)}] {perfil} ({len(subperfis)} subperfil(is))")

            try:
                cadastrar_perfil(driver, perfil, subperfis)
                marcar_status(perfil, "cadastrado")
                cadastrados += 1
                print("  Cadastrado.")
            except Exception as e:
                erros += 1
                print(f"  ERRO: {type(e).__name__}: {e}")
                salvar_print_erro(driver, perfil)
                marcar_status(perfil, "erro")
                print("  Marcado como erro na planilha.")

        print(f"\nFim! {cadastrados} cadastrado(s), {erros} erro(s) em {time.time() - inicio:.0f}s.")

    except Exception:
        salvar_print_erro(driver, "sessao")
        raise

    finally:
        driver.quit()


if __name__ == "__main__":
    # Reinicia tudo do zero em caso de qualquer erro (perfis já marcados são pulados)
    while True:
        try:
            executar()
            break
        except Exception as e:
            print(f"\nERRO: {type(e).__name__}: {e}")
            traceback.print_exc(limit=3)
            print("Reiniciando em 10 segundos...")
            time.sleep(10)
