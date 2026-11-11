"""
Robô que cadastra agendamentos na agenda do Clínica nas Nuvens.

Dois fluxos (campo "fluxo" de cada tipo em TIPOS):
- "agenda": /agenda/index → Adicionar → Agendamento → tipo de atendimento → paciente →
  profissional → convênio (GRUPO MANDIC, se vier vazio) → procedimento → data → horário
  inicial e final → observação → Agendar.
- "turma": /agenda/index → pesquisa por Turma → acha a reserva da turma no dia que cobre o
  horário → Adicionar agendamento na reserva → tipo → tira a cadeira → aluno (opcional) →
  paciente → convênio → procedimento → horários → observação (+ a do OdontoSig) → Agendar.

Cada tipo do OdontoSig agenda de um jeito: o que muda entre eles fica em TIPOS. Não grava
nada no banco: quem chama (agendamentos.py) recebe o resultado de cada linha e grava.
"""
import re
import threading
import time
import unicodedata
from datetime import datetime, timedelta

from selenium import webdriver
from selenium.common.exceptions import TimeoutException, WebDriverException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_AGENDA = URL_BASE + "/agenda/index"

# Como agendar cada Tipo do OdontoSig (chave = Tipo normalizado: sem acento, minúsculas)
TIPOS = {
    "triagem": {
        "nome": "Triagem geral",
        "fluxo": "agenda",
        "tipo_atendimento": "Triagem Geral - 10 minutos",
        "procedimento": "Atendimento Triagem",
        "duracao_min": 15,
    },
    "triagem direcionada": {
        "nome": "Triagem direcionada",
        "fluxo": "turma",
        "tipo_atendimento": "Triagem direcionada - 30 min",
        "procedimento": "triagem direcionada",   # digita e pega a 1ª opção
        "procedimento_primeira_opcao": True,
        "duracao_min": 15,
        "observacao_odontosig": True,           # acrescenta as Observações do sistema antigo
    },
    # procedimento None = agenda sem procedimento
    "tratamento": {
        "nome": "Tratamento",
        "fluxo": "turma",
        "tipo_atendimento": "Tratamento - 1h",
        "procedimento": None,
        "duracao_min": 15,
        "observacao_odontosig": True,
    },
    "centro cirurgico": {
        "nome": "Centro cirúrgico",
        "fluxo": "turma",
        "tipo_atendimento": "Centro Cirúrgico - 4h",
        "procedimento": None,
        "duracao_min": 15,
        "observacao_odontosig": True,
    },
    "clinica apoio": {
        "nome": "Clínica de apoio",
        "fluxo": "agenda",
        "tipo_atendimento": "Clinica de Apoio - 15 min",
        "procedimento": None,
        "duracao_min": 15,
    },
}

# Unidade do OdontoSig → clínica no Clínica nas Nuvens (busca no seletor de clínicas do topo)
CLINICAS = {
    "Campinas - SP": "CAMPINAS - GRUPO MANDIC",
    "São Paulo - SP": "SÃO PAULO - GRUPO MANDIC",
    "Curitiba - PR": "CURITIBA - GRUPO MANDIC",
    "Fortaleza - CE": "FORTALEZA - GRUPO MANDIC",
    "Rio de Janeiro - RJ": "RIO DE JANEIRO - GRUPO MANDIC",
    "Belo Horizonte - MG": "BELO HORIZONTE - GRUPO MANDIC",
    "Brasília - DF": "BRASILIA - GRUPO MANDIC",
    "Grande Vitória - ES": "VITORIA - GRUPO MANDIC",
    "Porto Alegre - RS": "PORTO ALEGRE - GRUPO MANDIC",
    "Araras - SP": "ARARAS - GRUPO MANDIC",
}

CONVENIO = "GRUPO MANDIC"
OBSERVACAO = "Atendimento Migrado: Confira os detalhes antes de seguir."
LIMITE_OBSERVACAO = 1000  # maxlength do campo no Clínica nas Nuvens

PARAR = threading.Event()
log = print             # o app troca pelo log da tela
PASTA_ERROS = None      # o app aponta para dados/erros; None = não salva print de erro


class ErroLogin(Exception):
    """Usuário ou senha recusados: não adianta tentar de novo."""


class ErroAgendamento(Exception):
    """Falha só deste agendamento (o lote segue). `status` vai para a coluna Status integração."""

    def __init__(self, mensagem, status="erro"):
        super().__init__(mensagem)
        self.status = status


def normalizar(texto):
    texto = unicodedata.normalize("NFKD", str(texto or ""))
    texto = "".join(c for c in texto if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", texto).strip().lower()


def chave_tipo(tipo):
    return normalizar(tipo)


def resumo_erro(e):
    mensagem = str(getattr(e, "msg", None) or e).strip().split("\n")[0]
    if type(e) is Exception and mensagem:
        return mensagem  # erro nosso, a mensagem já explica
    return f"{type(e).__name__}: {mensagem}" if mensagem else type(e).__name__


def sessao_caiu(e):
    """Chrome fechado / sessão perdida: precisa abrir o navegador de novo."""
    return isinstance(e, WebDriverException) and any(
        t in str(e).lower() for t in ("invalid session", "no such window", "disconnected", "target window already closed",
                                      "chrome not reachable", "session deleted"))


# ── Navegador ─────────────────────────────────────────────────────────────────
def criar_driver(headless):
    opcoes = webdriver.ChromeOptions()
    if headless:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1600,1000")
    return webdriver.Chrome(options=opcoes)


def visiveis(driver, seletor, raiz=None):
    return [e for e in (raiz or driver).find_elements(By.CSS_SELECTOR, seletor) if e.is_displayed()]


def visivel(driver, seletor, timeout=15):
    return WebDriverWait(driver, timeout).until(lambda d: next(iter(visiveis(d, seletor)), False))


def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    try:
        elemento.click()
    except Exception:
        driver.execute_script("arguments[0].click();", elemento)


def clicar_mouse(driver, elemento):
    """Clique 'real' (mousedown/mouseup/click) — o autocomplete do jQuery UI precisa dele."""
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    ActionChains(driver).move_to_element(elemento).pause(0.2).click(elemento).perform()


def valor(campo):
    return (campo.get_attribute("value") or "").strip()


def salvar_evidencia(driver, nome):
    """Print + HTML da tela no momento do erro, em PASTA_ERROS."""
    if not PASTA_ERROS:
        return
    try:
        PASTA_ERROS.mkdir(parents=True, exist_ok=True)
        nome_arquivo = re.sub(r"\W+", "_", nome)[:40]
        base = PASTA_ERROS / f"{datetime.now():%Y%m%d_%H%M%S}_agenda_{nome_arquivo}"
        driver.save_screenshot(f"{base}.png")
        base.with_suffix(".html").write_text(driver.page_source, encoding="utf-8")
        log(f"  Print da tela salvo em dados/erros/{base.name}.png")
    except Exception:
        pass


def mensagens_na_tela(driver):
    """Avisos e erros visíveis (validação do formulário, toasts, SweetAlert)."""
    return driver.execute_script("""
        return [...document.querySelectorAll('.swal2-html-container, .swal2-title, .invalid-feedback, .toast-message,'
                + ' .alert-danger, .alert-warning, .help-block.error, label.error')]
            .filter(e => e.offsetParent !== null).map(e => e.innerText.trim()).filter(Boolean)
            .filter((t, i, a) => a.indexOf(t) === i).join(' | ');
    """) or ""


# ── Login e clínica ───────────────────────────────────────────────────────────
def campo_senha_visivel(driver):
    return next((e for e in driver.find_elements(By.CSS_SELECTOR, "input[type='password']")
                 if e.is_displayed() and e.is_enabled()), False)


def fazer_login(driver, usuario, senha):
    """Mesmo login do robô de planos: usuário → (senha na mesma tela ou em outra) → Entrar."""
    log("Abrindo o Clínica nas Nuvens...")
    driver.get(URL_BASE + "/")
    campo_email = WebDriverWait(driver, 30).until(lambda d: next(iter(
        visiveis(d, "input[type='email'], input[name='username'], input[name='email']")
        or [e for e in d.find_elements(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[1]/input")
            if e.is_displayed()]), False))
    campo_email.clear()
    campo_email.send_keys(usuario)
    abas_antes = set(driver.window_handles)
    botao = next((b for b in campo_email.find_elements(By.XPATH, "./ancestor::form[1]//button") if b.is_displayed()), None)
    if botao is not None:
        clicar(driver, botao)
    else:
        campo_email.send_keys(Keys.ENTER)

    def senha_apareceu(d):
        novas = set(d.window_handles) - abas_antes
        if novas:
            d.switch_to.window(novas.pop())
        return campo_senha_visivel(d)

    try:
        campo_senha = WebDriverWait(driver, 30).until(senha_apareceu)
    except TimeoutException:
        raise ErroLogin(f"o sistema não pediu a senha depois do usuário '{usuario}' (usuário inválido?)") from None
    campo_senha.click()
    campo_senha.clear()
    campo_senha.send_keys(senha)
    botao = next((b for b in driver.find_elements(By.ID, "next") if b.is_displayed()), None) or next((
        b for b in campo_senha.find_elements(By.XPATH, "./ancestor::form[1]//button[@type='submit' or not(@type)]")
        if b.is_displayed()), None)
    if botao is not None:
        clicar(driver, botao)
    else:
        campo_senha.send_keys(Keys.ENTER)
    try:
        WebDriverWait(driver, 30).until(lambda d: not campo_senha_visivel(d))
    except TimeoutException:
        raise ErroLogin("usuário ou senha incorretos (o login não passou da tela de senha)") from None
    time.sleep(3)
    for popup in driver.find_elements(By.XPATH, "//button[text()='X']"):
        if popup.is_displayed():
            driver.execute_script("arguments[0].click();", popup)
            break
    log("Login aceito.")


def selecionar_clinica(driver, clinica):
    """Topo > clínica selecionada > busca > escolhe a opção e confere a troca.
    Prefere o nome exato; com mais de uma opção parecida, falha em vez de chutar."""
    alvo = normalizar(clinica)
    botao = WebDriverWait(driver, 20).until(EC.presence_of_element_located((By.ID, "clinica-selecionada")))
    if alvo in normalizar(botao.get_attribute("textContent")):
        log(f"Clínica '{clinica}' já está selecionada.")
        return
    ActionChains(driver).move_to_element(botao).click(botao).perform()
    busca = WebDriverWait(driver, 15).until(EC.element_to_be_clickable(
        (By.XPATH, "//input[@placeholder='Pesquisar clínica']")))
    busca.click()
    busca.clear()
    busca.send_keys(clinica)
    time.sleep(2)

    def compativeis(d):
        opcoes = [(normalizar((o.get_attribute("textContent") or "").strip().split("\n")[0]), o)
                  for o in d.find_elements(By.CSS_SELECTOR, "a.trocar-clinica")]
        return [(t, o) for t, o in opcoes if alvo in t] or False

    try:
        opcoes = WebDriverWait(driver, 15).until(compativeis)
    except TimeoutException:
        raise Exception(f"clínica '{clinica}' não encontrada na lista de clínicas do Clínica nas Nuvens") from None
    exatas = [o for t, o in opcoes if t == alvo]
    if not exatas and len(opcoes) > 1:
        raise Exception(f"mais de uma clínica corresponde a '{clinica}': {[t for t, _ in opcoes][:5]}")
    driver.execute_script("arguments[0].click();", (exatas or [opcoes[0][1]])[0])
    time.sleep(5)
    driver.get(URL_AGENDA)
    try:
        WebDriverWait(driver, 20).until(lambda d: alvo in normalizar(
            d.find_element(By.ID, "clinica-selecionada").get_attribute("textContent")))
    except TimeoutException:
        raise Exception(f"a clínica não foi trocada para '{clinica}'") from None
    log(f"Clínica selecionada: {clinica}")


# ── Campos do formulário ──────────────────────────────────────────────────────
def abrir_formulario(driver):
    """/agenda/index → Adicionar → Agendamento → espera o formulário (tipo de atendimento)."""
    driver.get(URL_AGENDA)
    botao = WebDriverWait(driver, 30).until(EC.element_to_be_clickable((By.ID, "btn-add-novo")))
    time.sleep(1)
    for tentativa in range(3):
        clicar(driver, botao)
        try:
            item = WebDriverWait(driver, 5).until(lambda d: next((
                t for t in d.find_elements(By.CSS_SELECTOR, "span.menu-title")
                if t.is_displayed() and normalizar(t.text) == "agendamento"), False))
            break
        except TimeoutException:
            continue
    else:
        raise Exception("o menu do botão 'Adicionar' não mostrou a opção 'Agendamento'")
    link = next(iter(item.find_elements(By.XPATH, "./ancestor::*[self::a or contains(@class,'menu-link')][1]")), item)
    clicar(driver, link)
    try:
        visivel(driver, "#tipoConsulta", timeout=20)
    except TimeoutException:
        raise Exception("o formulário de agendamento não abriu (campo 'Tipo de atendimento' não apareceu)") from None
    time.sleep(1)


def selecionar_tipo(driver, nome):
    """Escolhe a opção do select #tipoConsulta pelo texto (sem a sensibilidade a acento/caixa)."""
    opcoes = driver.execute_script("""
        return [...document.querySelectorAll('#tipoConsulta option')].map(o => [o.value, o.textContent.trim()]);
    """)
    alvo = normalizar(nome)
    escolhida = next((o for o in opcoes if normalizar(o[1]) == alvo), None)
    if not escolhida:
        raise Exception(f"tipo de atendimento '{nome}' não existe nesta clínica (opções: {[o[1] for o in opcoes][:8]})")
    # O select pode estar coberto por select2: troca pelo jQuery (dispara os eventos do sistema)
    driver.execute_script("""
        const el = document.getElementById('tipoConsulta');
        if (window.jQuery) jQuery(el).val(arguments[0]).trigger('change');
        else { el.value = arguments[0]; el.dispatchEvent(new Event('change', {bubbles: true})); }
    """, escolhida[0])
    time.sleep(1)
    if driver.execute_script("return document.getElementById('tipoConsulta').value") != escolhida[0]:
        raise Exception(f"o tipo de atendimento '{nome}' não ficou selecionado")
    log(f"    Tipo de atendimento: {escolhida[1]}")


def itens_autocomplete(driver):
    """Opções visíveis da lista do autocomplete (sem 'carregar mais' e 'nenhum resultado')."""
    itens = []
    for li in driver.find_elements(By.CSS_SELECTOR, "ul.ui-autocomplete li.ui-menu-item"):
        if not li.is_displayed():
            continue
        t = normalizar(li.text)
        if not t or "mais registros" in t or "carregar mais" in t or t.startswith("nenhum"):
            continue
        itens.append(li)
    return itens


def lista_sem_resultado(driver):
    return any(li.is_displayed() and normalizar(li.text).startswith("nenhum")
               for li in driver.find_elements(By.CSS_SELECTOR, "ul.ui-autocomplete li"))


def digitar(driver, campo, texto):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", campo)
    try:
        campo.click()
    except Exception:
        driver.execute_script("arguments[0].focus();", campo)
    driver.execute_script("arguments[0].select();", campo)
    campo.send_keys(Keys.BACKSPACE)
    campo.send_keys(texto)


def autocomplete(driver, campo, texto, escolher, descricao, tentativas=3):
    """Digita `texto` no autocomplete e escolhe a opção que `escolher(textos)` indicar
    (índice, ou None = nenhuma serve → ErroAgendamento). Confere se a opção 'grudou'."""
    ultimo_erro = ""
    for tentativa in range(1, tentativas + 1):
        digitar(driver, campo, texto)
        try:
            WebDriverWait(driver, 20).until(lambda d: itens_autocomplete(d) or lista_sem_resultado(d))
        except TimeoutException:
            ultimo_erro = f"nenhuma opção apareceu para '{texto}'"
            log(f"      Tentativa {tentativa}: {ultimo_erro}.")
            continue
        time.sleep(1)  # a lista termina de carregar
        itens = itens_autocomplete(driver)
        textos = [li.text.strip().split("\n")[0].strip() for li in itens]
        posicao = escolher(textos) if textos else None
        if posicao is None:
            raise ErroAgendamento(f"{descricao} '{texto}' não encontrado"
                                  + (f" (opções: {textos[:5]})" if textos else ""), status="")
        try:
            if tentativa == 1:
                clicar_mouse(driver, itens[posicao])
            else:
                for _ in range(posicao + 1):
                    campo.send_keys(Keys.ARROW_DOWN)
                    time.sleep(0.2)
                campo.send_keys(Keys.RETURN)
        except Exception as e:
            ultimo_erro = f"falha ao clicar na opção ({resumo_erro(e)})"
            continue
        time.sleep(1)
        atual, escolhido = normalizar(valor(campo)), normalizar(textos[posicao])
        if atual and (not itens_autocomplete(driver) or escolhido in atual or atual in escolhido):
            return textos[posicao]
        ultimo_erro = f"a opção '{textos[posicao]}' não ficou selecionada"
        log(f"      Tentativa {tentativa}: {ultimo_erro}.")
    raise Exception(f"{descricao}: {ultimo_erro or 'não foi possível selecionar'}")


def escolher_nome(nome, ambiguo_falha=True):
    """Escolhe a opção com o nome igual; sem igual, a única que contém o nome."""
    alvo = normalizar(nome)

    def escolher(textos):
        normais = [normalizar(t) for t in textos]
        iguais = [i for i, t in enumerate(normais) if t == alvo]
        if iguais:
            return iguais[0]
        contem = [i for i, t in enumerate(normais) if alvo in t]
        if len(contem) == 1 or (contem and not ambiguo_falha):
            return contem[0]
        return None

    return escolher


def preencher_paciente(driver, nome):
    campo = visivel(driver, "#agenda-paciente")
    try:
        escolhido = autocomplete(driver, campo, nome, escolher_nome(nome), "paciente")
    except ErroAgendamento as e:
        raise ErroAgendamento(str(e), status="paciente não encontrado") from None
    log(f"    Paciente: {escolhido}")


def preencher_profissional(driver, nome):
    """Profissional pelo nome: prefere o igual; senão a 1ª opção da lista."""
    if not nome:
        raise ErroAgendamento("o agendamento não tem profissional ('Agendado com' vazio)")
    campo = visivel(driver, "#agenda-profissional")
    alvo = normalizar(nome)
    escolhido = autocomplete(driver, campo, nome, lambda textos: next(
        (i for i, t in enumerate(textos) if normalizar(t) == alvo), 0), "profissional")
    if normalizar(escolhido) != alvo:
        log(f"    Atenção: profissional '{nome}' não veio igual; selecionado '{escolhido}'.")
    log(f"    Profissional: {escolhido}")


def preencher_convenio(driver):
    """Convênio do paciente: se não vier GRUPO MANDIC, digita e pega a 1ª opção
    (e confirma o pop-up 'Vincular plano', se ele abrir)."""
    campo = visivel(driver, "#agenda-convenio")
    try:  # o sistema preenche o convênio sozinho depois de escolher o paciente
        WebDriverWait(driver, 4).until(lambda d: normalizar(CONVENIO) in normalizar(valor(campo)))
    except TimeoutException:
        pass
    if normalizar(CONVENIO) in normalizar(valor(campo)):
        log(f"    Convênio: {valor(campo)}")
        return
    escolhido = autocomplete(driver, campo, CONVENIO, lambda textos: 0, "convênio")
    try:
        botao = WebDriverWait(driver, 5).until(EC.element_to_be_clickable((By.ID, "btn-vincular-convenio-paciente-agenda")))
        clicar(driver, botao)
        WebDriverWait(driver, 15).until(lambda d: not botao.is_displayed())
        time.sleep(1)
        log("    Convênio vinculado ao paciente.")
    except TimeoutException:
        pass
    except Exception:
        pass  # o pop-up sumiu da página = fechou
    if not valor(campo):
        raise Exception(f"o convênio '{CONVENIO}' não ficou preenchido")
    log(f"    Convênio: {escolhido}")


def preencher_procedimento(driver, nome, primeira_opcao=False):
    campo = visivel(driver, "#procedimento-principal")
    if primeira_opcao:  # a 1ª opção que contém o texto digitado (ou a 1ª da lista)
        escolher = lambda textos: next((i for i, t in enumerate(textos) if normalizar(nome) in normalizar(t)), 0)
    else:
        escolher = escolher_nome(nome, ambiguo_falha=False)
    escolhido = autocomplete(driver, campo, nome, escolher, "procedimento")
    log(f"    Procedimento: {escolhido}")


def preencher_mascara(driver, campo, texto, descricao):
    """Data/hora com máscara e datepicker/timepicker: digita; se não ficar igual, grava pelo jQuery."""
    digitar(driver, campo, texto)
    if valor(campo) != texto:
        driver.execute_script("""
            const el = arguments[0];
            if (window.jQuery) jQuery(el).val(arguments[1]).trigger('input').trigger('change');
            else { el.value = arguments[1]; el.dispatchEvent(new Event('change', {bubbles: true})); }
        """, campo, texto)
    # fecha o calendário/relógio que abriu por cima (sem Esc, que fecharia o formulário)
    driver.execute_script("""
        const el = arguments[0];
        if (window.jQuery) { try { jQuery(el).datepicker && jQuery(el).datepicker('hide'); } catch (e) {}
                             try { jQuery(el).timepicker && jQuery(el).timepicker('hideWidget'); } catch (e) {} }
        el.dispatchEvent(new Event('blur', {bubbles: true}));
    """, campo)
    time.sleep(0.5)
    if valor(campo) != texto:
        raise Exception(f"{descricao}: o campo ficou '{valor(campo)}' em vez de '{texto}'")


def preencher_data_horario(driver, data, hora, duracao_min):
    inicio = datetime.combine(data, datetime.strptime(hora, "%H:%M").time())
    fim = inicio + timedelta(minutes=duracao_min)
    campo_data = visivel(driver, "#dataConsulta")
    if valor(campo_data) != f"{data:%d/%m/%Y}":  # na reserva da turma a data já vem preenchida
        preencher_mascara(driver, campo_data, f"{data:%d/%m/%Y}", "data")
    preencher_mascara(driver, visivel(driver, "#horario-horarioInicial"), f"{inicio:%H:%M}", "horário inicial")
    time.sleep(1)  # o sistema recalcula o final pelo tipo de atendimento: o nosso vem depois
    preencher_mascara(driver, visivel(driver, "#horario-horarioFinal"), f"{fim:%H:%M}", "horário final")
    log(f"    Data: {data:%d/%m/%Y} das {inicio:%H:%M} às {fim:%H:%M}")


def preencher_observacao(driver, texto):
    texto = texto.strip()[:LIMITE_OBSERVACAO]
    campo = visivel(driver, "#observacao")
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", campo)
    campo.clear()
    campo.send_keys(texto)
    if normalizar(valor(campo)) != normalizar(texto):
        raise Exception("a observação não ficou preenchida")


def montar_observacao(linha, config):
    obs_antiga = str(linha.get("Observações") or "").strip()
    if config.get("observacao_odontosig") and obs_antiga:
        return f"{OBSERVACAO}\nObservações do OdontoSig: {obs_antiga}"
    return OBSERVACAO


# ── Fluxo da turma (reservas) ─────────────────────────────────────────────────
def pesquisar_turma(driver, turma):
    """Agenda → tipo de pesquisa 'Turma' → digita a turma e pega a 1ª opção.
    Se o nome completo não achar nada, tenta pelo código (ex.: '8514/25')."""
    driver.get(URL_AGENDA)
    select = WebDriverWait(driver, 30).until(EC.presence_of_element_located((By.ID, "filtro-tipo-pesquisa")))
    driver.execute_script("""
        const el = arguments[0];
        if (window.jQuery) jQuery(el).val('TURMA').trigger('change');
        else { el.value = 'TURMA'; el.dispatchEvent(new Event('change', {bubbles: true})); }
    """, select)
    try:
        campo = visivel(driver, "#pesquisa-turma", timeout=10)
    except TimeoutException:
        raise Exception("o campo de pesquisa de turma não apareceu depois de escolher 'Turma' no filtro") from None
    codigo = re.search(r"\d+/\d+", turma or "")
    for busca in [turma] + ([codigo.group()] if codigo and codigo.group() != turma else []):
        try:
            escolhida = autocomplete(driver, campo, busca, lambda textos: 0, "turma")
            log(f"    Turma: {escolhida}" + (f" (pesquisada por '{busca}')" if busca != turma else ""))
            break
        except ErroAgendamento:
            continue
    else:
        raise ErroAgendamento(f"a turma '{turma}' não está disponível no filtro de turmas")

    # Depois de escolher a turma é preciso clicar em Pesquisar para a lista de reservas carregar.
    try:
        botao = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.ID, "btn-pesquisa-por-tipo")))
    except TimeoutException:
        raise Exception("o botão 'Pesquisar' (#btn-pesquisa-por-tipo) não apareceu depois de escolher a turma") from None
    clicar(driver, botao)
    log("    Pesquisar clicado.")
    return escolhida


def ler_reservas(driver):
    """Reservas da lista da turma: [{data, inicio, fim, reserva, codigo}] na ordem da tela."""
    return driver.execute_script(r"""
        const view = [...document.querySelectorAll('.fc-viewTurma-view')].find(v => v.offsetParent !== null);
        if (!view) return null;
        let data = null; const reservas = [];
        for (const tr of view.querySelectorAll('table.tabela-agrupamento-lista-turmas tbody tr')) {
            const ir = tr.querySelector('a[data-go-data]');
            if (ir) { data = ir.getAttribute('data-go-data'); continue; }
            const botao = tr.querySelector('.btn-adicionar-agendamento');
            if (!botao) continue;
            const tds = tr.querySelectorAll('td');
            const horario = (tds[0] ? tds[0].innerText : '').match(/(\d{1,2}:\d{2})\s*-\s*(\d{1,2}:\d{2})/);
            reservas.push({data, inicio: horario ? horario[1] : '', fim: horario ? horario[2] : '',
                           reserva: tds[2] ? tds[2].innerText.trim().replace(/\s+/g, ' ') : '',
                           codigo: botao.getAttribute('data-codigo')});
        }
        return reservas;
    """)


def esperar_lista_turma(driver, antes=None, timeout=20):
    """Espera a lista de reservas aparecer (ou mudar, depois de trocar anteriores/próximas)."""
    def pronta(d):
        reservas = ler_reservas(d)
        if reservas is None:
            return False
        if antes is not None and reservas == antes:
            return False
        return [reservas]
    try:
        return WebDriverWait(driver, timeout).until(pronta)[0]
    except TimeoutException:
        return ler_reservas(driver) or []


def trocar_lista(driver, anteriores):
    """Clica em 'Reservas anteriores' (True) ou 'Próximas reservas' (False)."""
    classe = "btn-agendamentos-anteriores-turma" if anteriores else "btn-proximos-agendamentos-turma"
    radios = driver.find_elements(By.CSS_SELECTOR, f"input.{classe}")
    if not radios:
        return False
    if radios[0].is_selected():
        return True
    rotulo = next(iter(radios[0].find_elements(By.XPATH, "./ancestor::label[1]")), radios[0])
    clicar(driver, rotulo)
    return True


def achar_reserva(driver, data, hora, duracao_min):
    """Reserva da turma no dia cujo horário cobre [hora, hora + duração]. Procura nas próximas
    reservas e nas anteriores (agendamento de dia que já passou)."""
    alvo = f"{data:%d/%m/%Y}"
    inicio = datetime.strptime(hora, "%H:%M")
    fim = inicio + timedelta(minutes=duracao_min)
    reservas = esperar_lista_turma(driver)
    vistas_no_dia = []
    for anteriores in ((None, True, False) if data < datetime.now().date() else (None, False, True)):
        if anteriores is not None:
            if not trocar_lista(driver, anteriores):
                continue
            time.sleep(1)
            reservas = esperar_lista_turma(driver, antes=reservas, timeout=10)
        no_dia = [r for r in reservas if r["data"] == alvo]
        vistas_no_dia = vistas_no_dia or no_dia
        for r in no_dia:
            try:
                r_ini, r_fim = datetime.strptime(r["inicio"], "%H:%M"), datetime.strptime(r["fim"], "%H:%M")
            except ValueError:
                continue
            if r_ini <= inicio and fim <= r_fim:
                return r
    if vistas_no_dia:
        horarios = ", ".join(f"{r['inicio']}-{r['fim']}" for r in vistas_no_dia)
        raise ErroAgendamento(f"a turma não tem horário reservado em {alvo} às {hora} (reservas do dia: {horarios})")
    raise ErroAgendamento(f"a turma não tem horários reservados em {alvo}")


def abrir_reserva(driver, reserva):
    botao = WebDriverWait(driver, 10).until(lambda d: next(iter(
        visiveis(d, f".btn-adicionar-agendamento[data-codigo='{reserva['codigo']}']")), False))
    clicar(driver, botao)
    try:
        visivel(driver, "#tipoConsulta", timeout=20)
    except TimeoutException:
        raise Exception("o cadastro de agendamento da reserva não abriu (campo 'Tipo de atendimento' não apareceu)") from None
    time.sleep(1)
    log(f"    Reserva: {reserva['data']} {reserva['inicio']}-{reserva['fim']} · {reserva['reserva']}")


def remover_cadeira(driver):
    """Tira o equipamento (cadeira) que a reserva já traz; sem ele na tela, segue."""
    botoes = visiveis(driver, ".btn-remover-input[data-parent='#agenda-equipamento']")
    if not botoes:
        log("    Cadeira: nenhuma no formulário.")
        return
    clicar(driver, botoes[0])
    time.sleep(0.5)
    log("    Cadeira removida.")


def preencher_aluno(driver, nome):
    """Aluno (estagiário) da turma pelo nome. Não achou: deixa o campo vazio e segue."""
    campos = visiveis(driver, "#agenda-estagiario")
    if not campos or not nome:
        return
    try:
        escolhido = autocomplete(driver, campos[0], nome, escolher_nome(nome), "aluno", tentativas=1)
        log(f"    Aluno: {escolhido}")
    except Exception:
        driver.execute_script("arguments[0].value = ''; arguments[0].dispatchEvent(new Event('input', {bubbles: true}));",
                              campos[0])
        for li in visiveis(driver, "ul.ui-autocomplete"):
            driver.execute_script("arguments[0].style.display = 'none';", li)
        log(f"    Aluno '{nome}' não encontrado na turma: seguindo sem aluno.")


def agendar(driver):
    """Clica em Agendar e espera o formulário fechar. Aviso do sistema (horário ocupado,
    validação...) vira erro com a mensagem, sem confirmar nada por conta própria."""
    botao = visivel(driver, "#saveAgenda")
    clicar(driver, botao)

    def resultado(d):
        try:
            if not botao.is_displayed():
                return "ok"
        except Exception:
            return "ok"  # o formulário saiu da página
        if visiveis(d, ".swal2-popup"):
            return "aviso"
        return False

    try:
        situacao = WebDriverWait(driver, 30).until(resultado)
    except TimeoutException:
        mensagem = mensagens_na_tela(driver)
        raise Exception("o formulário não fechou depois de clicar em Agendar"
                        + (f": {mensagem}" if mensagem else "")) from None
    if situacao == "aviso":
        time.sleep(0.5)
        if not botao_visivel(driver, botao):
            return  # aviso de sucesso por cima da agenda
        raise Exception(f"o sistema mostrou um aviso ao agendar: {mensagens_na_tela(driver) or '(sem texto)'}")


def botao_visivel(driver, botao):
    try:
        return botao.is_displayed()
    except Exception:
        return False


def cadastrar(driver, linha, config):
    """Cadastra um agendamento (dict do banco) com a configuração do tipo."""
    if config.get("fluxo") == "turma":
        return cadastrar_na_turma(driver, linha, config)
    abrir_formulario(driver)
    selecionar_tipo(driver, config["tipo_atendimento"])
    preencher_paciente(driver, linha["Nome"])
    preencher_profissional(driver, linha["Agendado com"])
    preencher_convenio(driver)
    if config.get("procedimento"):
        preencher_procedimento(driver, config["procedimento"])
    preencher_data_horario(driver, linha["Data"], linha["Hora"], config["duracao_min"])
    preencher_observacao(driver, montar_observacao(linha, config))
    agendar(driver)


def cadastrar_na_turma(driver, linha, config):
    pesquisar_turma(driver, linha.get("Turma"))
    reserva = achar_reserva(driver, linha["Data"], linha["Hora"], config["duracao_min"])
    abrir_reserva(driver, reserva)
    selecionar_tipo(driver, config["tipo_atendimento"])
    remover_cadeira(driver)
    preencher_aluno(driver, linha.get("Aluno") or linha.get("Agendado com"))
    preencher_paciente(driver, linha["Nome"])
    preencher_convenio(driver)
    if config.get("procedimento"):
        preencher_procedimento(driver, config["procedimento"], config.get("procedimento_primeira_opcao"))
    preencher_data_horario(driver, linha["Data"], linha["Hora"], config["duracao_min"])
    preencher_observacao(driver, montar_observacao(linha, config))
    agendar(driver)


# ── Lote ──────────────────────────────────────────────────────────────────────
def integrar(usuario, senha, por_clinica, headless=True, ao_terminar=None, quedas_max=3):
    """Cadastra os agendamentos. `por_clinica` = {clínica CNN: [linhas]}; cada linha tem
    Nome, Agendado com, Data (date), Hora ('HH:MM') e Tipo.

    ao_terminar(linha, status, mensagem) é chamado logo depois de cada agendamento, para
    gravar o status antes de seguir (status 'integrado', 'paciente não encontrado' ou 'erro').
    Se o Chrome cair, abre de novo e continua do agendamento seguinte (até quedas_max vezes).
    """
    fila = [(clinica, linha) for clinica, linhas in por_clinica.items() for linha in linhas]
    quedas = 0
    while fila and not PARAR.is_set():
        driver = criar_driver(headless)
        clinica_atual = None
        try:
            fazer_login(driver, usuario, senha)
            while fila and not PARAR.is_set():
                clinica, linha = fila[0]
                if clinica != clinica_atual:
                    log(f"── {clinica} ──")
                    selecionar_clinica(driver, clinica)
                    clinica_atual = clinica
                config = TIPOS[chave_tipo(linha["Tipo"])]
                log(f"  {linha['Data']:%d/%m/%Y} {linha['Hora']} · {linha['Nome']} ({config['nome']})")
                try:
                    cadastrar(driver, linha, config)
                    status, mensagem = "integrado", ""
                    log("    Agendado.")
                except ErroAgendamento as e:
                    status, mensagem = e.status or "erro", str(e)
                    log(f"    {status.upper()}: {mensagem}")
                except Exception as e:
                    if sessao_caiu(e):
                        raise
                    status, mensagem = "erro", resumo_erro(e)
                    log(f"    ERRO: {mensagem}")
                    salvar_evidencia(driver, linha["Nome"])
                fila.pop(0)
                quedas = 0
                if ao_terminar:
                    ao_terminar(linha, status, mensagem)
        except ErroLogin:
            raise
        except Exception as e:
            if not sessao_caiu(e):
                # erro fora de um agendamento (login, troca de clínica): a clínica inteira não dá
                salvar_evidencia(driver, "sessao")
                if fila:
                    clinica = fila[0][0]
                    log(f"ERRO em {clinica}: {resumo_erro(e)} — pulando os agendamentos desta clínica.")
                    while fila and fila[0][0] == clinica:
                        _, linha = fila.pop(0)
                        if ao_terminar:
                            ao_terminar(linha, "erro", f"clínica: {resumo_erro(e)}")
                continue
            quedas += 1
            log(f"O navegador caiu ({resumo_erro(e)}).")
            if quedas >= quedas_max:
                raise Exception(f"o navegador caiu {quedas} vezes seguidas") from e
            log("Abrindo de novo em 10 segundos...")
            if PARAR.wait(10):
                break
        finally:
            try:
                driver.quit()
            except Exception:
                pass
