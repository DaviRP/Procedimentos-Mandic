import csv
import re
import time
import traceback
import unicodedata
from pathlib import Path
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait, Select
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


PASTA = Path(__file__).resolve().parent
PASTA_ERROS = PASTA / "erros"
ARQUIVO_LOG = PASTA / "autorizacoes_log.csv"
CLINICA = "GRANDE VITORIA - GRUPO MANDIC"
URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_LISTA = f"{URL_BASE}/plano-tratamento/solicitacao-autorizacao/lista"

DESCONTO_PERCENTUAL = 100
SENHA_DESCONTO = "23092601"

# Quantos planos autorizar nesta execução (None = todos). Use 1 para testar.
LIMITE_PLANOS = None

# True = roda sem abrir a janela do Chrome
HEADLESS = True

# Planos já tentados nesta execução (sucesso ou erro). Fica fora de executar()
# para sobreviver ao reinício automático e não ficar preso num plano com erro.
TENTADOS = set()


def texto(valor):
    return str(valor).strip() if valor is not None else ""


def normalizar(valor):
    """Minúsculas, sem acentos e com espaços simples — para comparar nomes."""
    valor = unicodedata.normalize("NFKD", texto(valor))
    valor = "".join(c for c in valor if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", valor).strip().lower()


def formatar_duracao(segundos):
    segundos = int(segundos)
    horas, resto = divmod(segundos, 3600)
    minutos, segundos = divmod(resto, 60)
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"


def registrar_log(id_plano, descricao, status, erro=""):
    """Acrescenta uma linha em autorizacoes_log.csv (histórico de tudo que foi feito)."""
    novo = not ARQUIVO_LOG.exists()
    with open(ARQUIVO_LOG, "a", newline="", encoding="utf-8") as f:
        escritor = csv.writer(f)
        if novo:
            escritor.writerow(["data", "idPlano", "descricao", "status", "erro"])
        escritor.writerow([f"{datetime.now():%d/%m/%Y %H:%M:%S}", id_plano, descricao, status, erro])


def salvar_print_erro(driver, nome):
    try:
        PASTA_ERROS.mkdir(exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)
        driver.save_screenshot(str(PASTA_ERROS / f"{nome}.png"))
        print(f"  Screenshot salvo em {PASTA_ERROS / (nome + '.png')}")
    except Exception:
        pass


# ── Utilitários de tela ────────────────────────────────────────────────────────

def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    driver.execute_script("arguments[0].click();", elemento)


def visivel(driver, seletor, raiz=None, timeout=15):
    """Espera e devolve o primeiro elemento visível que casa com o seletor CSS."""
    raiz = raiz or driver
    return WebDriverWait(driver, timeout).until(lambda d: next(
        (e for e in raiz.find_elements(By.CSS_SELECTOR, seletor) if e.is_displayed()),
        False,
    ))


def botao_submit(driver, rotulo, perto_de=None, timeout=10):
    """Botão submit visível com o `rotulo` no texto.

    Procura primeiro no form/modal/canvas de `perto_de`; se não achar, na página toda.
    """
    raizes = []
    if perto_de is not None:
        raizes += perto_de.find_elements(By.XPATH, (
            "./ancestor::*[self::form or contains(concat(' ', @class, ' '), ' modal ')"
            " or contains(@class, 'offcanvas') or contains(@class, 'drawer')][1]"
        ))
    raizes.append(driver)

    def procurar(d):
        for raiz in raizes:
            botoes = [
                b for b in raiz.find_elements(By.CSS_SELECTOR, "button[type='submit']")
                if b.is_displayed() and normalizar(rotulo) in normalizar(b.text)
            ]
            if botoes:
                return botoes[-1]
        return False

    try:
        return WebDriverWait(driver, timeout).until(procurar)
    except TimeoutException:
        raise Exception(f"botão '{rotulo}' não encontrado")


def esperar_sumir(driver, elemento, mensagem, timeout=15):
    try:
        WebDriverWait(driver, timeout).until(lambda d: not elemento.is_displayed())
    except TimeoutException:
        raise Exception(mensagem)
    except Exception:
        pass  # elemento removido da página = sumiu


def confirmar_alerta_se_houver(driver, timeout=2):
    """Se aparecer um alerta de confirmação (SweetAlert), clica em confirmar."""
    try:
        botao = visivel(driver, ".swal2-confirm", timeout=timeout)
        clicar(driver, botao)
        time.sleep(1)
    except TimeoutException:
        pass


def ler_numero(valor):
    """'1.234,56' / '1,234.56' / '100.00' -> float (o último separador é o decimal)."""
    valor = re.sub(r"[^\d,.]", "", texto(valor))
    if not valor:
        return None
    posicao = max(valor.rfind(","), valor.rfind("."))
    if posicao == -1:
        return float(valor)
    inteiro = re.sub(r"\D", "", valor[:posicao]) or "0"
    decimal = re.sub(r"\D", "", valor[posicao + 1:])
    return float(f"{inteiro}.{decimal}")


def preencher_valor(driver, campo, numero):
    """Preenche um campo com máscara de dinheiro e confere o valor final.

    Máscaras de dinheiro às vezes tratam os dígitos como centavos ('100' vira 1,00),
    então tenta algumas formas de digitar até o campo mostrar o número certo.
    """
    for digitado in (f"{numero}", f"{numero}00", f"{numero},00", f"{numero}.00"):
        campo.click()
        driver.execute_script("arguments[0].select();", campo)
        campo.send_keys(Keys.BACKSPACE)
        campo.send_keys(digitado)
        time.sleep(0.3)

        if ler_numero(campo.get_attribute("value")) == float(numero):
            return

    raise Exception(f"não foi possível preencher o valor {numero} (campo ficou '{campo.get_attribute('value')}')")


# ── Passos na plataforma ───────────────────────────────────────────────────────

def proximo_plano(driver):
    """Abre a lista de solicitações e devolve (id, url, descrição) do 1º plano ainda não tentado."""
    driver.get(URL_LISTA)

    seletor = "a[title='Autorizar'][href*='/plano-tratamento/negociacao/']"
    try:
        WebDriverWait(driver, 15).until(EC.presence_of_element_located((By.CSS_SELECTOR, seletor)))
    except TimeoutException:
        return None
    time.sleep(1)

    for link in driver.find_elements(By.CSS_SELECTOR, seletor):
        url = link.get_attribute("href")
        id_plano = url.rstrip("/").split("/")[-1]
        if id_plano in TENTADOS:
            continue

        try:
            descricao = " | ".join(texto(link.find_element(By.XPATH, "./ancestor::tr[1]").text).split("\n"))
        except Exception:
            descricao = ""
        return id_plano, url, descricao

    return None


def aplicar_desconto(driver, wait):
    """Adicionar desconto/acréscimo > marcar todos > % > 100 > Aplicar > senha > Salvar."""
    clicar(driver, wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "a.adicionar-desconto-acrescimo"))))
    time.sleep(1)

    marcar_todos = wait.until(EC.presence_of_element_located((By.ID, "check-desconto-acrescimo")))
    if not marcar_todos.is_selected():
        clicar(driver, marcar_todos)
        time.sleep(0.5)
    if not marcar_todos.is_selected():
        raise Exception("não foi possível marcar todos os itens do desconto")

    tipo_valor = visivel(driver, "select.rp-tipo-valor")
    Select(tipo_valor).select_by_value("RELATIVO")
    time.sleep(0.5)

    preencher_valor(driver, visivel(driver, "input.rp-valor"), DESCONTO_PERCENTUAL)

    clicar(driver, visivel(driver, "a.aplicar-desconto-acrescimo"))
    time.sleep(1)

    campo_senha = wait.until(EC.visibility_of_element_located((By.ID, "senha-desc-acresc")))
    campo_senha.clear()
    campo_senha.send_keys(SENHA_DESCONTO)

    clicar(driver, botao_submit(driver, "Salvar", perto_de=campo_senha))
    confirmar_alerta_se_houver(driver)
    esperar_sumir(driver, campo_senha, "o desconto não foi salvo (senha ou validação?)")
    time.sleep(1.5)


def limpar_condicoes_pagamento(driver, wait):
    """Definir condições de pagamento > Excluir parcelas > Salvar."""
    clicar(driver, wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "a.definir-condicoes-pagamento"))))
    time.sleep(1)

    botao_excluir = visivel(driver, "a.limpar-parcelas")
    clicar(driver, botao_excluir)
    time.sleep(0.5)
    confirmar_alerta_se_houver(driver)

    botao_salvar = botao_submit(driver, "Salvar", perto_de=botao_excluir)
    clicar(driver, botao_salvar)
    confirmar_alerta_se_houver(driver)
    esperar_sumir(driver, botao_salvar, "as condições de pagamento não foram salvas")
    time.sleep(1.5)


def concluir(driver, wait):
    """Clica em Concluir e espera sair da tela de negociação."""
    url_antes = driver.current_url
    clicar(driver, botao_submit(driver, "Concluir"))
    confirmar_alerta_se_houver(driver)

    try:
        WebDriverWait(driver, 30).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("o plano não foi concluído (a página não saiu da negociação)")
    time.sleep(1)


def autorizar_plano(driver, wait, url):
    driver.get(url)
    time.sleep(2)

    aplicar_desconto(driver, wait)
    limpar_condicoes_pagamento(driver, wait)
    concluir(driver, wait)


def executar():
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

        # ── Loop principal: sempre o 1º plano da lista ainda não tentado ──────
        inicio = time.time()
        autorizados = 0
        erros = 0

        while LIMITE_PLANOS is None or autorizados + erros < LIMITE_PLANOS:
            proximo = proximo_plano(driver)
            if proximo is None:
                print("\nNenhum plano pendente na lista.")
                break

            id_plano, url, descricao = proximo
            TENTADOS.add(id_plano)
            numero = autorizados + erros + 1
            print(f"\n[{numero}] {'─' * 60}")
            print(f"  Plano {id_plano}: {descricao}")

            inicio_plano = time.time()
            try:
                autorizar_plano(driver, wait, url)
                autorizados += 1
                registrar_log(id_plano, descricao, "autorizado")
                media = (time.time() - inicio) / numero
                print(f"  Autorizado em {time.time() - inicio_plano:.1f}s | média {media:.1f}s/plano")

            except Exception as e:
                erros += 1
                print(f"  ERRO no plano {id_plano}: {e}")
                salvar_print_erro(driver, f"autorizacao_{id_plano}")
                registrar_log(id_plano, descricao, "erro", str(e))

        print(
            f"\nFim! {autorizados} autorizado(s), {erros} erro(s). "
            f"Tempo total: {formatar_duracao(time.time() - inicio)}"
        )

    except Exception:
        # Salva o estado da tela para diagnosticar onde travou
        try:
            driver.save_screenshot(str(PASTA / "erro.png"))
            with open(PASTA / "erro.html", "w", encoding="utf-8") as f:
                f.write(driver.page_source)
            print(f"\nURL no momento do erro: {driver.current_url}")
            print(f"Screenshot salvo em {PASTA / 'erro.png'}")
        except Exception:
            pass
        raise

    finally:
        driver.quit()


if __name__ == "__main__":
    # Reinicia tudo do zero em caso de qualquer erro
    while True:
        try:
            executar()
            break
        except Exception as e:
            print(f"\nERRO: {type(e).__name__}: {e}")
            traceback.print_exc(limit=3)
            print("Reiniciando em 10 segundos...")
            time.sleep(10)
