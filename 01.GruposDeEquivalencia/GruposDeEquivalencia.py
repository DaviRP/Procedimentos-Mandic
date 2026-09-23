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


def carregar_grupos():
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    cabecalho = [cell.value for cell in ws[1]]

    col_grupo        = cabecalho.index("Grupo de equivalência") + 1
    col_numero       = cabecalho.index("Códº Fabricante") + 1
    col_nome         = cabecalho.index("Nome do produto") + 1
    col_identificador = cabecalho.index("Identificador (IDPRD)") + 1

    # Cria coluna Status se não existir
    if "Status" not in cabecalho:
        col_status = len(cabecalho) + 1
        ws.cell(row=1, column=col_status, value="Status")
        wb.save(ARQUIVO)
    else:
        col_status = cabecalho.index("Status") + 1

    # Pré-passagem: coleta grupos que já têm qualquer linha marcada como cadastrado
    grupos_cadastrados = set()
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        g = ws.cell(row=num_row, column=col_grupo).value
        s = ws.cell(row=num_row, column=col_status).value
        if g and str(s or "").strip().lower() == "cadastrado":
            grupos_cadastrados.add(str(g).strip())

    grupos = {}
    for row in ws.iter_rows(min_row=2):
        num_row = row[0].row
        grupo        = ws.cell(row=num_row, column=col_grupo).value
        numero       = ws.cell(row=num_row, column=col_numero).value
        nome         = ws.cell(row=num_row, column=col_nome).value
        identificador = ws.cell(row=num_row, column=col_identificador).value

        if not grupo:
            continue

        grupo = str(grupo).strip()

        # Pula o grupo inteiro se qualquer linha dele já foi cadastrada
        if grupo in grupos_cadastrados:
            continue

        if grupo not in grupos:
            grupos[grupo] = {"linha": num_row, "produtos": []}

        if numero or nome or identificador:
            numero_str = str(numero).strip() if numero else ""
            nome_str = str(nome).strip() if nome else ""
            identificador_str = str(identificador).strip() if identificador else ""
            # Chave de dedup: identificador é o campo realmente único por produto
            # (Numero Fabricante 2 costuma vir vazio na planilha, então não serve como chave)
            chave = identificador_str or numero_str or nome_str
            ja_existe = any(p["chave"] == chave for p in grupos[grupo]["produtos"])
            if not ja_existe:
                grupos[grupo]["produtos"].append({
                    "numero": numero_str,
                    "nome": nome_str,
                    "identificador": identificador_str,
                    "chave": chave,
                })

    # wb/ws ficam fora de escopo aqui — arquivo fechado automaticamente
    return col_status, grupos


def marcar_cadastrado(linha, col_status):
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    ws.cell(row=linha, column=col_status, value="cadastrado")
    wb.save(ARQUIVO)


def imprimir_grupos(grupos):
    print(f"\nTotal de grupos pendentes: {len(grupos)}\n")
    for nome, dados in list(grupos.items())[:1]:
        print(f"  [{nome}] — {len(dados['produtos'])} produto(s)")
        for p in dados["produtos"]:
            print(f"    • {p['numero']} | {p['nome']}")
    print()


def executar():
    col_status, grupos = carregar_grupos()

    if not grupos:
        print("Nenhum grupo encontrado.")
        return

    opcoes = webdriver.ChromeOptions()
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)
    wait_curto = WebDriverWait(driver, 3)

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

        driver.get("https://app.clinicanasnuvens.com.br/grupo-equivalencia/lista")
        time.sleep(3)

        # ── Loop principal ─────────────────────────────────────────────────────
        total = len(grupos)
        tempos = []

        for idx, (nome_grupo, dados) in enumerate(grupos.items(), start=1):
            linha   = dados["linha"]
            produtos = dados["produtos"]
            print(f"\n[{idx}/{total}] Cadastrando grupo: {nome_grupo} — {len(produtos)} produto(s)")
            inicio = time.time()

            # Abre formulário de novo grupo
            botao_novo = wait.until(EC.element_to_be_clickable(
                (By.XPATH, "//a[@href='/grupo-equivalencia/novo']")
            ))
            driver.execute_script("arguments[0].click();", botao_novo)
            time.sleep(2)

            # Preenche o nome do grupo
            campo_nome = wait.until(EC.element_to_be_clickable((By.ID, "grupo-equivalencia-nome")))
            campo_nome.clear()
            campo_nome.send_keys(nome_grupo)
            time.sleep(1)

            # Loop de produtos
            produtos_ok = 0
            produtos_pulados = []
            for produto in produtos:
                # Re-localiza o botão a cada iteração — DOM muda após cada clique
                botao_add = wait.until(EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "a.adicionar-produto")
                ))
                # Conta os campos existentes antes do clique — não usar o índice
                # do loop (i), pois produtos não encontrados removem a linha e
                # desalinham a contagem de campos em relação a i.
                qtd_antes = len(driver.find_elements(By.CLASS_NAME, "produto-input"))
                driver.execute_script("arguments[0].click();", botao_add)

                # Aguarda o novo campo surgir
                wait.until(lambda d: len(d.find_elements(By.CLASS_NAME, "produto-input")) > qtd_antes)

                # Preenche o último campo (recém-criado)
                campo = driver.find_elements(By.CLASS_NAME, "produto-input")[-1]
                driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
                time.sleep(0.5)
                campo.click()
                campo.send_keys(produto["identificador"])
                time.sleep(2)

                campo.send_keys(Keys.ARROW_DOWN)
                time.sleep(0.2)
                campo.send_keys(Keys.RETURN)
                time.sleep(0.5)

                # O autocomplete grava o código do produto num input hidden
                # (id do campo + "_input"). Se continuar vazio, nada foi
                # selecionado — a busca não encontrou o produto.
                campo_hidden = driver.find_element(By.ID, f"{campo.get_attribute('id')}_input")
                try:
                    wait_curto.until(lambda _: campo_hidden.get_attribute("value").strip() != "")
                    produtos_ok += 1
                except TimeoutException:
                    print(f"  Produto não encontrado: {produto['nome']} — pulando.")
                    produtos_pulados.append(produto["nome"])
                    # Remove a linha vazia para não travar o salvamento do grupo.
                    # Pega o último botão "remover" da tela (mesma lógica usada
                    # para pegar o último campo) em vez de subir pelo DOM a
                    # partir do campo, que dependia de uma estrutura que nem
                    # sempre bate com a página real.
                    botoes_remover = driver.find_elements(By.CSS_SELECTOR, "a.remover-produto")
                    if botoes_remover:
                        driver.execute_script("arguments[0].click();", botoes_remover[-1])
                        wait.until(lambda d: len(d.find_elements(By.CLASS_NAME, "produto-input")) == qtd_antes)
                    continue

            # Salva o grupo
            botao_salvar = wait.until(EC.element_to_be_clickable(
                (By.XPATH, "//button[@type='submit' and contains(@class,'btn-primary')]")
            ))
            driver.execute_script("arguments[0].click();", botao_salvar)
            time.sleep(2)

            # Marca como cadastrado no Excel
            marcar_cadastrado(linha, col_status)

            tempos.append(time.time() - inicio)
            media = sum(tempos) / len(tempos)
            restantes = total - idx
            eta = restantes * media
            horas, rem = divmod(int(eta), 3600)
            minutos, segundos = divmod(rem, 60)
            print(f"  Cadastrado! {produtos_ok} produto(s) — {len(produtos_pulados)} pulado(s).")
            print(f"  Tempo médio: {media:.1f}s | Restantes: {restantes} | ETA: {horas:02d}:{minutos:02d}:{segundos:02d}")

            # Volta para a lista
            driver.get("https://app.clinicanasnuvens.com.br/grupo-equivalencia/lista")
            time.sleep(3)

        print("\nTodos os grupos cadastrados!")

    except Exception:
        os.makedirs("erros", exist_ok=True)
        caminho_print = f"erros/erro_{time.strftime('%Y%m%d_%H%M%S')}.png"
        driver.save_screenshot(caminho_print)
        print(f"  Print do erro salvo em: {caminho_print}")
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
