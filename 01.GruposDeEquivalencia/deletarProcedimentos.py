import csv
import os
import re
import time
import traceback
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains


# Exclui TODOS os procedimentos da clínica abaixo, um por um (sempre o 1º da lista).
CLINICA = "BRASILIA - GRUPO MANDIC"

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_LISTA = f"{URL_BASE}/procedimentos"

PASTA = os.path.dirname(os.path.abspath(__file__))
PASTA_ERROS = os.path.join(PASTA, "erros")
ARQUIVO_LOG = os.path.join(PASTA, "procedimentos_excluidos_log.csv")

# Quantos procedimentos excluir nesta execução (None = todos). Use 1 para testar.
LIMITE = None

# True = roda sem abrir a janela do Chrome
HEADLESS = True

# ── Internet lenta ─────────────────────────────────────────────────────────────
# Segundos que cada espera aguarda a página/botão aparecer antes de desistir
ESPERA = 60
# Quantas vezes tenta o mesmo procedimento antes de desistir dele
MAX_TENTATIVAS = 3
# Quantas vezes seguidas a lista pode falhar ao carregar antes de reabrir o navegador
MAX_FALHAS_LISTA = 5
# True = não baixa imagens (páginas carregam mais rápido)
BLOQUEAR_IMAGENS = True

# "Modo simples": o Chrome nem baixa estes arquivos. O JavaScript do sistema
# continua liberado (sem ele botões e modais não funcionam).
BLOQUEAR_ARQUIVOS = [
    # fontes e mídia
    "*.woff", "*.woff2", "*.ttf", "*.otf", "*.eot",
    "*.mp4", "*.webm", "*.mp3",
    # imagens (reforço ao BLOQUEAR_IMAGENS, pega também ícones e fundos de CSS)
    "*.png", "*.jpg", "*.jpeg", "*.gif", "*.svg", "*.webp", "*.ico",
    # serviços de terceiros (rastreamento, chat, analytics)
    "*google-analytics.com*", "*googletagmanager.com*", "*doubleclick.net*",
    "*hotjar.com*", "*clarity.ms*", "*intercom.io*", "*intercomcdn.com*",
    "*facebook.net*", "*facebook.com/tr*", "*hs-scripts.com*", "*hubspot.com*",
    "*sentry.io*", "*nr-data.net*", "*newrelic.com*", "*youtube.com*",
]
# True = também não baixa o CSS (bem mais leve, mas a página fica "crua" e
# modais podem aparecer abertos o tempo todo). Teste com LIMITE = 1 antes.
BLOQUEAR_CSS = False

# Procedimentos que já deram erro nesta execução — não tenta de novo (senão travaria
# para sempre no 1º da lista). Fica fora de executar() para sobreviver ao reinício.
FALHARAM = set()
TENTATIVAS = {}


class PaginaNaoCarregou(Exception):
    pass


def registrar_log(id_proc, nome, status, erro=""):
    """Acrescenta uma linha no histórico (procedimentos_excluidos_log.csv)."""
    novo = not os.path.exists(ARQUIVO_LOG)
    with open(ARQUIVO_LOG, "a", newline="", encoding="utf-8") as f:
        escritor = csv.writer(f)
        if novo:
            escritor.writerow(["data", "clinica", "idProcedimento", "nome", "status", "erro"])
        escritor.writerow([f"{datetime.now():%d/%m/%Y %H:%M:%S}", CLINICA, id_proc, nome, status, erro])


def salvar_print_erro(driver, nome):
    try:
        os.makedirs(PASTA_ERROS, exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)
        base = os.path.join(PASTA_ERROS, f"excluir_{nome}_{datetime.now():%Y%m%d_%H%M%S}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        print(f"  Print salvo em {base}.png")
    except Exception:
        pass


def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    driver.execute_script("arguments[0].click();", elemento)


def id_do_link(href):
    """'/procedimento/1203932?page=&ativo=' -> '1203932'"""
    achou = re.search(r"/procedimento/(\d+)", href or "")
    return achou.group(1) if achou else ""


def abrir(driver, url, tentativas=3):
    """driver.get que tenta de novo se a página demorar demais para carregar."""
    for tentativa in range(1, tentativas + 1):
        try:
            driver.get(url)
            return
        except TimeoutException:
            print(f"  Página demorando para carregar (tentativa {tentativa}/{tentativas})...")
            try:
                driver.execute_script("window.stop();")
            except Exception:
                pass
    raise PaginaNaoCarregou(f"{url} não carregou após {tentativas} tentativas")


def links_da_lista(driver):
    """Abre a lista e devolve [(id, nome, link)] dos botões Editar visíveis.

    Lista vazia só é devolvida quando a página carregou de fato (campo de busca na tela)
    e não há procedimentos. Se a página não carregar, levanta PaginaNaoCarregou — assim
    internet lenta nunca é confundida com "acabaram os procedimentos".
    """
    abrir(driver, URL_LISTA)
    try:
        WebDriverWait(driver, ESPERA).until(lambda d:
            d.find_elements(By.CSS_SELECTOR, "a.visualizar-procedimento")
            or (d.find_elements(By.ID, "nomeTipoProcedimento")
                and d.execute_script("return document.readyState") == "complete")
        )
    except TimeoutException:
        raise PaginaNaoCarregou("a lista de procedimentos não carregou")
    time.sleep(1)

    itens = []
    for link in driver.find_elements(By.CSS_SELECTOR, "a.visualizar-procedimento"):
        id_proc = id_do_link(link.get_attribute("href"))
        if not id_proc:
            continue
        try:
            nome = link.find_element(By.XPATH, "./ancestor::tr[1]").text.split("\n")[0].strip()
        except Exception:
            nome = ""
        itens.append((id_proc, nome, link))
    return itens


def excluir_procedimento(driver, link):
    """Editar > Excluir procedimento > Excluir (confirmação no modal)."""
    clicar(driver, link)
    botao_excluir = WebDriverWait(driver, ESPERA).until(EC.presence_of_element_located(
        (By.CSS_SELECTOR, "button[data-bs-target='#excluir']")
    ))
    time.sleep(1)
    clicar(driver, botao_excluir)

    # Botão "Excluir" de dentro do modal de confirmação
    confirmar = WebDriverWait(driver, ESPERA).until(lambda d: next(
        (b for b in d.find_elements(By.CSS_SELECTOR, "#excluir button[type='submit']") if b.is_displayed()),
        False,
    ))
    url_antes = driver.current_url
    clicar(driver, confirmar)

    try:
        WebDriverWait(driver, ESPERA).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("a página não saiu do procedimento depois de Excluir (o sistema recusou?)")
    time.sleep(1)


def executar():
    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1920,1080")
    # "eager": não espera imagens/scripts externos terminarem para liberar a página
    opcoes.page_load_strategy = "eager"
    if BLOQUEAR_IMAGENS:
        opcoes.add_experimental_option("prefs", {
            "profile.managed_default_content_settings.images": 2,
            "profile.default_content_setting_values.notifications": 2,
        })
    # Desliga recursos do Chrome que gastam rede e não servem para o robô
    for argumento in ("--disable-extensions", "--disable-background-networking",
                      "--disable-component-update", "--disable-sync",
                      "--disable-default-apps", "--no-first-run", "--mute-audio"):
        opcoes.add_argument(argumento)
    driver = webdriver.Chrome(options=opcoes)
    driver.set_page_load_timeout(ESPERA * 2)

    bloqueados = BLOQUEAR_ARQUIVOS + (["*.css"] if BLOQUEAR_CSS else [])
    if bloqueados:
        driver.execute_cdp_cmd("Network.enable", {})
        driver.execute_cdp_cmd("Network.setBlockedURLs", {"urls": bloqueados})
        print(f"Modo simples: {len(bloqueados)} tipo(s) de arquivo bloqueado(s)")
    wait = WebDriverWait(driver, ESPERA)

    try:
        # ── Login ──────────────────────────────────────────────────────────────
        abrir(driver, f"{URL_BASE}/")

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

        # Confere que a clínica selecionada é a certa antes de excluir qualquer coisa
        try:
            wait.until(lambda d: CLINICA.lower() in d.find_element(By.ID, "clinica-selecionada").text.lower())
        except TimeoutException:
            selecionada = driver.find_element(By.ID, "clinica-selecionada").text
            raise Exception(f"clínica selecionada é '{selecionada}', não '{CLINICA}' — nada foi excluído")

        # ── Loop: sempre o 1º procedimento da lista que ainda não falhou ──────
        inicio = time.time()
        excluidos = erros = 0

        falhas_lista = 0

        while LIMITE is None or excluidos + erros < LIMITE:
            try:
                pendentes = [item for item in links_da_lista(driver) if item[0] not in FALHARAM]
                falhas_lista = 0
            except PaginaNaoCarregou as e:
                falhas_lista += 1
                if falhas_lista >= MAX_FALHAS_LISTA:
                    raise
                print(f"  {e} — esperando 15s e tentando de novo ({falhas_lista}/{MAX_FALHAS_LISTA})")
                time.sleep(15)
                continue
            if not pendentes:
                break

            id_proc, nome, link = pendentes[0]
            numero = excluidos + erros + 1
            print(f"\n[{numero}] Excluindo {id_proc}: {nome}")

            try:
                excluir_procedimento(driver, link)

                # Confirma que sumiu da lista
                if any(item[0] == id_proc for item in links_da_lista(driver)):
                    raise Exception("o procedimento continua na lista depois de excluir")

                excluidos += 1
                registrar_log(id_proc, nome, "excluido")
                media = (time.time() - inicio) / numero
                print(f"  Excluído. ({media:.1f}s/procedimento)")

            except Exception as e:
                TENTATIVAS[id_proc] = TENTATIVAS.get(id_proc, 0) + 1
                print(f"  ERRO: {type(e).__name__}: {e}")
                if TENTATIVAS[id_proc] < MAX_TENTATIVAS:
                    # Provavelmente lentidão: tenta o mesmo procedimento de novo na próxima volta
                    print(f"  Vai tentar de novo ({TENTATIVAS[id_proc]}/{MAX_TENTATIVAS})")
                    time.sleep(5)
                    continue
                erros += 1
                FALHARAM.add(id_proc)
                salvar_print_erro(driver, id_proc)
                registrar_log(id_proc, nome, "erro", str(e))

        try:
            restantes = len(links_da_lista(driver))
        except PaginaNaoCarregou:
            restantes = 0
        print(f"\nFim! {excluidos} excluído(s), {erros} erro(s) em {time.time() - inicio:.0f}s.")
        if restantes:
            print(f"Ainda há {restantes} procedimento(s) na 1ª página da lista "
                  f"(os que deram erro ou o LIMITE foi atingido).")

    except Exception:
        salvar_print_erro(driver, "sessao")
        raise

    finally:
        driver.quit()


if __name__ == "__main__":
    print(f"ATENÇÃO: este script EXCLUI os procedimentos da clínica '{CLINICA}'.")
    print("A exclusão não pode ser desfeita." + (f" Limite desta execução: {LIMITE}." if LIMITE else " Vai excluir TODOS."))
    if input("Digite EXCLUIR para continuar: ").strip() != "EXCLUIR":
        print("Cancelado.")
        raise SystemExit

    # Reinicia em caso de erro de sessão (os que falharam continuam sendo pulados)
    while True:
        try:
            executar()
            break
        except Exception as e:
            print(f"\nERRO: {type(e).__name__}: {e}")
            traceback.print_exc(limit=3)
            print("Reiniciando em 10 segundos...")
            time.sleep(10)
