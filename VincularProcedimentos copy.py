import openpyxl
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


ARQUIVO = "procedimentos.xlsx"
CLINICA = "ARARAS - GRUPO MANDIC"


def carregar_procedimentos():
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    cabecalho = [cell.value for cell in ws[1]]

    col_procedimento  = cabecalho.index("Procedimento") + 1
    col_grupo         = cabecalho.index("Grupo de equivalência") + 1
    col_numero        = cabecalho.index("Numero Fabricante ") + 1
    col_nome          = cabecalho.index("Nome do produto padrão") + 1
    col_identificador = cabecalho.index("Identificador") + 1

    if "Status" not in cabecalho:
        col_status = len(cabecalho) + 1
        ws.cell(row=1, column=col_status, value="Status")
        wb.save(ARQUIVO)
    else:
        col_status = cabecalho.index("Status") + 1

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
        grupo         = ws.cell(row=num_row, column=col_grupo).value
        numero        = ws.cell(row=num_row, column=col_numero).value
        nome          = ws.cell(row=num_row, column=col_nome).value
        identificador = ws.cell(row=num_row, column=col_identificador).value

        if not procedimento:
            continue

        procedimento = str(procedimento).strip()

        if procedimento in procs_cadastrados:
            continue

        if procedimento not in procedimentos:
            procedimentos[procedimento] = {"linhas": [], "grupos": []}

        procedimentos[procedimento]["linhas"].append(num_row)

        if grupo:
            procedimentos[procedimento]["grupos"].append({
                "grupo":         str(grupo).strip(),
                "numero":        str(numero).strip() if numero else "",
                "nome_produto":  str(nome).strip() if nome else "",
                "identificador": str(identificador).strip() if identificador else "",
            })

    return col_status, procedimentos


def marcar_cadastrado(linhas, col_status):
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    for linha in linhas:
        ws.cell(row=linha, column=col_status, value="cadastrado")
    wb.save(ARQUIVO)


def executar():
    col_status, procedimentos = carregar_procedimentos()

    if not procedimentos:
        print("Nenhum grupo encontrado.")
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
        campo_email.send_keys("dpegoraro++++dpegoraro@bionexo.com")
        driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[2]/button").click()

        campo_senha = wait.until(EC.element_to_be_clickable((By.ID, "password")))
        campo_senha.click()
        campo_senha.send_keys("Bi0n3xdpegrr06")
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
            grupos = dados["grupos"]

            if not grupos:
                print(f"\n[{idx}/{total}] Pulando '{nome_proc}' — sem grupos.")
                continue

            print(f"\n[{idx}/{total}] Processando: {nome_proc} — {len(grupos)} grupo(s)")
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

            # Loop de grupos do procedimento
            for grupo in grupos:
                # 5. Clica em Adicionar item
                botao_add = wait.until(EC.element_to_be_clickable((By.ID, "adicionar-produto")))
                driver.execute_script("arguments[0].click();", botao_add)
                time.sleep(1)

                # 6. Seleciona a opção Grupo de equivalência
                radio_grupo = wait.until(EC.element_to_be_clickable((By.ID, "tipo-item")))
                driver.execute_script("arguments[0].click();", radio_grupo)
                time.sleep(0.5)

                # 7. Digita o nome do grupo e seleciona via autocomplete
                campo_grupo = wait.until(EC.element_to_be_clickable((By.ID, "autocomplete-grupo-equivalencia")))
                campo_grupo.clear()
                campo_grupo.send_keys(grupo["grupo"])
                time.sleep(1)
                campo_grupo.send_keys(Keys.ARROW_DOWN)
                time.sleep(0.1)
                campo_grupo.send_keys(Keys.RETURN)
                time.sleep(0.5)

                # 8. Digita o nome do produto padrão e seleciona via autocomplete
                campo_produto = wait.until(EC.element_to_be_clickable((By.ID, "produto-equivalente")))
                campo_produto.clear()
                campo_produto.send_keys(grupo["nome_produto"])
                time.sleep(1)
                campo_produto.send_keys(Keys.ARROW_DOWN)
                time.sleep(0.1)
                campo_produto.send_keys(Keys.RETURN)
                time.sleep(0.5)

                # 9. Preenche quantidade 1
                campo_qtd = wait.until(EC.element_to_be_clickable((By.ID, "quantidade")))
                campo_qtd.clear()
                campo_qtd.send_keys("1")
                time.sleep(0.3)

                # TODO: clicar no botão de salvar o item

            # Marca todas as linhas do procedimento como cadastrado
            marcar_cadastrado(linhas, col_status)

            tempos.append(time.time() - inicio)
            media = sum(tempos) / len(tempos)
            restantes = total - idx
            eta = restantes * media
            horas, rem = divmod(int(eta), 3600)
            minutos, segundos = divmod(rem, 60)
            print(f"  Cadastrado! {len(grupos)} grupo(s).")
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
