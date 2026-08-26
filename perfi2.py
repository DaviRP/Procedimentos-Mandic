import openpyxl
import csv
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


ARQUIVO = "LISTA_PERFIL_TRATAMENTO - 2.csv"
CLINICA = "FORTALEZA - GRUPO MANDIC"


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

        driver.get("https://app.clinicanasnuvens.com.br/pacientes")
        time.sleep(3)

        # ── Loop principal ─────────────────────────────────────────────────────
        total = len(pacientes)

        for idx, (cpf, dados) in enumerate(pacientes.items(), start=1):
            nome_paciente = dados["nomePaciente"]
            print(f"\n[{idx}/{total}] Localizando: {nome_paciente} (CPF: {cpf})")

            try:
                # 1. Vai para a lista de pacientes
                driver.get("https://app.clinicanasnuvens.com.br/pacientes")
                time.sleep(2)

                # 2. Abre o filtro
                botao_filtrar = wait.until(EC.element_to_be_clickable((By.ID, "btn-drawer-filtrosearch-paciente")))
                driver.execute_script("arguments[0].click();", botao_filtrar)
                time.sleep(1)

                # 3. Preenche o CPF
                campo_cpf = wait.until(EC.element_to_be_clickable((By.ID, "cpf-paciente")))
                campo_cpf.clear()
                campo_cpf.send_keys(cpf)

                # 4. Busca o paciente
                botao_visualizar = wait.until(EC.element_to_be_clickable((By.ID, "btn-visualizar-pacientes")))
                driver.execute_script("arguments[0].click();", botao_visualizar)
                time.sleep(2)

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

                # 7. Seleciona "Perfis de tratamento" no menu
                item_perfis = wait.until(EC.element_to_be_clickable(
                    (By.CSS_SELECTOR, "div.menu-link.perfis-tratamento")
                ))
                driver.execute_script("arguments[0].click();", item_perfis)
                time.sleep(2)

                print("  Aba de perfis de tratamento aberta.")

                # 8. Cadastra cada perfil de tratamento do paciente
                for nome_perfil, perfil_info in dados["perfis"].items():
                    # Abre o modal para adicionar um novo perfil de tratamento
                    botao_novo_perfil = wait.until(EC.element_to_be_clickable((By.ID, "novoPerfilTratamento")))
                    driver.execute_script("arguments[0].click();", botao_novo_perfil)
                    time.sleep(1)
 
                    # Digita o nome do perfil no campo Tagify e seleciona a primeira opção via teclado
                    # (o Tagify seleciona no evento mousedown, então clique via JS não funciona)
                    campo_perfil = wait.until(EC.element_to_be_clickable(
                        (By.CSS_SELECTOR, "#modal-criar-perfil-tratamento-paciente .tagify__input")
                    ))
                    time.sleep(1)

                    # altera o maxItems do dropdown
                    script = """
                    (function() {
                        function ajustarTagify(el) {
                            if (el && el.__tagify && el.__tagify.settings.dropdown.maxItems !== 9999) {
                                el.__tagify.settings.dropdown.maxItems = 9999;
                                console.log('maxItems ajustado para', el.__tagify.settings.dropdown.maxItems);
                            }
                        }

                        var el = document.getElementById('perfis-tratamento-it');
                        if (!el) return 'elemento nao encontrado';

                        // tenta ajustar imediatamente, caso já esteja pronto
                        ajustarTagify(el);

                        // observa mudanças no elemento (recriação do tagify, mudança de atributos, etc)
                        var observer = new MutationObserver(function() {
                            ajustarTagify(el);
                        });
                        observer.observe(el, { attributes: true, childList: true, subtree: true });

                        // guarda o observer numa variável global pra não perder a referência
                        window.__tagifyObserver = observer;

                        return 'observer instalado';
                    })();
                    
                    """
                    time.sleep(1)

                    resultado = driver.execute_script(script)
                    print(resultado)

                    campo_perfil.click()
                    campo_perfil.send_keys(nome_perfil)
                    time.sleep(1)
                    campo_perfil.send_keys(Keys.ARROW_DOWN)
                    time.sleep(0.2)
                    campo_perfil.send_keys(Keys.RETURN)
                    time.sleep(0.5)

                    # 9. Marca os subperfis do perfil selecionado
                    subperfis_desejados = {s.strip().lower() for s in perfil_info["subperfis"]}
                    opcoes_subperfil = wait.until(EC.presence_of_all_elements_located(
                        (By.CSS_SELECTOR, "#modal-criar-perfil-tratamento-paciente [data-opcao]")
                    ))

                    marcados = 0
                    for opcao in opcoes_subperfil:
                        nome_input = opcao.find_element(By.CSS_SELECTOR, "input[type='hidden'][name$='.nome']")
                        nome_opcao = (nome_input.get_attribute("value") or "").strip().lower()

                        if nome_opcao in subperfis_desejados:
                            checkbox = opcao.find_element(By.CSS_SELECTOR, "input.check-item")
                            driver.execute_script("arguments[0].click();", checkbox)
                            marcados += 1
                            time.sleep(0.2)

                    # 10. Salva o perfil de tratamento
                    botao_salvar = wait.until(EC.element_to_be_clickable((By.ID, "btn-adicionar-perfis")))
                    driver.execute_script("arguments[0].click();", botao_salvar)
                    time.sleep(1.5)

                    print(f"  Perfil '{nome_perfil}' salvo com {marcados}/{len(subperfis_desejados)} subperfil(is).")

                marcar_migrado(cpf, "sim")
                print("  Paciente migrado com sucesso.")

            except Exception as e:
                print(f"  ERRO ao processar '{nome_paciente}' (CPF: {cpf}): {e}")

                try:
                    marcar_migrado(cpf, "erro")
                    print("  Marcado como erro no arquivo.")
                except Exception as erro_gravacao:
                    print(f"  Falha ao gravar erro no arquivo: {erro_gravacao}")

                try:
                    driver.get("https://app.clinicanasnuvens.com.br/pacientes")
                    time.sleep(2)
                    print("  De volta à lista de pacientes — indo para o próximo.")
                except Exception:
                    pass

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
