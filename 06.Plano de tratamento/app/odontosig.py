"""
Robô de coleta de agendamentos do OdontoSig (relatório de prontuários).

Fluxo: login → escolhe a unidade → abre #/relatorios/prontuarios → preenche data de
início e de término → lê a tabela página por página.

Não grava nada: devolve as linhas para quem chamou (o app grava no banco).
"""
import re
import threading
import time
import unicodedata
from datetime import date, datetime

from selenium import webdriver
from selenium.common.exceptions import StaleElementReferenceException, TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

URL_BASE = "https://odontosig.slmandic.edu.br"
URL_LOGIN = URL_BASE + "/#/login?next=%2Fhome"
URL_RELATORIO = URL_BASE + "/#/relatorios/prontuarios"

UNIDADES = [
    "Campinas - SP",
    "São Paulo - SP",
    "Curitiba - PR",
    "Fortaleza - CE",
    "Rio de Janeiro - RJ",
    "Belo Horizonte - MG",
    "Brasília - DF",
    "Grande Vitória - ES",
    "Porto Alegre - RS",
    "Araras - SP",
]

# Colunas da tabela do OdontoSig (data-label de cada célula)
COL_DATA_HORA = "Data / Horário"
COLUNAS_ORIGEM = ["PG", "Nome", "Tipo", "Coordenador", "Agendado com:", "Turma", "Observações"]

# Perfil usado ao escolher a unidade: o cartão precisa ter a unidade E este perfil
PERFIL = "Administradores"

MAX_PAGINAS = 2000      # trava de segurança contra paginação em loop
PARAR = threading.Event()
log = print             # o app troca pelo log da tela
PASTA_ERROS = None      # o app aponta para dados/erros; None = não salva print de erro


class Interrompido(Exception):
    """O usuário pediu para parar."""


def normalizar(texto):
    texto = unicodedata.normalize("NFKD", str(texto or ""))
    texto = "".join(c for c in texto if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", texto).strip().lower()


# ── Navegador ─────────────────────────────────────────────────────────────────
def criar_driver(headless):
    opcoes = webdriver.ChromeOptions()
    if headless:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1600,1000")
    return webdriver.Chrome(options=opcoes)


def visivel(driver, seletor, timeout=20):
    return WebDriverWait(driver, timeout).until(EC.visibility_of_element_located((By.CSS_SELECTOR, seletor)))


def clicar(driver, elemento):
    """Clique normal; se algo estiver na frente, clique via JS."""
    try:
        elemento.click()
    except Exception:
        driver.execute_script("arguments[0].click();", elemento)


def definir_valor(driver, campo, valor):
    """Digita e confere; se o campo não aceitou, grava o valor do jeito que o Vue escuta (evento input)."""
    campo.click()
    driver.execute_script("arguments[0].select();", campo)
    campo.send_keys(Keys.BACKSPACE)
    campo.send_keys(valor)
    if (campo.get_attribute("value") or "") != valor:
        driver.execute_script("""
            const el = arguments[0];
            Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, 'value').set.call(el, arguments[1]);
            el.dispatchEvent(new Event('input', {bubbles: true}));
            el.dispatchEvent(new Event('change', {bubbles: true}));
        """, campo, valor)
    return campo.get_attribute("value") or ""


def texto_alertas(driver):
    """Mensagens de erro/aviso visíveis na tela (para explicar um login recusado)."""
    return driver.execute_script("""
        return [...document.querySelectorAll('.alert, .invalid-feedback, .toast, .swal2-html-container, .b-toast')]
            .filter(e => e.offsetParent !== null).map(e => e.innerText.trim()).filter(Boolean).join(' | ');
    """) or ""


# ── Passos ────────────────────────────────────────────────────────────────────
XPATH_CARTOES = "//div[contains(@class,'card-body')][.//strong[contains(normalize-space(.),'Unidade')]]"


def fazer_login(driver, usuario, senha):
    log("Abrindo o OdontoSig...")
    driver.get(URL_LOGIN)
    definir_valor(driver, visivel(driver, "#usuario"), usuario)
    definir_valor(driver, visivel(driver, "#senha"), senha)
    botao = WebDriverWait(driver, 10).until(EC.element_to_be_clickable(
        (By.XPATH, "//button[normalize-space()='Login']")
    ))
    clicar(driver, botao)

    try:
        WebDriverWait(driver, 30).until(lambda d: d.find_elements(By.XPATH, XPATH_CARTOES))
    except TimeoutException:
        mensagem = texto_alertas(driver)
        raise ValueError("O OdontoSig não aceitou o login"
                         + (f": {mensagem}" if mensagem else " (confira usuário e senha).")) from None
    log("Login aceito.")


def ler_cartao(driver, cartao):
    """{'Unidade': ..., 'Perfil': ...} de um cartão (cada <p> é '<strong>Campo:</strong> valor')."""
    return driver.execute_script(r"""
        const campos = {};
        for (const p of arguments[0].querySelectorAll('p')) {
            const m = p.innerText.match(/^\s*([^:]+):\s*(.*)$/s);
            if (m) campos[m[1].trim()] = m[2].trim();
        }
        return campos;
    """, cartao)


def escolher_unidade(driver, unidade):
    """Clica no cartão com a unidade e o perfil PERFIL e espera sair da tela de escolha.
    Uma unidade costuma ter vários cartões (um por perfil): sem o perfil certo, não escolhe outro."""
    alvo = normalizar(unidade)
    # Só os cartões de verdade: o card-body de fora (que envolve todos) também tem 'Unidade' dentro
    cartoes = [c for c in driver.find_elements(By.XPATH, XPATH_CARTOES)
               if not c.find_elements(By.XPATH, ".//div[contains(@class,'card-body')]")]
    escolhido = None
    perfis_da_unidade, unidades = [], []
    for cartao in cartoes:
        campos = ler_cartao(driver, cartao)
        nome, perfil = campos.get("Unidade", ""), campos.get("Perfil", "")
        if nome not in unidades:
            unidades.append(nome)
        if normalizar(nome) != alvo:
            continue
        perfis_da_unidade.append(perfil)
        if normalizar(perfil) == normalizar(PERFIL) and escolhido is None:
            escolhido = cartao
    if escolhido is None:
        if perfis_da_unidade:
            raise ValueError(f"Unidade '{unidade}' não tem o perfil '{PERFIL}' para este usuário "
                             f"(perfis disponíveis: {', '.join(perfis_da_unidade)}).")
        raise ValueError(f"Unidade '{unidade}' não aparece para este usuário. Disponíveis: {', '.join(unidades)}")

    url_antes = driver.current_url
    # O cartão da unidade é o <div class="card"> mais próximo (classe exata, não 'card-body').
    cartao = escolhido.find_element(
        By.XPATH, "./ancestor::div[contains(concat(' ', normalize-space(@class), ' '), ' card ')][1]"
    )
    # O clique pode estar num botão dentro do cartão ou no cartão inteiro.
    botoes = cartao.find_elements(By.TAG_NAME, "button")
    clicar(driver, botoes[0] if botoes else escolhido)
    try:
        WebDriverWait(driver, 20).until(
            lambda d: d.current_url != url_antes or not d.find_elements(By.XPATH, XPATH_CARTOES)
        )
    except TimeoutException:
        driver.execute_script("arguments[0].click();", cartao)
        WebDriverWait(driver, 20).until(
            lambda d: d.current_url != url_antes or not d.find_elements(By.XPATH, XPATH_CARTOES)
        )
    time.sleep(1.5)
    log(f"Unidade '{unidade}' selecionada (perfil {PERFIL}).")


def assinatura_tabela(driver):
    """Resumo do conteúdo atual da tabela, para saber quando ela mudou (filtro ou página nova)."""
    try:
        return driver.execute_script("""
            const t = document.querySelector('table.b-table');
            if (!t) return null;
            const linhas = t.querySelectorAll('tbody tr');
            const ativa = document.querySelector('.pagination .active');
            return [linhas.length, linhas[0] ? linhas[0].innerText : '',
                    linhas.length ? linhas[linhas.length - 1].innerText : '',
                    ativa ? ativa.innerText : ''].join('¦');
        """)
    except StaleElementReferenceException:
        return None


def esperar_tabela_pronta(driver, timeout=60):
    """Espera a tabela existir e não estar carregando (aria-busy)."""
    WebDriverWait(driver, timeout).until(lambda d: d.execute_script("""
        const t = document.querySelector('table.b-table');
        return !!t && t.getAttribute('aria-busy') !== 'true';
    """))


def esperar_mudanca(driver, antes, timeout=30):
    """Espera a tabela mudar em relação à assinatura 'antes'. Devolve True se mudou."""
    try:
        WebDriverWait(driver, timeout).until(lambda d: assinatura_tabela(d) not in (antes, None))
        esperar_tabela_pronta(driver)
        return True
    except TimeoutException:
        return False


def abrir_relatorio(driver, inicio, fim):
    """Abre o relatório de prontuários e aplica o período (datas em dd/mm/aaaa)."""
    driver.get(URL_RELATORIO)
    campo_inicio = visivel(driver, "#input-data-inicio", timeout=30)
    time.sleep(1)
    antes = assinatura_tabela(driver)

    valor_inicio = definir_valor(driver, campo_inicio, inicio)
    campo_inicio.send_keys(Keys.TAB)
    valor_fim = definir_valor(driver, visivel(driver, "#input-data-fim"), fim)
    driver.find_element(By.CSS_SELECTOR, "#input-data-fim").send_keys(Keys.TAB)
    log(f"Período preenchido: {valor_inicio} a {valor_fim}.")
    if valor_inicio != inicio or valor_fim != fim:
        log(f"  Atenção: os campos de data mostram '{valor_inicio}' e '{valor_fim}' (esperado '{inicio}' e '{fim}').")

    # Se a tela tiver botão de busca, clica; senão a tabela carrega sozinha ao mudar as datas.
    botao = driver.execute_script("""
        return [...document.querySelectorAll('button')].find(b => b.offsetParent !== null &&
            /^(buscar|pesquisar|filtrar|consultar|gerar|visualizar|aplicar)/i.test(b.innerText.trim())) || null;
    """)
    if botao:
        log(f"Clicando em '{botao.text.strip()}'.")
        clicar(driver, botao)

    esperar_mudanca(driver, antes, timeout=30)
    esperar_tabela_pronta(driver)


def ler_pagina(driver):
    """Linhas da página atual como dicts {coluna: texto} (pelo data-label de cada célula)."""
    return driver.execute_script("""
        return [...document.querySelectorAll('table.b-table tbody tr')]
            .filter(tr => !tr.classList.contains('b-table-empty-row') && tr.querySelector('td[data-label]'))
            .map(tr => {
                const linha = {};
                tr.querySelectorAll('td[data-label]').forEach(td => {
                    linha[td.getAttribute('data-label').trim()] = td.innerText.replace(/\\u00a0/g, ' ').trim();
                });
                return linha;
            });
    """)


def proxima_pagina(driver):
    """Clica em 'próxima página' da paginação. Devolve False quando não há próxima."""
    botao = driver.execute_script("""
        const pag = [...document.querySelectorAll('ul.pagination')].find(u => u.offsetParent !== null);
        if (!pag) return null;
        const itens = [...pag.querySelectorAll('li')];
        const li = itens.find(li => {
            const b = li.querySelector('button, a, span');
            const rotulo = ((b && b.getAttribute('aria-label')) || '').toLowerCase();
            const txt = (li.innerText || '').trim();
            return /next|pr[oó]xim/.test(rotulo) || txt === '›' || txt === '>' || /^pr[oó]xim/i.test(txt);
        });
        if (!li || li.classList.contains('disabled')) return null;
        const b = li.querySelector('button, a');
        if (!b || b.getAttribute('aria-disabled') === 'true' || b.disabled) return null;
        return b;
    """)
    if not botao:
        return False
    antes = assinatura_tabela(driver)
    clicar(driver, botao)
    if not esperar_mudanca(driver, antes, timeout=60):
        raise Exception("cliquei em 'próxima página' mas a tabela não mudou")
    return True


# ── Conversão ─────────────────────────────────────────────────────────────────
RE_DATA_HORA = re.compile(r"(\d{2}/\d{2}/\d{4})\s*-\s*(\d{1,2}:\d{2})")
RE_CANCELADO = re.compile(r"\[\s*Agendamento cancelado\s*-\s*([^\]]*)\]", re.I)


def limpar(valor):
    valor = re.sub(r"\s+", " ", str(valor or "")).strip()
    return "" if valor == "-" else valor


def converter(bruta, unidade):
    """Linha da tabela → linha do banco. Separa Data e Hora e detecta cancelamento nas observações."""
    data_hora = limpar(bruta.get(COL_DATA_HORA))
    m = RE_DATA_HORA.search(data_hora)
    if not m:
        raise ValueError(f"Data / Horário fora do formato esperado: '{data_hora}'")
    data = datetime.strptime(m.group(1), "%d/%m/%Y").date()
    hora = m.group(2).zfill(5)

    observacoes = str(bruta.get("Observações") or "").strip()
    cancelado = RE_CANCELADO.search(observacoes)
    return {
        "Unidade": unidade,
        "Data": data,
        "Hora": hora,
        "PG": limpar(bruta.get("PG")),
        "Nome": limpar(bruta.get("Nome")),
        "Tipo": limpar(bruta.get("Tipo")),
        "Coordenador": limpar(bruta.get("Coordenador")),
        "Agendado com": limpar(bruta.get("Agendado com:") or bruta.get("Agendado com")),
        "Turma": limpar(bruta.get("Turma")),
        "Observações": re.sub(r"\n{3,}", "\n\n", observacoes),
        "Cancelado": "Sim" if cancelado else "Não",
        "Cancelado em": cancelado.group(1).strip() if cancelado else "",
    }


# ── Coleta completa de uma unidade ────────────────────────────────────────────
def coletar_unidade(usuario, senha, unidade, inicio: date, fim: date, headless=True, ao_ler_pagina=None):
    """Faz a coleta de uma unidade no período e devolve a lista de linhas convertidas.

    ao_ler_pagina(numero, linhas_da_pagina) é chamado a cada página (para progresso).
    Lança Interrompido se PARAR for acionado (as linhas já lidas vão em e.args[0]).
    """
    driver = criar_driver(headless)
    linhas = []
    try:
        fazer_login(driver, usuario, senha)
        escolher_unidade(driver, unidade)
        abrir_relatorio(driver, inicio.strftime("%d/%m/%Y"), fim.strftime("%d/%m/%Y"))

        fora_do_periodo = 0
        for pagina in range(1, MAX_PAGINAS + 1):
            brutas = ler_pagina(driver)
            convertidas = [converter(b, unidade) for b in brutas]
            fora_do_periodo += sum(1 for l in convertidas if not inicio <= l["Data"] <= fim)
            linhas.extend(convertidas)
            log(f"  Página {pagina}: {len(convertidas)} agendamento(s) (total {len(linhas)}).")
            if ao_ler_pagina:
                ao_ler_pagina(pagina, convertidas)
            if PARAR.is_set():
                raise Interrompido(linhas)
            if not proxima_pagina(driver):
                break
        else:
            log(f"  Atenção: parei em {MAX_PAGINAS} páginas (trava de segurança).")

        if fora_do_periodo:
            log(f"  Atenção: {fora_do_periodo} agendamento(s) fora do período pedido — o filtro de data "
                "pode não ter sido aplicado. Confira no OdontoSig.")
        return linhas
    except Interrompido:
        raise
    except Exception:
        salvar_evidencia(driver, unidade)
        raise
    finally:
        driver.quit()


def salvar_evidencia(driver, nome):
    """Print + HTML da tela no momento do erro, em PASTA_ERROS."""
    if not PASTA_ERROS:
        return
    try:
        PASTA_ERROS.mkdir(parents=True, exist_ok=True)
        nome_arquivo = re.sub(r"\W+", "_", nome)[:40]
        base = PASTA_ERROS / f"{datetime.now():%Y%m%d_%H%M%S}_{nome_arquivo}"
        driver.save_screenshot(f"{base}.png")
        base.with_suffix(".html").write_text(driver.page_source, encoding="utf-8")
        log(f"  Print da tela salvo em dados/erros/{base.name}.png")
    except Exception:
        pass
