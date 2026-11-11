import builtins
import openpyxl
import os
import re
import shutil
import sys
import threading
import time
import unicodedata
from collections import deque
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


# Planilha única com uma aba por script (ver Template Procedimentos, Grupos e Produtos.xlsx)
ARQUIVO = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Template Procedimentos, Grupos e Produtos(CAMPINAS).xlsx")
ABA = "Procedimentos e Grupos"
CLINICA = "CAMPINAS - GRUPO MANDIC"
SEM_GRUPO = "sem grupo de equivalência"
PRODUTO_PADRAO_FALLBACK = "SELECIONE O ITEM AO LADO"  # usado quando não há "Produto principal"
URL_LISTA = "https://app.clinicanasnuvens.com.br/procedimentos"

PASTA = os.path.dirname(os.path.abspath(__file__))
PASTA_ERROS = os.path.join(PASTA, "erros")
PASTA_LOGS = os.path.join(PASTA, "logs")

# Tentativas num mesmo procedimento antes de marcá-lo como 'erro' na planilha
MAX_TENTATIVAS = 3

# True = painel atualizado no terminal; o log detalhado vai para PASTA_LOGS.
# False = log corrido no terminal, como antes.
PAINEL = True
# True = salva print (.png) e HTML da tela quando dá erro, em PASTA_ERROS
SALVAR_PRINTS_ERRO = False
# True = grava o log detalhado da execução em PASTA_LOGS
GERAR_LOG = False

# ── Estado mostrado no painel ─────────────────────────────────────────────────
trava = threading.Lock()           # painel e contadores
trava_print = threading.Lock()     # linhas do terminal/log não se misturam
progresso = {
    "total": 0, "concluidos": 0, "sem_grupo": 0, "erros": 0,
    "grupos_total": 0, "grupos_feitos": 0, "grupos_ok": 0, "avisos": 0,
    "inicio": time.time(),
}
navegador = {"status": "aguardando", "procedimento": "", "etapa": "", "desde": time.time()}
eventos = deque(maxlen=12)      # (hora, cor, texto)
avisos_execucao = []            # (procedimento, texto) — produto padrão não conferiu/não selecionado
erros_execucao = []             # (procedimento, motivo) — procedimentos marcados como 'erro'

painel_ativo = False
log_arquivo = None


def print(*args, sep=" ", end="\n", **kwargs):
    """Tudo vai para o arquivo de log; no terminal só aparece quando o painel está desligado."""
    mensagem = sep.join(str(a) for a in args)
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
    """Atualiza a linha do navegador no painel."""
    with trava:
        navegador.update(campos)


def etapa(texto):
    """Registra no log e mostra no painel o passo em que o navegador está."""
    print(f"  {texto}")
    atualizar(etapa=texto)


def registrar_evento(cor, texto):
    """Linha que aparece em 'Últimos eventos' no painel (e no log)."""
    print(f"  {texto}")
    with trava:
        eventos.append((f"{datetime.now():%H:%M:%S}", cor, texto))


def registrar_aviso(procedimento, texto):
    print(f"  Atenção: {texto}")
    with trava:
        progresso["avisos"] += 1
        avisos_execucao.append((procedimento, texto))


def resumo_erro(e):
    """'TimeoutException' ou 'Exception: mensagem...' — uma linha só."""
    detalhe = re.sub(r"^Message:\s*(None)?", "", str(e).strip().split("\n")[0]).strip()[:70]
    return f"{type(e).__name__}{': ' + detalhe if detalhe else ''}"


def formatar_duracao(segundos):
    segundos = int(segundos)
    horas, resto = divmod(segundos, 3600)
    minutos, segundos = divmod(resto, 60)
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"


def salvar_print_erro(driver, nome):
    """Salva print da tela e HTML da página em erros/<nome>_<hora>.png/.html."""
    if not SALVAR_PRINTS_ERRO:
        return
    try:
        os.makedirs(PASTA_ERROS, exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)[:60]
        base = os.path.join(PASTA_ERROS, f"vinculo_{nome}_{datetime.now():%Y%m%d_%H%M%S}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
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
    "aguardando": (CINZA, "○"),
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


def montar_painel(parando):
    largura, altura = shutil.get_terminal_size((110, 40))
    largura -= 1
    agora = time.time()

    with trava:
        p = dict(progresso)
        nav = dict(navegador)
        ultimos = list(eventos)
        ultimos_avisos = avisos_execucao[-5:]
        ultimos_erros = erros_execucao[-5:]

    feitos = p["concluidos"] + p["sem_grupo"] + p["erros"]
    total = p["total"]
    decorrido = agora - p["inicio"]
    # A previsão é por GRUPO vinculado: procedimento sem grupo passa direto e um com
    # muitos grupos demora bem mais, então a média por procedimento engana.
    if p["grupos_feitos"]:
        restante = decorrido / p["grupos_feitos"] * max(0, p["grupos_total"] - p["grupos_feitos"])
        termino = datetime.now() + timedelta(seconds=restante)
        previsao = (f"média {decorrido / p['grupos_feitos']:.1f}s/grupo   restante {formatar_duracao(restante)}"
                    f"   término {termino:%d/%m %H:%M}")
    else:
        previsao = "calculando previsão..."

    tamanho_barra = max(10, min(50, largura - 40))
    fracao = feitos / total if total else 0
    cheio = int(tamanho_barra * fracao)

    tela = [
        montar_linha(largura, (" Vínculo de grupos de equivalência ", NEGRITO), (f"· {CLINICA}", ""),
                     (f"   {datetime.now():%d/%m %H:%M:%S}", CINZA)),
        montar_linha(largura, (" " + "─" * (largura - 2), CINZA)),
        montar_linha(largura, (" Progresso  ", ""), ("█" * cheio, VERDE), ("░" * (tamanho_barra - cheio), CINZA),
                     (f"  {feitos}/{total} procedimentos  {100 * fracao:.1f}%", NEGRITO)),
        montar_linha(largura, ("            ✔ vinculados ", ""), (str(p["concluidos"]), VERDE),
                     ("   ○ sem grupo ", ""), (str(p["sem_grupo"]), CINZA),
                     ("   ✖ com erro ", ""), (str(p["erros"]), VERMELHO if p["erros"] else ""),
                     ("   ⚠ avisos ", ""), (str(p["avisos"]), AMARELO if p["avisos"] else ""),
                     (f"   decorrido {formatar_duracao(decorrido)}", "")),
        montar_linha(largura, (f"            grupos {p['grupos_feitos']}/{p['grupos_total']}   " + previsao, CINZA)),
    ]
    if parando:
        tela.append(montar_linha(largura, (" ⏸ Parando...", AMARELO)))

    cor, icone = ESTILO_STATUS.get(nav["status"], ("", "·"))
    segundos = int(agora - nav["desde"])
    tela += ["", montar_linha(largura, (" Navegador", NEGRITO)),
             montar_linha(largura,
                          (f"  {icone} {nav['status']:<11}", cor),
                          (f" {nav['procedimento'][:40]:<40}  ", ""),
                          (nav["etapa"], ""),
                          (f"  {segundos}s" if nav["status"] in ("trabalhando", "logando") else "", CINZA))]

    if ultimos_erros:
        tela += ["", montar_linha(largura, (f" Procedimentos com erro ({p['erros']} no total" +
                                            (f" — prints em {PASTA_ERROS})" if SALVAR_PRINTS_ERRO else ")"), NEGRITO))]
        for procedimento, motivo in ultimos_erros:
            tela.append(montar_linha(largura, (f"  ✖ {procedimento}  ", VERMELHO), (motivo, "")))

    if ultimos_avisos:
        tela += ["", montar_linha(largura, (f" Avisos de produto padrão ({p['avisos']} no total"
                                            " — lista completa no resumo final)", NEGRITO))]
        for procedimento, texto in ultimos_avisos:
            tela.append(montar_linha(largura, ("  ⚠ ", AMARELO), (texto, ""), (f"  em {procedimento}", CINZA)))

    tela += ["", montar_linha(largura, (" Últimos eventos", NEGRITO))]
    espaco = max(1, altura - len(tela) - 2)
    for hora, cor_evento, texto in ultimos[-espaco:]:
        tela.append(montar_linha(largura, (f"  {hora} ", CINZA), (texto, cor_evento)))

    tela.append("")
    tela.append(montar_linha(largura, (f" Log completo: {log_arquivo.name}" if log_arquivo
                                       else " Log em arquivo desligado (GERAR_LOG = False)", CINZA)))
    return tela[:altura - 1]


def desenhar_painel(parar_painel, parando):
    """Redesenha o painel a cada segundo numa tela separada do terminal."""
    builtins.print("\033[?1049h\033[?25l", end="", flush=True)  # tela alternativa + esconde cursor
    try:
        while True:
            try:
                tela = montar_painel(parando.is_set())
                builtins.print("\033[H" + "\n".join(linha + "\033[K" for linha in tela) + "\033[J",
                               end="", flush=True)
            except Exception as e:
                print(f"Falha ao desenhar o painel: {e}")
            if parar_painel.wait(1):
                break
    finally:
        builtins.print("\033[?25h\033[?1049l", end="", flush=True)  # volta ao terminal normal


# ── Planilha ───────────────────────────────────────────────────────────────────

def _salvar_planilha(wb):
    # wb.save(ARQUIVO) escreve direto em cima do arquivo original — se o
    # processo for interrompido no meio (erro + Ctrl+C, travamento, arquivo
    # aberto no Excel/LibreOffice ao mesmo tempo etc.), o .xlsx fica
    # corrompido, pela metade. Salvando num arquivo temporário e só trocando
    # pelo original no final (os.replace é atômico), o original nunca fica
    # num estado inválido: ou a troca completa com o arquivo novo inteiro, ou
    # falha e o original continua intacto.
    tmp = ARQUIVO + ".tmp"
    wb.save(tmp)
    os.replace(tmp, ARQUIVO)


def _idx_coluna(cabecalho, nome, obrigatoria=True):
    # Busca o índice de uma coluna pelo nome, ignorando maiúsculas/minúsculas
    # e espaços nas pontas — assim renomear "grupo" -> "Grupo" na planilha,
    # por exemplo, não quebra o script.
    alvo = nome.strip().lower()
    for i, c in enumerate(cabecalho):
        if c and str(c).strip().lower() == alvo:
            return i + 1
    if obrigatoria:
        raise ValueError(f"Coluna '{nome}' não encontrada na aba '{ABA}'. Colunas disponíveis: {cabecalho}")
    return None


def _texto(valor):
    """Célula -> texto: 2.0 (número no Excel) -> '2'; vazio -> ''."""
    if valor is None:
        return ""
    if isinstance(valor, float) and valor.is_integer():
        return str(int(valor))
    return str(valor).strip()


def _quantidade(valor):
    """Quantidade do item: vazia, 0 ou menor que 1 -> '1' (mínimo aceito)."""
    texto = _texto(valor)
    try:
        if float(texto.replace(",", ".")) < 1:
            return "1"
    except ValueError:
        return "1"
    return texto


def carregar_procedimentos():
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]
    cabecalho = [cell.value for cell in ws[1]]

    col_procedimento = _idx_coluna(cabecalho, "Nome procedimento")
    col_grupo        = _idx_coluna(cabecalho, "Nome do Grupo")
    col_quantidade   = _idx_coluna(cabecalho, "Quantidade")
    col_produto_principal = _idx_coluna(cabecalho, "Produto principal")

    col_status = _idx_coluna(cabecalho, "Status", obrigatoria=False)
    if col_status is None:
        col_status = len(cabecalho) + 1
        ws.cell(row=1, column=col_status, value="Status")
        _salvar_planilha(wb)

    # Pré-passagem: coleta procedimentos que já têm qualquer linha marcada
    procs_cadastrados = set()
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        p = ws.cell(row=num_row, column=col_procedimento).value
        s = ws.cell(row=num_row, column=col_status).value
        if p and str(s or "").strip().lower() == "cadastrado":
            procs_cadastrados.add(str(p).strip())

    procedimentos = {}
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        procedimento = ws.cell(row=num_row, column=col_procedimento).value
        grupo        = ws.cell(row=num_row, column=col_grupo).value
        quantidade   = ws.cell(row=num_row, column=col_quantidade).value
        produto_principal = ws.cell(row=num_row, column=col_produto_principal).value

        if not procedimento:
            continue

        procedimento = str(procedimento).strip()

        # Pula o procedimento inteiro se já foi processado numa execução anterior
        if procedimento in procs_cadastrados:
            continue

        if procedimento not in procedimentos:
            procedimentos[procedimento] = {"linhas": [], "grupos": []}

        procedimentos[procedimento]["linhas"].append(num_row)

        grupo_str = str(grupo).strip() if grupo else ""

        # Linhas sem grupo de equivalência (célula vazia ou "Sem grupo de
        # equivalência") não geram vínculo — só contam a linha como parte do
        # procedimento, sem entrar na lista de grupos a cadastrar.
        if grupo_str and grupo_str.lower() != SEM_GRUPO:
            procedimentos[procedimento]["grupos"].append({
                "grupo": grupo_str,
                "quantidade": _quantidade(quantidade),
                # Vazio = usa o primeiro produto do grupo como produto padrão
                "produto_principal": _texto(produto_principal),
            })

    return col_status, procedimentos


def marcar_status(linhas, col_status, valor):
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]
    for linha in linhas:
        ws.cell(row=linha, column=col_status, value=valor)
    _salvar_planilha(wb)


# ── Site ───────────────────────────────────────────────────────────────────────

def abrir_sessao():
    """Abre o Chrome, faz login e seleciona a clínica. Devolve o driver."""
    opcoes = webdriver.ChromeOptions()
    opcoes.add_argument("--window-size=1920,1080")
    opcoes.add_argument("--window-position=-32000,-32000")
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)

    try:
        # ── Login ──────────────────────────────────────────────────────────────
        driver.get("https://app.clinicanasnuvens.com.br/")

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

        driver.get(URL_LISTA)
        time.sleep(3)
    except Exception:
        driver.quit()
        raise

    return driver


class NaoEncontrado(Exception):
    """Procedimento ou grupo que não existe no sistema — tentar de novo não adianta."""


def normalizar(texto):
    """Minúsculas, sem acento e com espaços simples — pra comparar nomes da planilha com a tela."""
    texto = unicodedata.normalize("NFKD", texto or "")
    texto = "".join(c for c in texto if not unicodedata.combining(c))
    return " ".join(texto.lower().split())


def _label_grupo_equivalencia_visivel(d):
    for el in d.find_elements(
        By.XPATH,
        "//label[contains(@class,'btn') and .//input[@name='tipoItem' and @value='false']]"
    ):
        if el.is_displayed():
            return el
    return False


def adicionar_grupo(driver, nome_proc, grupo):
    """Adiciona UM grupo de equivalência na ficha técnica aberta (sem salvar o procedimento)."""
    wait = WebDriverWait(driver, 15)

    # 5. Clica em Adicionar item
    botao_add = wait.until(EC.element_to_be_clickable((By.ID, "adicionar-produto")))
    driver.execute_script("arguments[0].click();", botao_add)
    time.sleep(1)

    # 6. Seleciona a opção "Grupo de equivalência". Atenção: o
    # HTML tem DOIS <input id="tipo-item"> (um pra "Produto", um
    # pra "Grupo de equivalência") — o id está duplicado, então
    # By.ID sempre pega o primeiro (Produto, que já vem checked
    # por padrão). O que realmente diferencia os dois é o
    # atributo value: "true" = Produto, "false" = Grupo de
    # equivalência.
    label_grupo = wait.until(_label_grupo_equivalencia_visivel)
    driver.execute_script("arguments[0].scrollIntoView({block:'center'});", label_grupo)
    time.sleep(0.3)
    driver.execute_script("arguments[0].click();", label_grupo)
    time.sleep(0.5)

    # Confere se o radio realmente marcou; se não, força o estado
    # e dispara os eventos que o JS da página normalmente espera
    # de uma interação real (change/input/click).
    radio_grupo = driver.find_element(By.XPATH, "//input[@name='tipoItem' and @value='false']")
    if not radio_grupo.is_selected():
        driver.execute_script("""
            const input = arguments[0];
            input.checked = true;
            input.dispatchEvent(new Event('input', {bubbles: true}));
            input.dispatchEvent(new Event('change', {bubbles: true}));
            input.dispatchEvent(new Event('click', {bubbles: true}));
        """, radio_grupo)
        time.sleep(0.5)

    # 7. Digita o nome do grupo e seleciona via autocomplete.
    # Esse autocomplete não deixa selecionar o 1º item da lista por
    # clique/click direto — precisa navegar com seta pra baixo e
    # confirmar com enter.
    campo_grupo = wait.until(EC.element_to_be_clickable((By.ID, "autocomplete-grupo-equivalencia")))
    campo_grupo.clear()
    campo_grupo.send_keys(grupo["grupo"])
    time.sleep(1)

    # Se o grupo não existe, a lista de sugestões não traz nenhuma opção com o
    # nome dele — sem essa checagem o item seria salvo sem grupo, em silêncio.
    # Só confere quando a lista (jQuery UI) existe na página; senão segue como antes.
    if driver.find_elements(By.CSS_SELECTOR, "ul.ui-autocomplete"):
        alvo = normalizar(grupo["grupo"])

        def sugestao_do_grupo(d):
            return any(alvo in normalizar(li.text)
                       for li in d.find_elements(By.CSS_SELECTOR, "ul.ui-autocomplete li.ui-menu-item")
                       if li.is_displayed())

        try:
            WebDriverWait(driver, 5).until(sugestao_do_grupo)
        except TimeoutException:
            raise NaoEncontrado(f"grupo '{grupo['grupo']}' não encontrado no autocomplete")

    campo_grupo.send_keys(Keys.ARROW_DOWN)
    time.sleep(0.1)
    campo_grupo.send_keys(Keys.RETURN)
    time.sleep(0.5)

    # 8. Produto padrão (campo #produto-equivalente).
    # Digita o "Produto principal" da planilha no campo e seleciona a
    # sugestão com seta pra baixo + enter. Sem produto principal, usa
    # PRODUTO_PADRAO_FALLBACK ("SELECIONE O ITEM AO LADO").
    # As teclas vão direto pro input #produto-equivalente (não via
    # ActionChains solto) pra garantir que caem no campo certo.
    campo_produto_padrao = wait.until(EC.presence_of_element_located((By.ID, "produto-equivalente")))
    produto_alvo = grupo["produto_principal"] or PRODUTO_PADRAO_FALLBACK
    campo_produto_padrao.click()
    campo_produto_padrao.clear()
    campo_produto_padrao.send_keys(produto_alvo)
    time.sleep(1.5)
    campo_produto_padrao.send_keys(Keys.ARROW_DOWN)
    time.sleep(0.2)
    campo_produto_padrao.send_keys(Keys.RETURN)
    time.sleep(0.5)

    escolhido = (campo_produto_padrao.get_attribute("value") or "").strip()
    if produto_alvo.lower() not in escolhido.lower():
        registrar_aviso(nome_proc, f"{grupo['grupo']}: produto padrão '{escolhido}' "
                                   f"selecionado para '{produto_alvo}'")

    # 9. Preenche a quantidade (coluna "Quantidade"; vazia ou 0 = 1)
    campo_qtd = wait.until(EC.element_to_be_clickable((By.ID, "quantidade")))
    campo_qtd.clear()
    campo_qtd.send_keys(grupo["quantidade"])
    time.sleep(0.3)

    # 10. Salva o item
    botao_salvar_item = wait.until(EC.element_to_be_clickable(
        (By.CSS_SELECTOR, "button.adicionar-produto-lista")
    ))
    driver.execute_script("arguments[0].click();", botao_salvar_item)
    time.sleep(1)

    padrao = escolhido or "—"
    print(f"  + {grupo['grupo']} → padrão: {padrao} | qtd {grupo['quantidade']}")


def vincular_procedimento(driver, nome_proc, grupos):
    """Abre o procedimento, adiciona todos os grupos na ficha técnica e salva."""
    wait = WebDriverWait(driver, 15)

    # 1. Busca o procedimento
    etapa("Buscando o procedimento")
    driver.get(URL_LISTA)
    campo_busca = wait.until(EC.element_to_be_clickable((By.ID, "nomeTipoProcedimento")))
    campo_busca.clear()
    campo_busca.send_keys(nome_proc)

    # 2. Clica em Pesquisar
    driver.find_element(By.XPATH, "//button[@type='submit' and contains(@class,'btn-light-primary')]").click()
    time.sleep(2)

    # 3. Clica no primeiro botão Editar da lista
    etapa("Abrindo o procedimento")
    try:
        botao_editar = wait.until(EC.element_to_be_clickable(
            (By.CSS_SELECTOR, "a.visualizar-procedimento")
        ))
    except TimeoutException:
        raise NaoEncontrado("procedimento não encontrado na busca")
    driver.execute_script("arguments[0].click();", botao_editar)
    time.sleep(2)

    # 4. Clica na aba Ficha técnica
    aba_ficha = wait.until(EC.element_to_be_clickable(
        (By.XPATH, "//a[@href='#movimentacao-estoque']")
    ))
    driver.execute_script("arguments[0].click();", aba_ficha)
    time.sleep(1)

    for i, grupo in enumerate(grupos, start=1):
        atualizar(etapa=f"Grupo {i}/{len(grupos)}: {grupo['grupo']}")
        adicionar_grupo(driver, nome_proc, grupo)

    # 11. Depois de adicionar todos os grupos do procedimento, salva
    # o formulário do procedimento (botão de submit da tela, não o
    # "Salvar" de cada item individual).
    etapa("Salvando o procedimento")
    botao_salvar_procedimento = wait.until(EC.element_to_be_clickable(
        (By.CSS_SELECTOR, "button[type='submit'][name='_method'][value='post']")
    ))
    driver.execute_script("arguments[0].click();", botao_salvar_procedimento)
    time.sleep(2)


def _sessao_viva(driver):
    try:
        driver.current_url
        return True
    except Exception:
        return False


def processar_procedimento(driver, col_status, nome_proc, dados, tentativa, fila):
    """Vincula os grupos e grava o Status. Erro com a sessão viva: devolve o
    procedimento à fila (até MAX_TENTATIVAS) ou marca 'erro'. Sessão morta:
    levanta a exceção para o navegador reabrir."""
    linhas = dados["linhas"]
    grupos = dados["grupos"]
    avisos_antes = progresso["avisos"]
    salvou = False
    try:
        vincular_procedimento(driver, nome_proc, grupos)
        salvou = True
        etapa("Marcando 'cadastrado' na planilha")
        marcar_status(linhas, col_status, "cadastrado")
    except Exception as e:
        print(f"  ERRO no procedimento '{nome_proc}': {type(e).__name__}: {e}")
        motivo = resumo_erro(e)
        if not salvou and not isinstance(e, NaoEncontrado) and not _sessao_viva(driver):
            raise  # Chrome caiu: reabre o navegador e o procedimento volta para a fila

        salvar_print_erro(driver, nome_proc)
        if isinstance(e, NaoEncontrado):
            motivo = str(e)  # não adianta tentar de novo: vai direto pra 'erro'
        elif salvou:
            motivo += " — falhou DEPOIS de salvar: confira no sistema se os grupos foram vinculados"
        elif tentativa < MAX_TENTATIVAS:
            registrar_evento(AMARELO, f"↻ {nome_proc} — {motivo} — tentando de novo ({tentativa}/{MAX_TENTATIVAS})")
            fila.append((nome_proc, dados, tentativa + 1))
            return

        with trava:
            progresso["erros"] += 1
            progresso["grupos_feitos"] += len(grupos)
            erros_execucao.append((nome_proc, motivo))
        registrar_evento(VERMELHO, f"✖ {nome_proc} — {motivo}")
        try:
            marcar_status(linhas, col_status, "erro")
        except Exception as erro_gravacao:
            print(f"  Falha ao gravar erro na planilha: {erro_gravacao}")
        return

    with trava:
        progresso["concluidos"] += 1
        progresso["grupos_feitos"] += len(grupos)
        progresso["grupos_ok"] += len(grupos)
        avisos = progresso["avisos"] - avisos_antes
    registrar_evento(AMARELO if avisos else VERDE,
                     f"✔ {nome_proc} — {len(grupos)} grupo(s)"
                     + (f", {avisos} aviso(s) de produto padrão" if avisos else ""))


def imprimir_resumo():
    """Resumo final no terminal (fica visível depois que o painel fecha)."""
    print(f"\n{NEGRITO}Resumo da execução{FIM}")
    print(f"  {VERDE}✔ vinculados: {progresso['concluidos']}/{progresso['total']}{FIM}    "
          f"sem grupo: {progresso['sem_grupo']}    "
          f"{VERMELHO if progresso['erros'] else ''}✖ com erro: {progresso['erros']}{FIM}    "
          f"grupos vinculados: {progresso['grupos_ok']}    "
          f"{AMARELO if progresso['avisos'] else ''}⚠ avisos: {progresso['avisos']}{FIM}    "
          f"tempo: {formatar_duracao(time.time() - progresso['inicio'])}")
    if erros_execucao:
        print(f"\n  Procedimentos com erro (marcados 'erro' na planilha"
              + (f"; prints em {PASTA_ERROS}):" if SALVAR_PRINTS_ERRO else "):"))
        for procedimento, motivo in erros_execucao[:30]:
            print(f"   - {procedimento}: {motivo}")
        if len(erros_execucao) > 30:
            print(f"   ... e mais {len(erros_execucao) - 30}" + (" (ver log)" if log_arquivo else ""))
    if avisos_execucao:
        print("\n  Avisos de produto padrão (procedimento → grupo):")
        for procedimento, texto in avisos_execucao[:50]:
            print(f"   - {procedimento} → {texto}")
        if len(avisos_execucao) > 50:
            print(f"   ... e mais {len(avisos_execucao) - 50}" + (" (ver log)" if log_arquivo else ""))
    if log_arquivo:
        print(f"\n  Log completo: {log_arquivo.name}")


def rodar_fila(fila, col_status):
    """Processa a fila; se o Chrome cair, reabre a sessão e continua de onde parou."""
    while fila:
        driver = None
        atual = None
        try:
            atualizar(status="logando", procedimento="", etapa="Login e seleção da clínica", desde=time.time())
            driver = abrir_sessao()
            print("Sessão aberta.")
            atualizar(status="aguardando", etapa="Sessão aberta", desde=time.time())

            while fila:
                atual = fila.popleft()
                nome_proc, dados, tentativa = atual
                grupos = dados["grupos"]

                # Procedimento sem nenhum grupo de equivalência vinculado — não há
                # nada a fazer na tela, só marca como processado pra não reentrar
                # na fila em execuções futuras.
                if not grupos:
                    marcar_status(dados["linhas"], col_status, "cadastrado")
                    with trava:
                        progresso["sem_grupo"] += 1
                    print(f"\n'{nome_proc}' sem grupo de equivalência — marcado como cadastrado.")
                    atual = None
                    continue

                print(f"\nVinculando: {nome_proc} — {len(grupos)} grupo(s)"
                      + (f" (tentativa {tentativa}/{MAX_TENTATIVAS})" if tentativa > 1 else ""))
                atualizar(status="trabalhando", procedimento=f"{nome_proc} ({len(grupos)} gr.)",
                          etapa="", desde=time.time())
                processar_procedimento(driver, col_status, nome_proc, dados, tentativa, fila)
                atual = None

        except Exception as e:
            print(f"\nERRO na sessão: {type(e).__name__}: {e}")
            registrar_evento(AMARELO, f"⚠ Sessão caiu ({resumo_erro(e)}) — reabrindo em 10s")
            atualizar(status="caiu", etapa="Reabrindo em 10s", desde=time.time())
            if driver:
                salvar_print_erro(driver, "sessao")
            if atual:
                fila.appendleft(atual)  # não foi salvo: volta para o começo da fila
            print("Reabrindo o navegador em 10 segundos...")
            time.sleep(10)

        finally:
            if driver:
                try:
                    driver.quit()
                except Exception:
                    pass


def executar():
    global painel_ativo, log_arquivo

    col_status, procedimentos = carregar_procedimentos()

    if not procedimentos:
        print("Nenhum procedimento encontrado.")
        return

    fila = deque((nome, dados, 1) for nome, dados in procedimentos.items())
    progresso["total"] = len(procedimentos)
    progresso["grupos_total"] = sum(len(d["grupos"]) for d in procedimentos.values())
    progresso["inicio"] = time.time()

    if GERAR_LOG:
        os.makedirs(PASTA_LOGS, exist_ok=True)
        log_arquivo = open(os.path.join(PASTA_LOGS, f"vinculo_grupos_{datetime.now():%Y%m%d_%H%M%S}.log"),
                           "w", encoding="utf-8")
    print(f"{len(procedimentos)} procedimento(s) pendente(s), {progresso['grupos_total']} grupo(s) a vincular.")

    parar_painel = threading.Event()
    parando = threading.Event()
    # Painel só faz sentido num terminal de verdade (não em saída redirecionada para arquivo)
    painel_ativo = PAINEL and sys.stdout.isatty()
    thread_painel = None
    if painel_ativo:
        thread_painel = threading.Thread(target=desenhar_painel, args=(parar_painel, parando), daemon=True)
        thread_painel.start()

    interrompido = False
    try:
        rodar_fila(fila, col_status)
    except KeyboardInterrupt:
        # O procedimento em andamento não foi marcado: entra de novo na próxima execução
        interrompido = True
        parando.set()
    finally:
        atualizar(status="finalizado", procedimento="", etapa="", desde=time.time())
        parar_painel.set()
        if thread_painel:
            thread_painel.join(timeout=3)
        painel_ativo = False
        if interrompido:
            print("\nInterrompido pelo usuário (Ctrl+C). O procedimento em andamento não foi marcado.")
        imprimir_resumo()
        if not fila and not interrompido:
            print("\nTodos os procedimentos processados!")
        if log_arquivo:
            log_arquivo.close()
            log_arquivo = None


if __name__ == "__main__":
    executar()
