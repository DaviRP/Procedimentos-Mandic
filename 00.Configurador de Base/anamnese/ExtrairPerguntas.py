import csv
import os
import re
import time
import unicodedata

import openpyxl
from openpyxl.styles import Font
from openpyxl.cell.cell import ILLEGAL_CHARACTERS_RE
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
from selenium.common.exceptions import StaleElementReferenceException


# ── Configuração ──────────────────────────────────────────────────────────────
PASTA = os.path.dirname(os.path.abspath(__file__))
ARQUIVO_ENTRADA = os.path.join(PASTA, "Perguntas.csv")
ARQUIVO_SAIDA = os.path.join(PASTA, "Perguntas_Detalhadas.xlsx")
CLINICA = "CAMPINAS - GRUPO MANDIC"
HEADLESS = True
LIMITE_PERGUNTAS = None   # ex.: 3 para um teste rápido; None = todas

# De onde vem a lista de perguntas:
#   "sistema" → percorre a tabela de /anamnese/perguntas, página por página
#   "csv"     → lê o Perguntas.csv e procura cada uma pelo filtro (jeito antigo)
ORIGEM = "sistema"

URL_ANAMNESE = "https://app.clinicanasnuvens.com.br/anamnese"
URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_PERGUNTAS = URL_BASE + "/anamnese/perguntas?page={}"

COLUNAS = [
    "Nome da pergunta",
    "Tipo",
    "Possui observação?",
    "Campo obrigatório?",
    "Opção",
    "Link",
    "Situação",
]


def normalizar(texto):
    """Sem acento, minúsculas e espaços simples — para comparar nomes."""
    texto = unicodedata.normalize("NFKD", texto or "")
    texto = "".join(c for c in texto if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", texto).strip().lower()


def carregar_perguntas():
    """Lê o CSV de entrada e devolve a lista de (nome, tipo, link), sem repetir.
    O link vem preenchido quando o CSV foi gerado pela leitura do sistema."""
    perguntas = []
    vistos = set()
    with open(ARQUIVO_ENTRADA, newline="", encoding="utf-8-sig") as f:
        for linha in csv.DictReader(f):
            nome = (linha.get("Pergunta") or "").strip()
            tipo = (linha.get("Tipo") or "").strip()
            link = (linha.get("Link") or "").strip() or None
            chave = link or normalizar(nome)
            if nome and chave not in vistos:
                vistos.add(chave)
                perguntas.append((nome, tipo, link))
    return perguntas


def salvar_lista(perguntas):
    """Grava a lista lida do sistema no Perguntas.csv (Pergunta, Tipo, Link) assim que termina
    de percorrer as páginas — se a execução parar depois, a lista não se perde."""
    temporario = ARQUIVO_ENTRADA + ".tmp"
    with open(temporario, "w", newline="", encoding="utf-8-sig") as f:
        escritor = csv.writer(f)
        escritor.writerow(["Pergunta", "Tipo", "Link"])
        escritor.writerows(perguntas)
    os.replace(temporario, ARQUIVO_ENTRADA)
    print(f"Lista salva em: {ARQUIVO_ENTRADA}")


def limpar(valor):
    """Tira caracteres de controle que o Excel não aceita (o openpyxl recusa salvar com eles)."""
    return ILLEGAL_CHARACTERS_RE.sub("", valor) if isinstance(valor, str) else valor


def carregar_saida():
    """Lê a planilha de saída (se existir) e mantém só as perguntas com Situação 'ok'.

    Perguntas com 'erro' ou 'não encontrada' são descartadas para serem
    tentadas de novo nesta execução.
    """
    if not os.path.exists(ARQUIVO_SAIDA):
        return []
    ws = openpyxl.load_workbook(ARQUIVO_SAIDA).active
    linhas = []
    for valores in ws.iter_rows(min_row=2, values_only=True):
        linha = dict(zip(COLUNAS, valores))
        if linha.get("Situação") == "ok":
            linhas.append(linha)
    return linhas


def salvar_saida(linhas):
    """Grava a planilha de saída em cópia temporária + os.replace (não corrompe se interromper)."""
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.title = "Perguntas"
    ws.append(COLUNAS)
    for celula in ws[1]:
        celula.font = Font(bold=True)
    for linha in linhas:
        ws.append([limpar(linha.get(c, "")) for c in COLUNAS])
    ws.freeze_panes = "A2"
    larguras = {"A": 60, "B": 18, "C": 18, "D": 18, "E": 40, "F": 55, "G": 16}
    for col, largura in larguras.items():
        ws.column_dimensions[col].width = largura

    temporario = ARQUIVO_SAIDA + ".tmp.xlsx"
    wb.save(temporario)
    os.replace(temporario, ARQUIVO_SAIDA)


def clicar_js(driver, elemento):
    driver.execute_script("arguments[0].click();", elemento)


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


def filtrar_pergunta(driver, wait, nome):
    """Abre a aba Perguntas, filtra pelo nome e clica em Visualizar."""
    driver.get(URL_ANAMNESE)

    aba = wait.until(EC.presence_of_element_located(
        (By.CSS_SELECTOR, "a.nav-link[href='#tab_pane_perguntas']")
    ))
    clicar_js(driver, aba)
    time.sleep(1)

    botao_filtrar = wait.until(EC.presence_of_element_located((By.ID, "btn-drawer-filtropesquisa-perguntas")))
    clicar_js(driver, botao_filtrar)
    time.sleep(1)

    campo_nome = wait.until(EC.element_to_be_clickable((By.ID, "pesquisar-por-nome-perguntas")))
    campo_nome.clear()
    campo_nome.send_keys(nome)

    botao_visualizar = driver.find_element(
        By.XPATH, "//input[@id='pesquisar-por-nome-perguntas']/ancestor::form//button[@type='submit']"
    )
    clicar_js(driver, botao_visualizar)


def localizar_link_pergunta(driver, nome, timeout=10):
    """Procura na lista filtrada a linha cujo nome é igual ao da pergunta e devolve o link de edição.

    O filtro do sistema busca por "contém", então pode trazer várias perguntas
    (ex.: "Tem alergia?" e "Tem alergia a ovo?"). Só aceitamos a de nome igual.
    Se nenhuma bater exatamente mas sobrar um único resultado, usamos ele com aviso.
    """
    alvo = normalizar(nome)
    fim = time.time() + timeout
    ultimo_unico = None

    while time.time() < fim:
        try:
            links = [
                a for a in driver.find_elements(By.CSS_SELECTOR, "a[href*='/anamnese/pergunta/']")
                if a.is_displayed()
            ]
            for link in links:
                linha = link.find_element(By.XPATH, "./ancestor::tr[1]")
                celulas = [normalizar(td.text) for td in linha.find_elements(By.TAG_NAME, "td")]
                if alvo in celulas or normalizar(linha.text).startswith(alvo):
                    return link.get_attribute("href"), True
            ultimo_unico = links[0].get_attribute("href") if len(links) == 1 else None
        except StaleElementReferenceException:
            pass  # tabela sendo recarregada pelo filtro
        time.sleep(0.5)

    return ultimo_unico, False


def ler_pagina_perguntas(driver, pagina):
    """Abre uma página da lista de perguntas e devolve ([(nome, tipo, link)], última página)."""
    driver.get(URL_PERGUNTAS.format(pagina))
    try:
        WebDriverWait(driver, 15).until(EC.presence_of_element_located(
            (By.CSS_SELECTOR, "a[href*='/anamnese/pergunta/'], ul.pagination")
        ))
    except Exception:
        return [], pagina
    time.sleep(0.5)
    linhas, ultima = driver.execute_script("""
        const linhas = [];
        document.querySelectorAll("table tbody tr").forEach(tr => {
            const link = tr.querySelector("a[href*='/anamnese/pergunta/']");
            const tds = tr.querySelectorAll("td");
            if (!link || tds.length < 2) return;
            linhas.push([tds[0].textContent.trim(), tds[1].textContent.trim(), link.href]);
        });
        const paginas = [...document.querySelectorAll("ul.pagination a.itemPaginacao[data-page]")]
            .map(a => parseInt(a.getAttribute("data-page"), 10)).filter(n => !isNaN(n));
        return [linhas, paginas.length ? Math.max(...paginas) : 0];
    """)
    return [(re.sub(r"\s+", " ", n), re.sub(r"\s+", " ", t), l) for n, t, l in linhas], ultima


def listar_perguntas_do_sistema(driver):
    """Percorre /anamnese/perguntas página por página e junta (nome, tipo, link) de todas."""
    perguntas, vistos = [], set()
    pagina, ultima = 0, 0
    while pagina <= ultima:
        linhas, ultima_aqui = ler_pagina_perguntas(driver, pagina)
        ultima = max(ultima, ultima_aqui)
        novas = [l for l in linhas if l[2] not in vistos]
        print(f"  Página {pagina + 1}/{ultima + 1}: {len(linhas)} pergunta(s), {len(novas)} nova(s)")
        if not novas:
            break  # página vazia ou repetida: acabou a lista
        for linha in novas:
            vistos.add(linha[2])
            perguntas.append(linha)
        pagina += 1
    print(f"{len(perguntas)} pergunta(s) encontrada(s) no sistema.")
    return perguntas


def ler_detalhes(driver, wait, url):
    """Abre a pergunta e lê: possui observação, obrigatória e as alternativas (na ordem)."""
    driver.get(url)
    observacao = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "input[name='temObservacao']")))
    obrigatoria = driver.find_element(By.CSS_SELECTOR, "input[name='obrigatoria']")
    time.sleep(0.5)  # dá tempo do repeater de alternativas montar

    # Lê pelo DOM (.value) para pegar o valor atual, e ordena pelo campo 'ordem'.
    alternativas = driver.execute_script("""
        const itens = [];
        document.querySelectorAll("input[name^='alternativas['][name$='].descricao']").forEach(inp => {
            const linha = inp.closest('.linha-alternativa');
            const ordem = linha ? linha.querySelector('input.ordem') : null;
            itens.push({
                descricao: (inp.value || '').trim(),
                ordem: ordem ? parseInt(ordem.value, 10) : itens.length,
            });
        });
        itens.sort((a, b) => a.ordem - b.ordem);
        return itens.map(i => i.descricao).filter(d => d);
    """)

    return {
        "Possui observação?": "Sim" if observacao.is_selected() else "Não",
        "Campo obrigatório?": "Sim" if obrigatoria.is_selected() else "Não",
        "alternativas": alternativas,
    }


# ── Execução ──────────────────────────────────────────────────────────────────
def executar():
    linhas_saida = carregar_saida()
    feitas = {normalizar(l["Nome da pergunta"]) for l in linhas_saida}
    links_feitos = {l["Link"] for l in linhas_saida if l.get("Link")}

    if ORIGEM == "csv":
        perguntas = carregar_perguntas()
        pendentes = [p for p in perguntas
                     if (p[2] not in links_feitos if p[2] else normalizar(p[0]) not in feitas)]
        print(f"{len(perguntas)} pergunta(s) no CSV, {len(feitas)} já extraída(s), {len(pendentes)} a processar.")
        if not pendentes:
            print("Nada a fazer.")
            return

    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)

    try:
        login_e_clinica(driver, wait)

        if ORIGEM == "sistema":
            print("Lendo a lista de perguntas do sistema...")
            perguntas = listar_perguntas_do_sistema(driver)
            salvar_lista(perguntas)
            pendentes = [p for p in perguntas if p[2] not in links_feitos]
            print(f"{len(links_feitos)} já extraída(s), {len(pendentes)} a processar.")
        if LIMITE_PERGUNTAS:
            pendentes = pendentes[:LIMITE_PERGUNTAS]
        if not pendentes:
            print("Nada a fazer.")
            return

        inicio = time.time()
        total = len(pendentes)

        for idx, (nome, tipo, url) in enumerate(pendentes, start=1):
            print(f"\n[{idx}/{total}] {nome}")
            base = {"Nome da pergunta": nome, "Tipo": tipo, "Link": url or ""}

            try:
                if not url:  # origem CSV: procura pelo filtro
                    filtrar_pergunta(driver, wait, nome)
                    url, exato = localizar_link_pergunta(driver, nome)

                    if not url:
                        print("  Pergunta não encontrada na lista — marcada como 'não encontrada'.")
                        linhas_saida.append({**base, "Situação": "não encontrada"})
                        salvar_saida(linhas_saida)
                        continue
                    if not exato:
                        print("  AVISO: nome não bateu exatamente; usando o único resultado do filtro.")

                if url.startswith("/"):
                    url = URL_BASE + url
                print(f"  Abrindo {url}")
                detalhes = ler_detalhes(driver, wait, url)
                alternativas = detalhes["alternativas"]
                print(f"  Observação: {detalhes['Possui observação?']} | "
                      f"Obrigatória: {detalhes['Campo obrigatório?']} | "
                      f"Opções: {', '.join(alternativas) or '(nenhuma)'}")

                comum = {
                    **base,
                    "Possui observação?": detalhes["Possui observação?"],
                    "Campo obrigatório?": detalhes["Campo obrigatório?"],
                    "Link": url,
                    "Situação": "ok",
                }
                # Uma linha por alternativa; pergunta sem alternativas vira uma linha só.
                for opcao in alternativas or [""]:
                    linhas_saida.append({**comum, "Opção": opcao})
                salvar_saida(linhas_saida)

            except Exception as e:
                if "invalid session" in str(e).lower() or "no such window" in str(e).lower():
                    raise  # navegador caiu: reinicia tudo
                print(f"  ERRO: {str(e).splitlines()[0] if str(e) else type(e).__name__}")
                linhas_saida.append({**base, "Situação": "erro"})
                salvar_saida(linhas_saida)

            media = (time.time() - inicio) / idx
            print(f"  Média {media:.1f}s/pergunta — ETA {media * (total - idx) / 60:.1f} min")

        print(f"\nConcluído! Planilha gerada em: {ARQUIVO_SAIDA}")

    finally:
        driver.quit()


# Reinicia em caso de erro geral, retomando das perguntas que ainda não estão 'ok'
while True:
    try:
        executar()
        break
    except Exception as e:
        print(f"\nERRO: {e}")
        print("Reiniciando em 10 segundos...")
        time.sleep(10)
