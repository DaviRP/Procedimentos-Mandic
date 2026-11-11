import openpyxl
import os
import re
import time
import traceback
import unicodedata
from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


# Em TODOS os procedimentos da planilha: grava a coluna de observação em "Observações"
# e em "Orientações pré e pós-procedimento" (CKEditor), marca "Prótese" (controla-protese)
# quando Protese = "Sim" e salva
ARQUIVO = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Template Procedimentos, Grupos e Produtos(CAMPINAS).xlsx")
ABA = "Procedimentos"
COLUNA_STATUS = "Status Atualizacao"
COLUNA_OBSERVACAO = "Observação (Máx. 500 caracteres)"
CLINICA = "CAMPINAS - GRUPO MANDIC"

URL_BASE = "https://app.clinicanasnuvens.com.br"
URL_LISTA = f"{URL_BASE}/procedimentos"
PASTA_ERROS = os.path.join(os.path.dirname(os.path.abspath(__file__)), "erros")

# Quantos procedimentos processar nesta execução (None = todos). Use 1 para testar.
LIMITE = None

# True = roda sem abrir a janela do Chrome
HEADLESS = True

# Segundos que cada espera aguarda a página/botão aparecer
ESPERA = 30


def _salvar_planilha(wb):
    # Salva num temporário e troca pelo original (os.replace é atômico):
    # uma interrupção no meio nunca deixa o .xlsx corrompido.
    tmp = ARQUIVO + ".tmp"
    wb.save(tmp)
    os.replace(tmp, ARQUIVO)


def _idx_coluna(cabecalho, nome, obrigatoria=True):
    # Busca a coluna pelo nome, ignorando maiúsculas/minúsculas e espaços nas pontas.
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


def normalizar(valor):
    """Minúsculas, sem acentos e com espaços simples — para comparar nomes."""
    valor = unicodedata.normalize("NFKD", _texto(valor))
    valor = "".join(c for c in valor if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", valor).strip().lower()


def carregar_procedimentos():
    """Devolve (col_status, {nome: {"linhas", "observacao", "protese"}}) dos procedimentos ainda não processados."""
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]
    cabecalho = [cell.value for cell in ws[1]]

    col_procedimento = _idx_coluna(cabecalho, "Nome do procedimento")
    col_protese      = _idx_coluna(cabecalho, "Protese")
    col_observacao   = _idx_coluna(cabecalho, COLUNA_OBSERVACAO)

    col_status = _idx_coluna(cabecalho, COLUNA_STATUS, obrigatoria=False)
    if col_status is None:
        col_status = len(cabecalho) + 1
        ws.cell(row=1, column=col_status, value=COLUNA_STATUS)
        _salvar_planilha(wb)

    procedimentos = {}
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        procedimento = _texto(ws.cell(row=num_row, column=col_procedimento).value)
        protese      = normalizar(ws.cell(row=num_row, column=col_protese).value)
        observacao   = _texto(ws.cell(row=num_row, column=col_observacao).value)
        status       = normalizar(ws.cell(row=num_row, column=col_status).value)

        if not procedimento or status in ("atualizado", "erro"):
            continue
        dados = procedimentos.setdefault(procedimento, {"linhas": [], "observacao": observacao, "protese": False})
        dados["linhas"].append(num_row)
        dados["protese"] = dados["protese"] or protese == "sim"
        if observacao and observacao != dados["observacao"]:
            if dados["observacao"]:
                print(f"Aviso: '{procedimento}' aparece com observações diferentes na planilha; usando a da 1ª linha.")
            else:
                dados["observacao"] = observacao

    return col_status, procedimentos


def marcar_status(linhas, col_status, valor):
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]
    for linha in linhas:
        ws.cell(row=linha, column=col_status, value=valor)
    _salvar_planilha(wb)


def salvar_print_erro(driver, nome):
    try:
        os.makedirs(PASTA_ERROS, exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)[:60]
        base = os.path.join(PASTA_ERROS, f"procedimento_{nome}_{datetime.now():%Y%m%d_%H%M%S}")
        driver.save_screenshot(base + ".png")
        with open(base + ".html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        print(f"  Print salvo em {base}.png")
    except Exception:
        pass


def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    driver.execute_script("arguments[0].click();", elemento)


# ── Passos na plataforma ───────────────────────────────────────────────────────

def abrir_procedimento(driver, nome_proc):
    """Pesquisa o procedimento e abre o Editar da linha com o nome exato (não só o 1º resultado)."""
    driver.get(URL_LISTA)
    campo = WebDriverWait(driver, ESPERA).until(EC.element_to_be_clickable((By.ID, "nomeTipoProcedimento")))
    campo.clear()
    campo.send_keys(nome_proc)

    botao = next((b for b in driver.find_elements(By.CSS_SELECTOR, "button[type='submit'].btn-light-primary")
                  if "pesquisar" in b.text.lower()), None)
    if botao is None:
        raise Exception("botão 'Pesquisar' não encontrado")
    clicar(driver, botao)

    # Espera a lista recarregar com o resultado da pesquisa
    WebDriverWait(driver, ESPERA).until(lambda d: "nomeTipoProcedimento=" in d.current_url
                                        or d.find_elements(By.CSS_SELECTOR, "a.visualizar-procedimento"))
    time.sleep(1.5)

    links = driver.find_elements(By.CSS_SELECTOR, "a.visualizar-procedimento")
    if not links:
        raise Exception("procedimento não encontrado na pesquisa")

    # A pesquisa é por "contém": 'Barra 3X3' também traz 'Barra 3X3 Reta'. Fica com o nome exato.
    alvo = normalizar(nome_proc)
    for link in links:
        try:
            linha = link.find_element(By.XPATH, "./ancestor::tr[1]")
        except Exception:
            continue
        if any(normalizar(celula.text) == alvo for celula in linha.find_elements(By.CSS_SELECTOR, "td")):
            clicar(driver, link)
            return

    if len(links) == 1:
        print("  Aviso: nome na tela não bateu exatamente; usando o único resultado da pesquisa.")
        clicar(driver, links[0])
        return
    raise Exception(f"{len(links)} resultados na pesquisa e nenhum com o nome exato")


XPATH_EDITOR_ORIENTACOES = ("//textarea[@id='editor_orientacoes']/following-sibling::div[contains(@class,'ck-editor')]"
                            "//div[contains(@class,'ck-editor__editable')]")


def _editor_orientacoes(driver):
    """Área editável do CKEditor de 'Orientações pré e pós-procedimento'."""
    editores = driver.find_elements(By.XPATH, XPATH_EDITOR_ORIENTACOES) \
        or driver.find_elements(By.CSS_SELECTOR, "div.ck-editor__editable")
    if not editores:
        raise Exception("editor de 'Orientações pré e pós-procedimento' não encontrado")
    return editores[0]


def preencher_observacao(driver, texto):
    """Troca o conteúdo do textarea 'Observações' pelo texto."""
    campo = WebDriverWait(driver, ESPERA).until(EC.presence_of_element_located((By.ID, "tipoProcedimento-observacao")))
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", campo)
    campo.clear()
    if texto:
        campo.send_keys(texto)
    if campo.get_attribute("value").strip() != texto.strip():
        raise Exception("o campo 'Observações' não ficou com o texto da planilha")


def preencher_orientacoes(driver, texto):
    """Troca o conteúdo do CKEditor pelo texto: pela API do editor (setData) e,
    se ela não estiver acessível, clicando, selecionando tudo e digitando."""
    editavel = _editor_orientacoes(driver)
    pela_api = driver.execute_script("""
        const editor = arguments[0].ckeditorInstance;
        if (!editor) return false;
        const p = document.createElement('p');
        p.textContent = arguments[1];
        editor.setData(arguments[1] ? p.outerHTML : '');
        if (editor.updateSourceElement) editor.updateSourceElement();
        return true;
    """, editavel, texto)
    if not pela_api:
        clicar(driver, editavel)
        editavel.send_keys(Keys.COMMAND, "a")
        editavel.send_keys(Keys.CONTROL, "a")
        editavel.send_keys(Keys.DELETE)
        if texto:
            editavel.send_keys(texto)
    time.sleep(0.5)
    if normalizar(editavel.text) != normalizar(texto):
        raise Exception("o editor de 'Orientações pré e pós-procedimento' não ficou com o texto da planilha")


def marcar_protese(driver):
    """Marca 'controla-protese'. Devolve False se já estava marcado."""
    checkbox = WebDriverWait(driver, ESPERA).until(EC.presence_of_element_located((By.ID, "controla-protese")))
    if checkbox.is_selected():
        return False
    clicar(driver, checkbox)
    time.sleep(0.5)
    if not checkbox.is_selected():
        raise Exception("não foi possível marcar a opção Prótese")
    return True


def atualizar_procedimento(driver, observacao, protese):
    """Preenche Observações + Orientações com a observação, marca Prótese (se for o caso),
    salva e confere reabrindo o procedimento. Devolve se a Prótese foi marcada agora."""
    WebDriverWait(driver, ESPERA).until(EC.presence_of_element_located((By.ID, "tipoProcedimento-observacao")))
    time.sleep(1)

    preencher_observacao(driver, observacao)
    preencher_orientacoes(driver, observacao)
    protese_marcada = marcar_protese(driver) if protese else False

    botao_salvar = next(
        (b for b in driver.find_elements(By.CSS_SELECTOR, "button[type='submit'][name='_method'][value='post']")
         if b.is_displayed() and "salvar" in b.text.lower()),
        None,
    )
    if botao_salvar is None:
        raise Exception("botão 'Salvar' não encontrado")

    url_procedimento = driver.current_url
    clicar(driver, botao_salvar)
    time.sleep(2)

    # Confere: reabre o procedimento e vê se tudo ficou salvo
    driver.get(url_procedimento)
    campo = WebDriverWait(driver, ESPERA).until(EC.presence_of_element_located((By.ID, "tipoProcedimento-observacao")))
    time.sleep(1)
    if normalizar(campo.get_attribute("value")) != normalizar(observacao):
        raise Exception("salvou, mas 'Observações' não ficou com o texto (o sistema recusou o Salvar?)")
    if normalizar(_editor_orientacoes(driver).text) != normalizar(observacao):
        raise Exception("salvou, mas 'Orientações pré e pós-procedimento' não ficou com o texto")
    if protese and not driver.find_element(By.ID, "controla-protese").is_selected():
        raise Exception("salvou, mas a opção Prótese não ficou marcada")
    return protese_marcada


def executar():
    col_status, procedimentos = carregar_procedimentos()

    if not procedimentos:
        print("Nenhum procedimento pendente.")
        return
    com_protese = sum(1 for d in procedimentos.values() if d["protese"])
    print(f"{len(procedimentos)} procedimento(s) pendente(s), {com_protese} com Protese = Sim.")

    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, ESPERA)

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
        total = len(procedimentos)
        inicio = time.time()
        atualizados = proteses_marcadas = erros = 0

        for idx, (nome_proc, dados) in enumerate(procedimentos.items(), start=1):
            linhas = dados["linhas"]
            if LIMITE is not None and idx > LIMITE:
                break
            print(f"\n[{idx}/{total}] {nome_proc}" + ("  (prótese)" if dados["protese"] else ""))

            try:
                abrir_procedimento(driver, nome_proc)
                if not dados["observacao"]:
                    print("  Aviso: observação vazia na planilha — os campos vão ficar em branco.")
                if atualizar_procedimento(driver, dados["observacao"], dados["protese"]):
                    proteses_marcadas += 1
                    print("  Observação salva e Prótese ativada.")
                else:
                    print("  Observação salva" + (" (Prótese já estava ativada)." if dados["protese"] else "."))
                atualizados += 1
                marcar_status(linhas, col_status, "atualizado")

            except Exception as e:
                erros += 1
                print(f"  ERRO: {type(e).__name__}: {e}")
                salvar_print_erro(driver, nome_proc)
                marcar_status(linhas, col_status, "erro")

            media = (time.time() - inicio) / idx
            print(f"  Média {media:.1f}s/procedimento | restantes: {total - idx}")

        print(f"\nFim! {atualizados} atualizado(s), {proteses_marcadas} prótese(s) ativada(s), {erros} erro(s). "
              f"Tempo total: {time.time() - inicio:.0f}s")

    except Exception:
        salvar_print_erro(driver, "sessao")
        raise

    finally:
        driver.quit()


if __name__ == "__main__":
    # Reinicia em caso de erro de sessão (linhas já marcadas são puladas)
    while True:
        try:
            executar()
            break
        except Exception as e:
            print(f"\nERRO: {type(e).__name__}: {e}")
            traceback.print_exc(limit=3)
            print("Reiniciando em 10 segundos...")
            time.sleep(10)
