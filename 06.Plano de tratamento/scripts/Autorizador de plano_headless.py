import builtins
import csv
import re
import shutil
import sys
import threading
import time
import traceback
import unicodedata
from pathlib import Path
from collections import deque
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait, Select
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


PASTA = Path(__file__).resolve().parent.parent / "dados"  # erros, logs e o CSV de autorizações
PASTA_ERROS = PASTA / "erros"
PASTA_LOGS = PASTA / "logs"
ARQUIVO_LOG = PASTA / "autorizacoes_log.csv"
CLINICA = "BRASILIA - GRUPO MANDIC"
URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_LISTA = f"{URL_BASE}/plano-tratamento/solicitacao-autorizacao/lista"
SELETOR_AUTORIZAR = "a[title='Autorizar'][href*='/plano-tratamento/negociacao/']"

# Só autoriza os planos solicitados por esta pessoa (filtro "Solicitante" da lista)
SOLICITANTE = "Davi Pegoraro"

DESCONTO_PERCENTUAL = 100
SENHA_DESCONTO = "20261011"

# Quantos planos autorizar nesta execução (None = todos). Use 1 para testar.
LIMITE_PLANOS = None

# True = roda sem abrir a janela do Chrome
HEADLESS = True

# True = painel atualizado no terminal; o log detalhado vai para PASTA_LOGS.
# False = log corrido no terminal, como antes.
PAINEL = True
# True = salva print (.png) e HTML da tela quando dá erro, em PASTA_ERROS
SALVAR_PRINTS_ERRO = True
# True = grava o log detalhado da execução em PASTA_LOGS
GERAR_LOG = False

# Planos já tentados nesta execução (sucesso ou erro). Fica fora de executar()
# para sobreviver ao reinício automático e não ficar preso num plano com erro.
TENTADOS = set()

# ── Estado mostrado no painel ──────────────────────────────────────────────────
trava = threading.Lock()
progresso = {
    "autorizados": 0, "erros": 0, "sem_desconto": 0, "na_lista": None,
    "reinicios": 0, "inicio": time.time(), "tempo_planos": 0.0,
}
atual = {"status": "aguardando", "plano": "", "etapa": "", "desde": time.time()}
eventos = deque(maxlen=12)      # (hora, cor, texto)
erros_execucao = []             # (id do plano, motivo)

painel_ativo = False
log_arquivo = None


def print(*args, sep=" ", end="\n", **kwargs):
    """Tudo vai para o arquivo de log; no terminal só aparece quando o painel está desligado."""
    mensagem = sep.join(str(a) for a in args)
    with trava:
        if log_arquivo:
            hora = f"{datetime.now():%H:%M:%S}"
            for linha in mensagem.split("\n"):
                if linha:
                    log_arquivo.write(f"{hora} {re.sub(r'\033\[[0-9;?]*[A-Za-z]', '', linha)}\n")
            log_arquivo.flush()
    if not painel_ativo:
        builtins.print(mensagem, end=end, **kwargs)


def atualizar(**campos):
    """Atualiza a linha do plano atual no painel."""
    with trava:
        atual.update(campos)


def etapa(texto):
    """Registra no log e mostra no painel o passo em que o robô está."""
    print(f"  {texto}")
    atualizar(etapa=texto)


def registrar_evento(cor, texto):
    """Linha que aparece em 'Últimos eventos' no painel (e no log)."""
    print(f"  {texto}")
    with trava:
        eventos.append((f"{datetime.now():%H:%M:%S}", cor, texto))


def resumo_erro(e):
    """'TimeoutException' ou 'Exception: mensagem...' — uma linha só."""
    detalhe = re.sub(r"^Message:\s*(None)?", "", str(e).strip().split("\n")[0]).strip()[:70]
    return f"{type(e).__name__}{': ' + detalhe if detalhe else ''}"


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
    """Salva print da tela e HTML da página em erros/<nome>_<hora>.png/.html."""
    if not SALVAR_PRINTS_ERRO:
        return
    try:
        PASTA_ERROS.mkdir(exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)[:60]
        base = PASTA_ERROS / f"{nome}_{datetime.now():%Y%m%d_%H%M%S}"
        driver.save_screenshot(f"{base}.png")
        with open(f"{base}.html", "w", encoding="utf-8") as f:
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
    "buscando": (AZUL, "◐"),
    "aguardando": (CINZA, "○"),
    "caiu": (VERMELHO, "✖"),
    "finalizado": (CINZA, "✔"),
}


def montar_linha(largura, *partes):
    """Junta pedaços (texto, cor) cortando no limite visível do terminal."""
    saida, usado = "", 0
    for texto_parte, cor in partes:
        texto_parte = texto_parte[:max(0, largura - usado)]
        usado += len(texto_parte)
        saida += f"{cor}{texto_parte}{FIM}" if cor else texto_parte
    return saida


def montar_painel(parar):
    largura, altura = shutil.get_terminal_size((110, 40))
    largura -= 1
    agora = time.time()

    with trava:
        p = dict(progresso)
        info = dict(atual)
        ultimos = list(eventos)
        ultimos_erros = erros_execucao[-5:]

    feitos = p["autorizados"] + p["erros"]
    decorrido = agora - p["inicio"]
    na_lista = p["na_lista"]
    # Previsão pelo tempo médio de cada plano (sem contar login e reinícios)
    if feitos and na_lista is not None:
        media = p["tempo_planos"] / feitos
        restante = media * na_lista
        termino = datetime.now() + timedelta(seconds=restante)
        previsao = (f"média {media:.1f}s/plano   restante {formatar_duracao(restante)}"
                    f"   término {termino:%d/%m %H:%M}")
    else:
        previsao = "calculando previsão..."

    total = feitos + (na_lista or 0)
    if LIMITE_PLANOS is not None:
        total = min(total, LIMITE_PLANOS)
    tamanho_barra = max(10, min(50, largura - 40))
    fracao = min(1, feitos / total) if total else 0
    cheio = int(tamanho_barra * fracao)

    tela = [
        montar_linha(largura, (" Autorização de planos de tratamento ", NEGRITO), (f"· {CLINICA}", ""),
                     (f"   {datetime.now():%d/%m %H:%M:%S}", CINZA)),
        montar_linha(largura, (f" Solicitante: {SOLICITANTE}   desconto {DESCONTO_PERCENTUAL}%"
                               + (f"   limite {LIMITE_PLANOS} plano(s)" if LIMITE_PLANOS is not None else ""), CINZA)),
        montar_linha(largura, (" " + "─" * (largura - 2), CINZA)),
        montar_linha(largura, (" Progresso  ", ""), ("█" * cheio, VERDE), ("░" * (tamanho_barra - cheio), CINZA),
                     (f"  {feitos}/{total if na_lista is not None else '?'} planos  {100 * fracao:.1f}%", NEGRITO)),
        montar_linha(largura, ("            ✔ autorizados ", ""), (str(p["autorizados"]), VERDE),
                     ("   ✖ com erro ", ""), (str(p["erros"]), VERMELHO if p["erros"] else ""),
                     ("   ⚠ sem desconto ", ""), (str(p["sem_desconto"]), AMARELO if p["sem_desconto"] else ""),
                     ("   ↻ reinícios ", ""), (str(p["reinicios"]), AMARELO if p["reinicios"] else ""),
                     (f"   decorrido {formatar_duracao(decorrido)}", "")),
        montar_linha(largura, ("            " + previsao, CINZA)),
    ]
    if parar.is_set():
        tela.append(montar_linha(largura, (" ⏸ Parando: termina o plano atual e fecha "
                                           "(Ctrl+C de novo sai na hora)", AMARELO)))

    cor, icone = ESTILO_STATUS.get(info["status"], ("", "·"))
    segundos = int(agora - info["desde"])
    tela += [
        "",
        montar_linha(largura, (" Agora", NEGRITO)),
        montar_linha(largura, (f"  {icone} {info['status']:<11}", cor), (f" {info['plano'][:largura - 16]}", "")),
        montar_linha(largura, (f"    {info['etapa']}", ""),
                     (f"  {segundos}s" if info["status"] in ("trabalhando", "logando", "buscando") else "", CINZA)),
    ]

    if ultimos_erros:
        tela += ["", montar_linha(largura, (f" Planos com erro ({p['erros']} no total" +
                                            (f" — prints em {PASTA_ERROS.name}/)" if SALVAR_PRINTS_ERRO else ")"), NEGRITO))]
        for id_plano, motivo in ultimos_erros:
            tela.append(montar_linha(largura, (f"  ✖ {id_plano}  ", VERMELHO), (motivo, "")))

    tela += ["", montar_linha(largura, (" Últimos eventos", NEGRITO))]
    espaco = max(1, altura - len(tela) - 2)
    for hora, cor_evento, texto_evento in ultimos[-espaco:]:
        tela.append(montar_linha(largura, (f"  {hora} ", CINZA), (texto_evento, cor_evento)))

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

def filtrar_por_solicitante(driver):
    """Filtrar > Solicitante = SOLICITANTE (1ª opção do autocomplete) > Visualizar.

    Se o filtro não for confirmado, levanta erro — sem ele, autorizaria planos de todo mundo.
    """
    clicar(driver, visivel(driver, "#btn-drawer-filtroform-pesquisa-autorizacao-plano"))
    time.sleep(1)

    campo = visivel(driver, "#pessoaSolicitante")
    for _ in range(3):
        campo.click()
        driver.execute_script("arguments[0].select();", campo)
        campo.send_keys(Keys.BACKSPACE)
        campo.send_keys(SOLICITANTE)
        try:
            opcao = visivel(driver, "ul.ui-autocomplete li.ui-menu-item", timeout=8)
        except TimeoutException:
            continue
        clicar(driver, opcao)
        time.sleep(0.5)
        if normalizar(SOLICITANTE) in normalizar(campo.get_attribute("value")):
            break
    else:
        raise Exception(f"não foi possível selecionar o solicitante '{SOLICITANTE}' no filtro "
                        f"(campo ficou '{campo.get_attribute('value')}')")
    print(f"  Filtro: solicitante = {campo.get_attribute('value')}")

    links_antes = driver.find_elements(By.CSS_SELECTOR, SELETOR_AUTORIZAR)
    clicar(driver, botao_submit(driver, "Visualizar", perto_de=campo))

    # Espera a lista recarregar com o filtro (os links antigos saem da página)
    if links_antes:
        try:
            WebDriverWait(driver, 15).until(EC.staleness_of(links_antes[0]))
        except TimeoutException:
            raise Exception("a lista não recarregou depois de aplicar o filtro")
    time.sleep(1.5)


def proximo_plano(driver):
    """Abre a lista de solicitações, filtra pelo solicitante e devolve (id, url, descrição)
    do 1º plano ainda não tentado."""
    etapa("Abrindo a lista e filtrando pelo solicitante")
    driver.get(URL_LISTA)
    time.sleep(1)
    filtrar_por_solicitante(driver)

    seletor = SELETOR_AUTORIZAR
    try:
        WebDriverWait(driver, 15).until(EC.presence_of_element_located((By.CSS_SELECTOR, seletor)))
    except TimeoutException:
        with trava:
            progresso["na_lista"] = 0
        return None
    time.sleep(1)

    links = driver.find_elements(By.CSS_SELECTOR, seletor)
    pendentes = [l for l in links if l.get_attribute("href").rstrip("/").split("/")[-1] not in TENTADOS]
    with trava:
        progresso["na_lista"] = len(pendentes)
    print(f"  {len(pendentes)} plano(s) pendente(s) na lista")

    for link in pendentes:
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
    """Adicionar desconto/acréscimo > marcar todos > % > 100 > Aplicar > senha > Salvar.

    Nem todo plano tem a opção de desconto; se ela não aparecer, pula esta etapa.
    """
    try:
        botao_desconto = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "a.adicionar-desconto-acrescimo"))
        )
    except TimeoutException:
        registrar_evento(AMARELO, "⚠ Sem opção de desconto neste plano — seguindo sem desconto")
        with trava:
            progresso["sem_desconto"] += 1
        return
    etapa(f"Aplicando desconto de {DESCONTO_PERCENTUAL}%")
    clicar(driver, botao_desconto)
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

    campo_valor = visivel(driver, "input.rp-valor")
    preencher_valor(driver, campo_valor, DESCONTO_PERCENTUAL)

    clicar(driver, visivel(driver, "a.aplicar-desconto-acrescimo"))
    time.sleep(1)

    # A senha nem sempre é pedida: pode aparecer depois de Aplicar, depois de Salvar ou nunca
    if not preencher_senha_se_pedida(driver):
        clicar(driver, botao_salvar_modal(driver, campo_valor))
        confirmar_alerta_se_houver(driver)
        preencher_senha_se_pedida(driver)

    esperar_sumir(driver, campo_valor, "o desconto não foi salvo (senha ou validação?)")
    time.sleep(1.5)


def preencher_senha_se_pedida(driver, timeout=3):
    """Se o campo de senha do desconto aparecer, preenche e salva. Devolve True se fez isso."""
    try:
        campo_senha = visivel(driver, "#senha-desc-acresc", timeout=timeout)
    except TimeoutException:
        return False
    etapa("Preenchendo a senha do desconto")
    campo_senha.clear()
    campo_senha.send_keys(SENHA_DESCONTO)
    clicar(driver, botao_submit(driver, "Salvar", perto_de=campo_senha))
    confirmar_alerta_se_houver(driver)
    esperar_sumir(driver, campo_senha, "a senha do desconto não foi aceita")
    return True


def botao_salvar_modal(driver, dentro_de, timeout=10):
    """Botão/link visível 'Salvar' no mesmo modal do elemento `dentro_de`."""
    modais = dentro_de.find_elements(By.XPATH, "./ancestor::*[contains(concat(' ', @class, ' '), ' modal ')][1]")
    modal = modais[0] if modais else driver
    try:
        return WebDriverWait(driver, timeout).until(lambda d: next(
            (b for b in modal.find_elements(By.CSS_SELECTOR, "button, a")
             if b.is_displayed() and normalizar(b.text) == "salvar"),
            False,
        ))
    except TimeoutException:
        raise Exception("botão 'Salvar' do desconto não encontrado")


def limpar_condicoes_pagamento(driver, wait):
    """Definir condições de pagamento > Excluir parcelas > Salvar."""
    etapa("Limpando as condições de pagamento")
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
    etapa("Concluindo")
    url_antes = driver.current_url
    clicar(driver, botao_submit(driver, "Concluir"))
    confirmar_alerta_se_houver(driver)

    try:
        WebDriverWait(driver, 30).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("o plano não foi concluído (a página não saiu da negociação)")
    time.sleep(1)


def autorizar_plano(driver, wait, url):
    etapa("Abrindo a negociação")
    driver.get(url)
    time.sleep(2)

    aplicar_desconto(driver, wait)
    limpar_condicoes_pagamento(driver, wait)
    concluir(driver, wait)


def executar(parar):
    atualizar(status="logando", plano="", etapa="Abrindo o Chrome, login e seleção da clínica", desde=time.time())
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

        registrar_evento(AZUL, "Sessão aberta")

        # ── Loop principal: sempre o 1º plano da lista ainda não tentado ──────
        while not parar.is_set():
            with trava:
                feitos = progresso["autorizados"] + progresso["erros"]
            if LIMITE_PLANOS is not None and feitos >= LIMITE_PLANOS:
                registrar_evento(CINZA, f"Limite de {LIMITE_PLANOS} plano(s) atingido")
                break

            atualizar(status="buscando", plano="", desde=time.time())
            proximo = proximo_plano(driver)
            if proximo is None:
                registrar_evento(CINZA, "Nenhum plano pendente na lista")
                break

            id_plano, url, descricao = proximo
            TENTADOS.add(id_plano)
            print(f"\n[{feitos + 1}] {'─' * 60}")
            print(f"  Plano {id_plano}: {descricao}")
            atualizar(status="trabalhando", plano=f"{id_plano} · {descricao}", desde=time.time())

            inicio_plano = time.time()
            try:
                autorizar_plano(driver, wait, url)
                duracao = time.time() - inicio_plano
                with trava:
                    progresso["autorizados"] += 1
                    progresso["tempo_planos"] += duracao
                    if progresso["na_lista"]:
                        progresso["na_lista"] -= 1
                registrar_log(id_plano, descricao, "autorizado")
                registrar_evento(VERDE, f"✔ Plano {id_plano} autorizado em {duracao:.1f}s")

            except Exception as e:
                with trava:
                    progresso["erros"] += 1
                    progresso["tempo_planos"] += time.time() - inicio_plano
                    if progresso["na_lista"]:
                        progresso["na_lista"] -= 1
                    erros_execucao.append((id_plano, resumo_erro(e)))
                print(f"  ERRO no plano {id_plano}: {type(e).__name__}: {e}")
                registrar_evento(VERMELHO, f"✖ Plano {id_plano}: {resumo_erro(e)}")
                salvar_print_erro(driver, f"autorizacao_{id_plano}")
                registrar_log(id_plano, descricao, "erro", str(e))

    except Exception:
        # Salva o estado da tela para diagnosticar onde travou
        try:
            print(f"\nURL no momento do erro: {driver.current_url}")
        except Exception:
            pass
        salvar_print_erro(driver, "sessao")
        raise

    finally:
        driver.quit()


def rodar(parar):
    """Chama executar() e reinicia do zero em caso de qualquer erro."""
    try:
        while not parar.is_set():
            try:
                executar(parar)
                break
            except Exception as e:
                print(f"\nERRO na sessão: {type(e).__name__}: {e}")
                print("".join(traceback.format_exc(limit=3)))
                with trava:
                    progresso["reinicios"] += 1
                registrar_evento(AMARELO, f"⚠ Sessão caiu ({resumo_erro(e)}) — reiniciando em 10s")
                atualizar(status="caiu", etapa="Reiniciando em 10s", desde=time.time())
                parar.wait(10)
    finally:
        atualizar(status="finalizado", plano="", etapa="", desde=time.time())


def imprimir_resumo():
    """Resumo final no terminal (fica visível depois que o painel fecha)."""
    print(f"\n{NEGRITO}Resumo da execução{FIM}")
    print(f"  {VERDE}✔ autorizados: {progresso['autorizados']}{FIM}    "
          f"{VERMELHO if progresso['erros'] else ''}✖ com erro: {progresso['erros']}{FIM}    "
          f"{AMARELO if progresso['sem_desconto'] else ''}⚠ sem desconto: {progresso['sem_desconto']}{FIM}    "
          f"↻ reinícios: {progresso['reinicios']}    "
          f"tempo: {formatar_duracao(time.time() - progresso['inicio'])}")
    if erros_execucao:
        print("\n  Planos com erro" + (f" (prints em {PASTA_ERROS}):" if SALVAR_PRINTS_ERRO else ":"))
        for id_plano, motivo in erros_execucao[:30]:
            print(f"   - {id_plano}: {motivo}")
        if len(erros_execucao) > 30:
            print(f"   ... e mais {len(erros_execucao) - 30} (ver {ARQUIVO_LOG.name})")
    print(f"\n  Histórico de autorizações: {ARQUIVO_LOG}")
    if log_arquivo:
        print(f"  Log completo: {log_arquivo.name}")


def main():
    global painel_ativo, log_arquivo

    progresso["inicio"] = time.time()
    if GERAR_LOG:
        PASTA_LOGS.mkdir(exist_ok=True)
        log_arquivo = open(PASTA_LOGS / f"autorizacoes_{datetime.now():%Y%m%d_%H%M%S}.log", "w", encoding="utf-8")
    print(f"Autorizando planos de {SOLICITANTE} em {CLINICA}"
          + (f" (limite {LIMITE_PLANOS})" if LIMITE_PLANOS is not None else ""))

    parar = threading.Event()
    parar_painel = threading.Event()
    # Painel só faz sentido num terminal de verdade (não em saída redirecionada para arquivo)
    painel_ativo = PAINEL and sys.stdout.isatty()
    thread_painel = None
    if painel_ativo:
        thread_painel = threading.Thread(target=desenhar_painel, args=(parar, parar_painel), daemon=True)
        thread_painel.start()

    robo = threading.Thread(target=rodar, args=(parar,), daemon=True)
    robo.start()
    try:
        while robo.is_alive():
            robo.join(1)
    except KeyboardInterrupt:
        print("\nInterrompido: termina o plano atual e fecha (Ctrl+C de novo para sair na hora).")
        parar.set()
        robo.join()
    finally:
        parar_painel.set()
        if thread_painel:
            thread_painel.join(timeout=3)
        painel_ativo = False
        imprimir_resumo()
        if log_arquivo:
            log_arquivo.close()
            log_arquivo = None


if __name__ == "__main__":
    main()
