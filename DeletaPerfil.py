import openpyxl
import csv
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains


ARQUIVO = "LISTA_PERFIL_TRATAMENTO.csv"
CLINICA = "ARARAS - GRUPO MANDIC"


def normalizar_cpf(cpf):
    """Recoloca o(s) zero(s) à esquerda perdido(s) quando a planilha converteu o CPF em número."""
    cpf = (cpf or "").strip()
    if cpf.isdigit():
        cpf = cpf.zfill(11)
    return cpf


def carregar_pacientes():
    """Lê o CSV e monta: paciente (por CPF) -> perfis de tratamento -> subperfis.

    Pula pacientes cujas linhas já estejam marcadas como 'sim' ou 'erro' na
    coluna 'migrado'.
    """
    pacientes = {}

    with open(ARQUIVO, newline="", encoding="utf-8") as f:
        leitor = csv.DictReader(f)
        for linha in leitor:
            cpf = normalizar_cpf(linha["cpf"])
            if not cpf:
                continue

            migrado = (linha.get("migrado") or "").strip().lower()
            if migrado in ("sim", "erro"):
                continue

            nome_perfil = (linha["nomePerfil"] or "").strip()
            sub_perfil = (linha["subPerfil"] or "").strip()

            if cpf not in pacientes:
                pacientes[cpf] = {
                    "idPaciente": (linha["idPaciente"] or "").strip(),
                    "nomePaciente": (linha["nomePaciente"] or "").strip(),
                    "unidade": (linha["unidade"] or "").strip(),
                    "perfis": {},
                }

            perfis = pacientes[cpf]["perfis"]
            if nome_perfil not in perfis:
                perfis[nome_perfil] = {
                    "idPerfil": (linha["idPerfil"] or "").strip(),
                    "subperfis": [],
                }

            if sub_perfil and sub_perfil not in perfis[nome_perfil]["subperfis"]:
                perfis[nome_perfil]["subperfis"].append(sub_perfil)

    return pacientes


def marcar_migrado(cpf, valor):
    """Marca todas as linhas do paciente (por CPF) na coluna 'migrado' do CSV."""
    with open(ARQUIVO, newline="", encoding="utf-8") as f:
        leitor = csv.DictReader(f)
        cabecalho = list(leitor.fieldnames)
        linhas = list(leitor)

    if "migrado" not in cabecalho:
        cabecalho.append("migrado")

    for linha in linhas:
        if normalizar_cpf(linha.get("cpf")) == cpf:
            linha["migrado"] = valor

    with open(ARQUIVO, "w", newline="", encoding="utf-8") as f:
        escritor = csv.DictWriter(f, fieldnames=cabecalho)
        escritor.writeheader()
        escritor.writerows(linhas)


def imprimir_amostra(pacientes, quantidade=10):
    for i, (cpf, dados) in enumerate(pacientes.items()):
        if i >= quantidade:
            break

        print(f"\nPaciente: {dados['nomePaciente']} (CPF: {cpf})")
        print(f"  Unidade: {dados['unidade']}")
        for nome_perfil, perfil in dados["perfis"].items():
            subperfis = ", ".join(perfil["subperfis"])
            print(f"  - {nome_perfil}: {subperfis}")


def marcar_cadastrado(linhas, col_status):
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb.active
    for linha in linhas:
        ws.cell(row=linha, column=col_status, value="cadastrado")
    wb.save(ARQUIVO)


def executar():
    pacientes = carregar_pacientes()

    if not pacientes:
        print("Nenhum paciente encontrado.")
        return

    opcoes = webdriver.ChromeOptions()
    opcoes.add_argument("--headless=new")
    opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    wait = WebDriverWait(driver, 15)

    try:
        # ── Login ──────────────────────────────────────────────────────────────
        print(f"Total de {len(pacientes)} paciente(s) a processar.")
        print("Abrindo página de login...")
        driver.get("https://app.clinicanasnuvens.com.br/")

        campo_email = wait.until(EC.presence_of_element_located(
            (By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[1]/input")
        ))
        campo_email.send_keys("dpegoraro++++dpegoraro@bionexo.com")
        driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[2]/button").click()
        print("E-mail preenchido, avançando para senha...")

        campo_senha = wait.until(EC.element_to_be_clickable((By.ID, "password")))
        campo_senha.click()
        campo_senha.send_keys("Bi0n3xdpegrr06")
        driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[4]/form/div[4]/button").click()
        time.sleep(5)
        print("Login realizado com sucesso.")

        # ── Seleciona a clínica ────────────────────────────────────────────────
        for popup in driver.find_elements(By.XPATH, "//button[text()='X']"):
            if popup.is_displayed():
                driver.execute_script("arguments[0].click();", popup)
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
        driver.execute_script("arguments[0].click();", opcao)
        time.sleep(5)
        print(f"Clínica '{CLINICA}' selecionada.")

        driver.get("https://app.clinicanasnuvens.com.br/pacientes")
        time.sleep(3)
        print("Página de pacientes carregada. Iniciando processamento...\n")

        # ── Loop principal ─────────────────────────────────────────────────────
        total = len(pacientes)

        for idx, (cpf, dados) in enumerate(pacientes.items(), start=1):
            nome_paciente = dados["nomePaciente"]
            print(f"\n[{idx}/{total}] Localizando: {nome_paciente} (CPF: {cpf})")

            try:
                # 1. Vai para a lista de pacientes
                driver.get("https://app.clinicanasnuvens.com.br/pacientes")
                time.sleep(2)
                print("  Lista de pacientes carregada.")

                # 2. Abre o filtro
                botao_filtrar = wait.until(EC.element_to_be_clickable((By.ID, "btn-drawer-filtrosearch-paciente")))
                driver.execute_script("arguments[0].click();", botao_filtrar)
                time.sleep(1)
                print("  Filtro aberto.")

                # 3. Preenche o CPF
                campo_cpf = wait.until(EC.element_to_be_clickable((By.ID, "cpf-paciente")))
                campo_cpf.clear()
                campo_cpf.send_keys(cpf)
                print(f"  CPF '{cpf}' preenchido no filtro.")

                # 4. Busca o paciente
                botao_visualizar = wait.until(EC.element_to_be_clickable((By.ID, "btn-visualizar-pacientes")))
                driver.execute_script("arguments[0].click();", botao_visualizar)
                time.sleep(2)
                print("  Busca por CPF executada.")

                # 5. Abre o perfil do paciente encontrado
                link_paciente = wait.until(EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "a[aria-label='Visualizar perfil do paciente']")
                ))
                driver.execute_script("arguments[0].click();", link_paciente)
                time.sleep(2)

                print("  Paciente localizado.")

                # 6. Abre o menu Documentos
                botao_documentos = wait.until(EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "button.nav-link.documentos")
                ))
                driver.execute_script("arguments[0].click();", botao_documentos)
                time.sleep(1)
                print("  Menu 'Documentos' aberto.")

                # 7. Seleciona "Perfis de tratamento" no menu
                item_perfis = wait.until(EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "div.menu-link.perfis-tratamento")
                ))
                driver.execute_script("arguments[0].click();", item_perfis)
                time.sleep(2)

                print("  Aba de perfis de tratamento aberta.")

                # 8. Exclui todos os perfis de tratamento do paciente
                excluidos = 0
                while True:
                    botoes_opcoes = [
                        b for b in driver.find_elements(
                            By.CSS_SELECTOR, "button[aria-label='Opções'][data-kt-menu-trigger='click']"
                        )
                        if b.is_displayed()
                    ]
                    if not botoes_opcoes:
                        print("  Nenhum perfil de tratamento restante.")
                        break

                    print(f"  {len(botoes_opcoes)} perfil(is) encontrado(s). Excluindo o próximo...")

                    botao_opcoes = botoes_opcoes[0]
                    driver.execute_script("arguments[0].click();", botao_opcoes)
                    time.sleep(0.5)
                    print("    Menu de opções aberto.")

                    link_excluir = wait.until(EC.element_to_be_clickable(
                        (By.CSS_SELECTOR, "a.menu-link.excluir")
                    ))
                    driver.execute_script("arguments[0].click();", link_excluir)
                    time.sleep(0.5)
                    print("    Opção 'Excluir' clicada, aguardando confirmação...")

                    botao_confirmar = wait.until(EC.element_to_be_clickable(
                        (By.CSS_SELECTOR, "button.confirma-exclusao-perfil-tratamento-paciente")
                    ))
                    driver.execute_script("arguments[0].click();", botao_confirmar)
                    time.sleep(1.5)

                    excluidos += 1
                    print(f"    Perfil de tratamento excluído ({excluidos}).")

                print(f"  Total de {excluidos} perfil(is) de tratamento excluído(s).")

                marcar_migrado(cpf, "sim")
                print("  Paciente migrado com sucesso.")

            except Exception as e:
                marcar_migrado(cpf, "erro")
                print(f"  ERRO ao processar '{nome_paciente}' (CPF: {cpf}): {e}")
                print("  Marcado como erro — pulando para o próximo paciente.")
                continue

        print("\nBusca de pacientes concluída!")

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
