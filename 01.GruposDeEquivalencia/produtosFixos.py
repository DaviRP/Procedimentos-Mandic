import openpyxl
import os
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


ARQUIVO = "01.GruposDeEquivalencia/pilarBasico.xlsx"
CLINICA = "FORTALEZA - GRUPO MANDIC"


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
        raise ValueError(f"Coluna '{nome}' não encontrada na planilha. Colunas disponíveis: {cabecalho}")
    return None


def carregar_procedimentos():
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    cabecalho = [cell.value for cell in ws[1]]

    col_procedimento  = _idx_coluna(cabecalho, "Procedimento")
    col_numero        = _idx_coluna(cabecalho, "Numero Fabricante")
    col_nome          = _idx_coluna(cabecalho, "Nome do produto")
    col_identificador = _idx_coluna(cabecalho, "Identificador")

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
        procedimento  = ws.cell(row=num_row, column=col_procedimento).value
        numero        = ws.cell(row=num_row, column=col_numero).value
        nome          = ws.cell(row=num_row, column=col_nome).value
        identificador = ws.cell(row=num_row, column=col_identificador).value

        if not procedimento:
            continue

        procedimento = str(procedimento).strip()

        # Pula o procedimento inteiro se já foi processado numa execução anterior
        if procedimento in procs_cadastrados:
            continue

        if procedimento not in procedimentos:
            procedimentos[procedimento] = {"linhas": [], "produtos": []}

        procedimentos[procedimento]["linhas"].append(num_row)

        numero_str        = str(numero).strip() if numero else ""
        nome_str          = str(nome).strip() if nome else ""
        identificador_str = str(identificador).strip() if identificador else ""

        # Linha sem nenhuma informação de produto não gera vínculo — só
        # conta como parte do procedimento, sem entrar na lista a cadastrar.
        if numero_str or nome_str or identificador_str:
            procedimentos[procedimento]["produtos"].append({
                "numero": numero_str,
                "nome": nome_str,
                "identificador": identificador_str,
            })

    return col_status, procedimentos


def marcar_cadastrado(linhas, col_status):
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    for linha in linhas:
        ws.cell(row=linha, column=col_status, value="cadastrado")
    _salvar_planilha(wb)


def executar():
    col_status, procedimentos = carregar_procedimentos()

    if not procedimentos:
        print("Nenhum procedimento encontrado.")
        return

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

        driver.get("https://app.clinicanasnuvens.com.br/procedimentos")
        time.sleep(3)

        # ── Loop principal ─────────────────────────────────────────────────────
        total = len(procedimentos)
        tempos = []

        for idx, (nome_proc, dados) in enumerate(procedimentos.items(), start=1):
            linhas = dados["linhas"]
            produtos = dados["produtos"]

            # Procedimento sem nenhum produto vinculado — não há nada a fazer
            # na tela, só marca como processado pra não reentrar na fila em
            # execuções futuras.
            if not produtos:
                print(f"\n[{idx}/{total}] '{nome_proc}' sem produto — marcando como cadastrado.")
                marcar_cadastrado(linhas, col_status)
                continue

            print(f"\n[{idx}/{total}] Processando: {nome_proc} — {len(produtos)} produto(s)")
            inicio = time.time()

            # 1. Busca o procedimento
            campo_busca = wait.until(EC.element_to_be_clickable((By.ID, "nomeTipoProcedimento")))
            campo_busca.clear()
            campo_busca.send_keys(nome_proc)

            # 2. Clica em Pesquisar
            driver.find_element(By.XPATH, "//button[@type='submit' and contains(@class,'btn-light-primary')]").click()
            time.sleep(2)

            # 3. Clica no primeiro botão Editar da lista
            botao_editar = wait.until(EC.element_to_be_clickable(
                (By.CSS_SELECTOR, "a.visualizar-procedimento")
            ))
            driver.execute_script("arguments[0].click();", botao_editar)
            time.sleep(2)

            # 4. Clica na aba Ficha técnica
            aba_ficha = wait.until(EC.element_to_be_clickable(
                (By.XPATH, "//a[@href='#movimentacao-estoque']")
            ))
            driver.execute_script("arguments[0].click();", aba_ficha)
            time.sleep(1)

            # Loop de produtos do procedimento
            for produto in produtos:
                # 5. Clica em Adicionar item. A opção "Produto" já vem
                # marcada por padrão nesse formulário (radio checked), então
                # não precisa selecionar nada — segue direto pro autocomplete
                # do produto.
                botao_add = wait.until(EC.element_to_be_clickable((By.ID, "adicionar-produto")))
                driver.execute_script("arguments[0].click();", botao_add)
                time.sleep(1)

                # 6. Digita o nome do produto e seleciona via autocomplete.
                # Mesmo padrão "data-select-type=force" dos outros campos —
                # não dá pra clicar direto no primeiro item da lista, precisa
                # seta pra baixo + enter.
                campo_produto = wait.until(EC.element_to_be_clickable((By.ID, "produto")))
                campo_produto.clear()
                campo_produto.send_keys(produto["nome"])
                time.sleep(1)
                campo_produto.send_keys(Keys.ARROW_DOWN)
                time.sleep(0.1)
                campo_produto.send_keys(Keys.RETURN)
                time.sleep(0.5)

                # 7. Preenche a quantidade. A planilha não tem coluna
                # "Quantidade" pra esse fluxo, então usa "1" fixo.
                campo_qtd = wait.until(EC.element_to_be_clickable((By.ID, "quantidade")))
                campo_qtd.clear()
                campo_qtd.send_keys("1")
                time.sleep(0.3)

                # 8. Salva o item
                botao_salvar_item = wait.until(EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "button.adicionar-produto-lista")
                ))
                driver.execute_script("arguments[0].click();", botao_salvar_item)
                time.sleep(1)

            # 9. Depois de adicionar todos os produtos do procedimento, salva
            # o formulário do procedimento (botão de submit da tela, não o
            # "Salvar" de cada item individual).
            botao_salvar_procedimento = wait.until(EC.element_to_be_clickable(
                (By.CSS_SELECTOR, "button[type='submit'][name='_method'][value='post']")
            ))
            driver.execute_script("arguments[0].click();", botao_salvar_procedimento)
            time.sleep(2)

            # Marca todas as linhas do procedimento como cadastrado
            marcar_cadastrado(linhas, col_status)

            tempos.append(time.time() - inicio)
            media = sum(tempos) / len(tempos)
            restantes = total - idx
            eta = restantes * media
            horas, rem = divmod(int(eta), 3600)
            minutos, segundos = divmod(rem, 60)
            print(f"  Cadastrado! {len(produtos)} produto(s).")
            print(f"  Tempo médio: {media:.1f}s | Restantes: {restantes} | ETA: {horas:02d}:{minutos:02d}:{segundos:02d}")

            # Volta para a lista de procedimentos
            driver.get("https://app.clinicanasnuvens.com.br/procedimentos")
            time.sleep(3)

        print("\nTodos os procedimentos cadastrados!")

    except Exception:
        raise

    finally:
        driver.quit()


# Reinicia tudo do zero em caso de qualquer erro
while True:
    try:
        executar()
        break
    except Exception as e:
        print(f"\nERRO: {e}")
        print("Reiniciando em 10 segundos...")
        time.sleep(3)
