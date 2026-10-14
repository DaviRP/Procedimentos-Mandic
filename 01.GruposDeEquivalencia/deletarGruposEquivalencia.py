import builtins
import csv
import os
import re
import shutil
import sys
import threading
import time
import traceback
from collections import deque
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains


# Exclui TODOS os grupos de equivalência da clínica abaixo, com vários navegadores.
CLINICA = "BRASILIA - GRUPO MANDIC"

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_LISTA = f"{URL_BASE}/grupo-equivalencia/lista"
SELETOR_EDITAR = "a[href*='/grupo-equivalencia/visualizar/']"

PASTA = os.path.dirname(os.path.abspath(__file__))
PASTA_ERROS = os.path.join(PASTA, "erros")
PASTA_LOGS = os.path.join(PASTA, "logs")
ARQUIVO_LOG = os.path.join(PASTA, "grupos_excluidos_log.csv")  # histórico de exclusões (sempre gravado)

# Quantos navegadores trabalham ao mesmo tempo (cada Chrome usa ~0,5–1 GB de RAM)
NUM_NAVEGADORES = 2
# Segundos entre o login de um navegador e o do próximo
INTERVALO_ENTRE_LOGINS = 15
# Quantos grupos excluir nesta execução, somando todos os navegadores (None = todos). Use 1 para testar.
LIMITE = None
# True = roda sem abrir a janela do Chrome
HEADLESS = True
# True = painel atualizado no terminal; o log detalhado vai para PASTA_LOGS.
# False = log corrido no terminal, como antes.
PAINEL = True
# True = salva print (.png) e HTML da tela de cada grupo com erro em PASTA_ERROS
SALVAR_PRINTS_ERRO = True
# True = grava o log detalhado da execução em PASTA_LOGS
GERAR_LOG = True

# ── Internet lenta ─────────────────────────────────────────────────────────────
ESPERA = 60            # segundos que cada espera aguarda a página/botão aparecer
MAX_TENTATIVAS = 3     # tentativas no mesmo grupo antes de desistir dele
MAX_FALHAS_LISTA = 5   # falhas seguidas ao carregar a lista antes de reabrir o navegador

# ── Estado compartilhado entre os navegadores ─────────────────────────────────
trava = threading.Lock()
trava_print = threading.Lock()
EM_ANDAMENTO = set()   # grupos que algum navegador está excluindo agora (ninguém mais pega)
FALHARAM = set()       # grupos que esgotaram as tentativas (todos pulam)
TENTATIVAS = {}
CONTADORES = {"excluidos": 0, "erros": 0, "reservados": 0, "na_lista": None}

# Estado mostrado no painel (protegido por trava)
navegadores = {}            # "N1" -> {status, grupo, etapa, desde, feitos}
eventos = deque(maxlen=12)  # (hora, navegador, cor, texto)
erros_execucao = []         # (id, nome, motivo)

painel_ativo = False
log_arquivo = None


class PaginaNaoCarregou(Exception):
    pass


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
    """'TimeoutException' ou 'Exception: a página não saiu do grupo...' — uma linha só."""
    detalhe = re.sub(r"^Message:\s*(None)?", "", str(e).strip().split("\n")[0]).strip()[:70]
    return f"{type(e).__name__}{': ' + detalhe if detalhe else ''}"


def formatar_duracao(segundos):
    segundos = int(segundos)
    horas, resto = divmod(segundos, 3600)
    minutos, segundos = divmod(resto, 60)
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"


# ── Painel ─────────────────────────────────────────────────────────────────────
VERDE, VERMELHO, AMARELO, AZUL, CINZA, NEGRITO = "\033[32m", "\033[31m", "\033[33m", "\033[36m", "\033[2m", "\033[1m"
FIM = "\033[0m"

ESTILO_STATUS = {
    "trabalhando": (VERDE, "●"),
    "logando": (AZUL, "◐"),
    "aguardando": (CINZA, "○"),
    "esperando": (AMARELO, "◌"),
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


def montar_painel(inicio, parar):
    largura, altura = shutil.get_terminal_size((110, 40))
    largura -= 1
    agora = time.time()

    with trava:
        excluidos, erros, na_lista = CONTADORES["excluidos"], CONTADORES["erros"], CONTADORES["na_lista"]
        navs = {nome: dict(info) for nome, info in navegadores.items()}
        ultimos = list(eventos)
        ultimos_erros = erros_execucao[-5:]

    decorrido = agora - inicio
    feitos = excluidos + erros
    ritmo = feitos / (decorrido / 60) if decorrido > 0 and feitos else 0

    tela = [
        montar_linha(largura, (" Excluir grupos de equivalência ", NEGRITO), (f"· {CLINICA}", ""),
                     (f"   {datetime.now():%d/%m %H:%M:%S}", CINZA)),
        montar_linha(largura, (" " + "─" * (largura - 2), CINZA)),
    ]
    if LIMITE:
        tamanho_barra = max(10, min(50, largura - 30))
        cheio = int(tamanho_barra * min(feitos, LIMITE) / LIMITE)
        tela.append(montar_linha(largura, (" Progresso  ", ""), ("█" * cheio, VERDE),
                                 ("░" * (tamanho_barra - cheio), CINZA),
                                 (f"  {feitos}/{LIMITE}  {100 * feitos / LIMITE:.1f}%", NEGRITO)))
    tela.append(montar_linha(
        largura, ("            ✔ excluídos ", ""), (str(excluidos), VERDE),
        ("   ✖ erros ", ""), (str(erros), VERMELHO if erros else ""),
        (f"   decorrido {formatar_duracao(decorrido)}", ""),
    ))
    if feitos:
        previsao = f"ritmo {ritmo:.1f} grupos/min"
        if LIMITE:
            restante = (decorrido / feitos) * max(0, LIMITE - feitos)
            previsao += f"   restante {formatar_duracao(restante)}   término {datetime.now() + timedelta(seconds=restante):%d/%m %H:%M}"
    else:
        previsao = "calculando ritmo..."
    if na_lista is not None:
        previsao += f"   na lista (última leitura): {na_lista}"
    tela.append(montar_linha(largura, ("            " + previsao, CINZA)))
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
            (f"{info['grupo'][:34]:<34}  ", ""),
            (info["etapa"], ""),
            (f"  {segundos}s" if info["status"] in ("trabalhando", "logando", "esperando") else "", CINZA),
        ))

    if ultimos_erros:
        tela += ["", montar_linha(largura, (f" Últimos erros ({erros} no total" +
                                            (f" — prints em {PASTA_ERROS})" if SALVAR_PRINTS_ERRO else ")"), NEGRITO))]
        for id_grupo, nome_grupo, motivo in ultimos_erros:
            tela.append(montar_linha(largura, (f"  ✖ {id_grupo} {nome_grupo} ", VERMELHO), (motivo, "")))

    tela += ["", montar_linha(largura, (" Últimos eventos", NEGRITO))]
    espaco = max(1, altura - len(tela) - 2)
    for hora, nome, cor, texto in ultimos[-espaco:]:
        tela.append(montar_linha(largura, (f"  {hora} ", CINZA), (f"{nome:<3} ", NEGRITO), (texto, cor)))

    tela.append("")
    tela.append(montar_linha(largura, (f" Log completo: {log_arquivo.name}" if log_arquivo
                                       else " Log em arquivo desligado (GERAR_LOG = False)", CINZA)))
    return tela[:altura - 1]


def desenhar_painel(inicio, parar, parar_painel):
    """Redesenha o painel a cada segundo numa tela separada do terminal."""
    builtins.print("\033[?1049h\033[?25l", end="", flush=True)  # tela alternativa + esconde cursor
    try:
        while True:
            try:
                tela = montar_painel(inicio, parar)
                builtins.print("\033[H" + "\n".join(linha + "\033[K" for linha in tela) + "\033[J",
                               end="", flush=True)
            except Exception as e:
                print(f"Falha ao desenhar o painel: {e}")
            if parar_painel.wait(1):
                break
    finally:
        builtins.print("\033[?25h\033[?1049l", end="", flush=True)  # volta ao terminal normal


def registrar_log(id_grupo, nome, status, erro=""):
    """Acrescenta uma linha no histórico (grupos_excluidos_log.csv)."""
    with trava:
        novo = not os.path.exists(ARQUIVO_LOG)
        with open(ARQUIVO_LOG, "a", newline="", encoding="utf-8") as f:
            escritor = csv.writer(f)
            if novo:
                escritor.writerow(["data", "clinica", "idGrupo", "nome", "status", "erro"])
            escritor.writerow([f"{datetime.now():%d/%m/%Y %H:%M:%S}", CLINICA, id_grupo, nome, status, erro])


def salvar_print_erro(driver, nome):
    if not SALVAR_PRINTS_ERRO:
        return
    try:
        os.makedirs(PASTA_ERROS, exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)
        base = os.path.join(PASTA_ERROS, f"excluir_grupo_{nome}_{datetime.now():%Y%m%d_%H%M%S}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        print(f"  Print salvo em {base}.png")
    except Exception:
        pass


def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    driver.execute_script("arguments[0].click();", elemento)


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


def id_do_link(href):
    """'/grupo-equivalencia/visualizar/314' -> '314'"""
    achou = re.search(r"/grupo-equivalencia/visualizar/(\d+)", href or "")
    return achou.group(1) if achou else ""


def grupos_da_lista(driver):
    """Abre a lista e devolve [(id, nome, link)].

    Lista vazia só quando a página carregou de fato; se não carregar, levanta
    PaginaNaoCarregou (internet lenta nunca vira "acabaram os grupos").
    """
    abrir(driver, URL_LISTA)
    try:
        WebDriverWait(driver, ESPERA).until(lambda d:
            d.find_elements(By.CSS_SELECTOR, SELETOR_EDITAR)
            or (d.execute_script("return document.readyState") == "complete"
                and d.find_elements(By.CSS_SELECTOR, "table, .dataTables_empty, .card-body"))
        )
    except TimeoutException:
        raise PaginaNaoCarregou("a lista de grupos não carregou")
    time.sleep(1)

    itens = []
    for link in driver.find_elements(By.CSS_SELECTOR, SELETOR_EDITAR):
        id_grupo = id_do_link(link.get_attribute("href"))
        if not id_grupo:
            continue
        try:
            nome = link.find_element(By.XPATH, "./ancestor::tr[1]").text.split("\n")[0].strip()
        except Exception:
            nome = ""
        itens.append((id_grupo, nome, link))
    with trava:
        CONTADORES["na_lista"] = len(itens)
    return itens


def excluir_grupo(driver, link):
    """Editar > Excluir grupo de equivalência > Excluir (confirmação no modal)."""
    etapa("Abrindo o grupo")
    clicar(driver, link)
    botao_excluir = WebDriverWait(driver, ESPERA).until(EC.presence_of_element_located(
        (By.CSS_SELECTOR, "button[data-bs-target='#grupo-equivalencia-excluir']")
    ))
    time.sleep(1)
    etapa("Clicando em Excluir")
    clicar(driver, botao_excluir)

    # Botão de confirmação dentro do modal
    confirmar = WebDriverWait(driver, ESPERA).until(lambda d: next(
        (b for b in d.find_elements(By.CSS_SELECTOR, "#grupo-equivalencia-excluir button[type='submit']")
         if b.is_displayed()),
        False,
    ))
    url_antes = driver.current_url
    etapa("Confirmando a exclusão")
    clicar(driver, confirmar)

    try:
        WebDriverWait(driver, ESPERA).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("a página não saiu do grupo depois de Excluir (o sistema recusou?)")
    time.sleep(1)


def abrir_sessao():
    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1920,1080")
    opcoes.page_load_strategy = "eager"
    opcoes.add_experimental_option("prefs", {"profile.managed_default_content_settings.images": 2})
    driver = webdriver.Chrome(options=opcoes)
    driver.set_page_load_timeout(ESPERA * 2)
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

        # Confere a clínica antes de excluir qualquer coisa
        try:
            wait.until(lambda d: CLINICA.lower() in d.find_element(By.ID, "clinica-selecionada").text.lower())
        except TimeoutException:
            selecionada = driver.find_element(By.ID, "clinica-selecionada").text
            raise Exception(f"clínica selecionada é '{selecionada}', não '{CLINICA}' — nada foi excluído")
        return driver
    except Exception:
        driver.quit()
        raise


def reservar_proximo(itens):
    """Pega o 1º grupo da lista que ninguém está excluindo e que não falhou. None = nada livre."""
    with trava:
        if LIMITE is not None and CONTADORES["reservados"] >= LIMITE:
            return "LIMITE"
        for id_grupo, nome, link in itens:
            if id_grupo not in EM_ANDAMENTO and id_grupo not in FALHARAM:
                EM_ANDAMENTO.add(id_grupo)
                CONTADORES["reservados"] += 1
                return id_grupo, nome, link
    return None


def liberar(id_grupo, contou=True):
    with trava:
        EM_ANDAMENTO.discard(id_grupo)
        if not contou:
            CONTADORES["reservados"] -= 1


def trabalhar(driver, parar):
    """Loop de um navegador: exclui grupos até a lista acabar."""
    falhas_lista = 0
    nome_navegador = threading.current_thread().name
    while not parar.is_set():
        atualizar(status="trabalhando", grupo="", etapa="Carregando a lista de grupos", desde=time.time())
        try:
            itens = grupos_da_lista(driver)
            falhas_lista = 0
        except PaginaNaoCarregou as e:
            falhas_lista += 1
            if falhas_lista >= MAX_FALHAS_LISTA:
                raise
            registrar_evento(AMARELO, f"⚠ {e} — esperando 15s ({falhas_lista}/{MAX_FALHAS_LISTA})")
            atualizar(status="esperando", etapa="Lista não carregou — nova tentativa em 15s", desde=time.time())
            time.sleep(15)
            continue

        proximo = reservar_proximo(itens)
        if proximo == "LIMITE":
            return
        if proximo is None:
            with trava:
                outros_trabalhando = bool(EM_ANDAMENTO)
            if outros_trabalhando:
                # A 1ª página só tem grupos que outros navegadores estão excluindo — espera liberar
                atualizar(status="esperando", etapa="Outros navegadores ocupam a 1ª página", desde=time.time())
                time.sleep(5)
                continue
            return  # nada mais a excluir

        id_grupo, nome, link = proximo
        print(f"\nExcluindo grupo {id_grupo}: {nome}")
        atualizar(status="trabalhando", grupo=f"{id_grupo} {nome}", desde=time.time())
        try:
            excluir_grupo(driver, link)
            etapa("Conferindo se saiu da lista")
            if any(item[0] == id_grupo for item in grupos_da_lista(driver)):
                raise Exception("o grupo continua na lista depois de excluir")

            with trava:
                CONTADORES["excluidos"] += 1
                total = CONTADORES["excluidos"]
                navegadores[nome_navegador]["feitos"] += 1
            registrar_log(id_grupo, nome, "excluido")
            registrar_evento(VERDE, f"✔ {id_grupo} {nome} (total excluído: {total})")
            liberar(id_grupo)

        except Exception as e:
            with trava:
                TENTATIVAS[id_grupo] = TENTATIVAS.get(id_grupo, 0) + 1
                tentativas = TENTATIVAS[id_grupo]
            print(f"  ERRO: {type(e).__name__}: {e}")
            motivo = resumo_erro(e)
            if tentativas < MAX_TENTATIVAS:
                registrar_evento(AMARELO, f"↻ {id_grupo} {nome} — {motivo} — tentando de novo ({tentativas}/{MAX_TENTATIVAS})")
                atualizar(etapa=f"Erro — nova tentativa em 5s ({tentativas}/{MAX_TENTATIVAS})")
                liberar(id_grupo, contou=False)
                time.sleep(5)
                continue
            with trava:
                FALHARAM.add(id_grupo)
                CONTADORES["erros"] += 1
                erros_execucao.append((id_grupo, nome, motivo))
            registrar_evento(VERMELHO, f"✖ {id_grupo} {nome} — {motivo} — desistindo após {MAX_TENTATIVAS} tentativas")
            atualizar(etapa="Erro — salvando print")
            salvar_print_erro(driver, id_grupo)
            registrar_log(id_grupo, nome, "erro", str(e))
            liberar(id_grupo)


def navegador(parar, atraso):
    """Um navegador: abre sessão e trabalha; se a sessão cair, reabre em 10s."""
    try:
        _navegador(parar, atraso)
    finally:
        atualizar(status="finalizado", grupo="", etapa="", desde=time.time())


def _navegador(parar, atraso):
    inicio_login = datetime.now() + timedelta(seconds=atraso)
    atualizar(status="aguardando", etapa=f"login às {inicio_login:%H:%M:%S}")
    if parar.wait(atraso):  # escalona os logins
        return
    while not parar.is_set():
        driver = None
        try:
            atualizar(status="logando", grupo="", etapa="Login e seleção da clínica", desde=time.time())
            driver = abrir_sessao()
            print("Sessão aberta.")
            trabalhar(driver, parar)
            return
        except Exception as e:
            print(f"\nERRO na sessão: {type(e).__name__}: {e}")
            if driver:
                salvar_print_erro(driver, f"sessao_{threading.current_thread().name}")
            if "nada foi excluído" in str(e):
                registrar_evento(VERMELHO, f"✖ {e} — parando todos os navegadores")
                parar.set()  # clínica errada: para todos os navegadores
                return
            registrar_evento(AMARELO, f"⚠ Sessão caiu ({resumo_erro(e)}) — reabrindo em 10s")
            atualizar(status="caiu", etapa="Reabrindo em 10s", desde=time.time())
            print("Reabrindo o navegador em 10 segundos...")
            parar.wait(10)
        finally:
            if driver:
                try:
                    driver.quit()
                except Exception:
                    pass


def executar():
    global painel_ativo, log_arquivo

    inicio = time.time()
    parar = threading.Event()
    parar_painel = threading.Event()

    if GERAR_LOG:
        os.makedirs(PASTA_LOGS, exist_ok=True)
        log_arquivo = open(os.path.join(PASTA_LOGS, f"excluir_grupos_{datetime.now():%Y%m%d_%H%M%S}.log"),
                           "w", encoding="utf-8")
    print(f"Excluindo grupos de equivalência da clínica '{CLINICA}' com {NUM_NAVEGADORES} navegador(es)."
          + (f" Limite: {LIMITE}." if LIMITE else ""))

    for i in range(NUM_NAVEGADORES):
        navegadores[f"N{i + 1}"] = {"status": "aguardando", "grupo": "", "etapa": "",
                                    "desde": time.time(), "feitos": 0}

    # Painel só faz sentido num terminal de verdade (não em saída redirecionada para arquivo)
    painel_ativo = PAINEL and sys.stdout.isatty()
    thread_painel = None
    if painel_ativo:
        thread_painel = threading.Thread(target=desenhar_painel, args=(inicio, parar, parar_painel), daemon=True)
        thread_painel.start()

    threads = [
        threading.Thread(target=navegador, args=(parar, i * INTERVALO_ENTRE_LOGINS), name=f"N{i + 1}", daemon=True)
        for i in range(NUM_NAVEGADORES)
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
        imprimir_resumo(inicio)
        if log_arquivo:
            log_arquivo.close()
            log_arquivo = None


def imprimir_resumo(inicio):
    """Resumo final no terminal (fica visível depois que o painel fecha)."""
    print(f"\n{NEGRITO}Resumo da execução{FIM}")
    print(f"  {VERDE}✔ excluídos: {CONTADORES['excluidos']}{FIM}    "
          f"{VERMELHO if CONTADORES['erros'] else ''}✖ erros: {CONTADORES['erros']}{FIM}    "
          f"tempo: {formatar_duracao(time.time() - inicio)}")
    if erros_execucao:
        print(f"\n  Grupos com erro" + (f" (prints em {PASTA_ERROS}):" if SALVAR_PRINTS_ERRO else ":"))
        for id_grupo, nome_grupo, motivo in erros_execucao[:30]:
            print(f"   - {id_grupo} {nome_grupo}: {motivo}")
        if len(erros_execucao) > 30:
            print(f"   ... e mais {len(erros_execucao) - 30}" + (" (ver log)" if log_arquivo else ""))
    print(f"\n  Histórico de exclusões: {ARQUIVO_LOG}")
    if log_arquivo:
        print(f"  Log completo: {log_arquivo.name}")


if __name__ == "__main__":
    print(f"ATENÇÃO: este script EXCLUI os grupos de equivalência da clínica '{CLINICA}'.")
    print("A exclusão não pode ser desfeita." + (f" Limite desta execução: {LIMITE}." if LIMITE else " Vai excluir TODOS."))
    if input("Digite EXCLUIR para continuar: ").strip() != "EXCLUIR":
        print("Cancelado.")
        raise SystemExit
    executar()
