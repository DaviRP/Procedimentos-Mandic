import getpass
import openpyxl
import os
import re
import time
import threading
import traceback
import unicodedata
from io import BytesIO
from pathlib import Path
from datetime import datetime, timedelta
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait, Select
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys


# Dados em ../dados (o app troca ARQUIVO pelo banco e PASTA pela pasta de dados dele)
PASTA = Path(os.environ.get("PLANOS_DADOS") or Path(__file__).resolve().parent.parent / "dados")
PASTA_ERROS = PASTA / "erros"
ARQUIVO = PASTA / "planilhas" / "Plano_Tratamento_Convertido_brasilia.xlsx"
ABA = "Plano de Tratamento"
URL_BASE = "https://app.clinicanasnuvens.com.br"
# Login do Clínica nas Nuvens: informado ao rodar (tela Integrar do app ou pergunta no
# terminal), nunca escrito aqui
USUARIO_CNN = None
SENHA_CNN = None
URL_LISTA_AUTORIZACAO = f"{URL_BASE}/plano-tratamento/solicitacao-autorizacao/lista"
SELETOR_AUTORIZAR = "a[title='Autorizar'][href*='/plano-tratamento/negociacao/']"

COL_STATUS = "Status"
# Unidade onde o plano é cadastrado (ex.: "BRASILIA - GRUPO MANDIC"). Os pacientes
# são agrupados por clínica e o script troca de unidade entre um grupo e outro.
COL_CLINICA = "Clinica"
# Clínica usada quando a coluna não existe ou está vazia na linha.
# None = essas linhas são puladas (sem gravar Status), para nunca cadastrar na unidade errada.
CLINICA_PADRAO = None
COL_NUMERO_PLANO = "Numero do plano CNN"
# True = só cadastra as linhas com "Sim" na coluna COL_APROVADO (aprovação feita no app)
EXIGIR_APROVACAO = False
COL_APROVADO = "Aprovado"
# Qualquer um destes pula a linha: o plano já foi criado (ou deu erro) e não pode ser criado de novo
STATUS_FINALIZADOS = ("cadastrado", "autorizado", "erro autorização", "erro", "resolvido manualmente")
# Plano já cadastrado (com N° na planilha) que só precisa ser autorizado: o robô não cadastra de novo
STATUS_SO_AUTORIZAR = "aguardando autorização"

# True = logo depois de cadastrar, autoriza o plano (desconto + condições de pagamento + concluir)
AUTORIZAR_APOS_CADASTRO = True
DESCONTO_PERCENTUAL = 100
# Senha do desconto: cada unidade tem a sua, informada ao rodar (tela Integrar do app ou
# pergunta no terminal). {nome da clínica: senha}
SENHAS_DESCONTO = {}
CLINICA_ATUAL = None

# Paciente sem plano de convênio no cadastro: o campo de convênio da caixa do procedimento
# vem vazio. O robô digita este nome, pega a 1ª opção e confirma "Vincular plano"
CONVENIO_PADRAO = "GRUPO MANDIC"

LIMITE_NOME = 30
LIMITE_DESCRICAO = 150
LIMITE_QUANTIDADE = 100

# Dente marcado em todo procedimento (tipo fica em "Individual (por dente)")
DENTE_PADRAO = "89"

# Profissional do plano: tenta o Aluno, depois o Coordenador e, se nenhum der certo,
# usa o gerente da unidade abaixo
PROFISSIONAL = "Fernanda ananias"
COL_ALUNO = "Aluno Associado"
COL_COORDENADOR = "Coordenador"

# True = só imprime a estrutura de cada paciente, sem cadastrar nem gravar Status
MODO_REVISAO = False

# Quantos pacientes processar nesta execução (None = todos). Use 1 para testar.
LIMITE_PACIENTES = None

# Só cadastra as clínicas deste conjunto (None = todas). Ex.: {"BRASILIA - GRUPO MANDIC"}
FILTRO_CLINICAS = None

# True = roda sem abrir a janela do Chrome
HEADLESS = False

# Quando sinalizado (ex.: botão Parar do app), termina o paciente atual e encerra
PARAR = threading.Event()


def texto(valor):
    return str(valor).strip() if valor is not None else ""


def normalizar(valor):
    """Minúsculas, sem acentos e com espaços simples — para comparar nomes."""
    valor = unicodedata.normalize("NFKD", texto(valor))
    valor = "".join(c for c in valor if not unicodedata.combining(c))
    return re.sub(r"\s+", " ", valor).strip().lower()


def carregar_pacientes():
    """Lê a aba 'Plano de Tratamento' e monta a estrutura:

    pacientes[(Clinica, PG)] = {
        "clinica": str,
        "nomePaciente": str,
        "linhas": [nº das linhas na planilha],
        "planos": {
            <Perfil Tratamento>: {
                "linhas": [nº das linhas do plano],
                "orcamentos": [orçamentos de origem],
                "aluno": str, "coordenador": str,  # 1º valor preenchido do plano
                "procedimentos": {
                    <Procedimento>: {"especialidade": str, "quantidade": int},
                },
            },
        },
    }

    Cada Perfil Tratamento vira um plano de tratamento. Se o mesmo procedimento
    aparece mais de uma vez no plano (ex.: orçamentos diferentes com o mesmo
    perfil), as quantidades são somadas. Linhas com Status em STATUS_FINALIZADOS
    são puladas (o Status é gravado por plano).

    O PG fica junto com a clínica na chave porque o mesmo PG pode existir em
    unidades diferentes. Os pacientes voltam ordenados por clínica (mantendo a
    ordem da planilha dentro de cada uma), para trocar de unidade uma vez só.
    """
    wb = openpyxl.load_workbook(BytesIO(Path(ARQUIVO).read_bytes()), read_only=True)
    linhas = wb[ABA].iter_rows(values_only=True)
    cabecalho = [texto(c) for c in next(linhas)]
    idx = {nome: i for i, nome in enumerate(cabecalho)}

    if COL_CLINICA not in idx:
        print(f"Atenção: a planilha não tem a coluna '{COL_CLINICA}'"
              + (f" — usando '{CLINICA_PADRAO}' para todas as linhas." if CLINICA_PADRAO else
                 " e CLINICA_PADRAO = None: nenhuma linha será cadastrada."))

    pacientes = {}
    sem_clinica = []

    for num_linha, linha in enumerate(linhas, start=2):
        pg = texto(linha[idx["PG"]])
        if not pg:
            continue

        if COL_STATUS in idx and texto(linha[idx[COL_STATUS]]).lower() in STATUS_FINALIZADOS:
            continue

        if EXIGIR_APROVACAO and (COL_APROVADO not in idx or normalizar(linha[idx[COL_APROVADO]]) != "sim"):
            continue

        clinica = texto(linha[idx[COL_CLINICA]]) if COL_CLINICA in idx else ""
        clinica = clinica or texto(CLINICA_PADRAO)
        if not clinica:
            sem_clinica.append(num_linha)
            continue
        if FILTRO_CLINICAS and normalizar(clinica) not in {normalizar(c) for c in FILTRO_CLINICAS}:
            continue

        perfil = texto(linha[idx["Perfil Tratamento"]])
        procedimento = texto(linha[idx["Procedimento (sistema novo)"]])
        especialidade = texto(linha[idx["Especialidade"]])
        orcamento = texto(linha[idx["Orçamento"]])
        quantidade = int(linha[idx["Quantidade"]] or 0)
        status = texto(linha[idx[COL_STATUS]]).lower() if COL_STATUS in idx else ""
        numero = texto(linha[idx[COL_NUMERO_PLANO]]) if COL_NUMERO_PLANO in idx else ""

        chave = (clinica, pg)
        if chave not in pacientes:
            pacientes[chave] = {
                "clinica": clinica,
                "nomePaciente": texto(linha[idx["Paciente"]]),
                "linhas": [],
                "planos": {},
            }
        pacientes[chave]["linhas"].append(num_linha)

        plano = pacientes[chave]["planos"].setdefault(
            perfil, {"linhas": [], "orcamentos": [], "aluno": "", "coordenador": "", "procedimentos": {},
                     "so_autorizar": True, "numero": ""}
        )
        plano["linhas"].append(num_linha)
        plano["so_autorizar"] = plano["so_autorizar"] and status == STATUS_SO_AUTORIZAR
        plano["numero"] = plano["numero"] or numero
        if orcamento not in plano["orcamentos"]:
            plano["orcamentos"].append(orcamento)

        for chave, coluna in (("aluno", COL_ALUNO), ("coordenador", COL_COORDENADOR)):
            if not plano[chave] and coluna in idx:
                plano[chave] = texto(linha[idx[coluna]])

        proc = plano["procedimentos"].setdefault(procedimento, {"especialidade": especialidade, "quantidade": 0})
        proc["quantidade"] += quantidade

    wb.close()

    if sem_clinica and COL_CLINICA in idx:
        amostra = ", ".join(map(str, sem_clinica[:20])) + (" ..." if len(sem_clinica) > 20 else "")
        print(f"Atenção: {len(sem_clinica)} linha(s) sem '{COL_CLINICA}' foram puladas: {amostra}")

    # sorted é estável: dentro da mesma clínica, mantém a ordem da planilha
    return dict(sorted(pacientes.items(), key=lambda item: normalizar(item[0][0])))


def resumo_por_clinica(pacientes):
    """{clinica: (nº de pacientes, nº de planos)} na ordem em que serão processadas."""
    resumo = {}
    for dados in pacientes.values():
        qtd_pacientes, qtd_planos = resumo.get(dados["clinica"], (0, 0))
        resumo[dados["clinica"]] = (qtd_pacientes + 1, qtd_planos + len(dados["planos"]))
    return resumo


def marcar_status(linhas, valor, numero_plano=None):
    """Grava `valor` na coluna Status e, se informado, o nº do plano na coluna COL_NUMERO_PLANO."""
    valores = {COL_STATUS: valor}
    if numero_plano is not None:
        valores[COL_NUMERO_PLANO] = numero_plano
    gravar_colunas(linhas, valores)


def gravar_colunas(linhas, valores):
    """Grava {coluna: valor} nas linhas informadas (as colunas são criadas se não existirem)."""
    wb = openpyxl.load_workbook(ARQUIVO)
    ws = wb[ABA]

    cabecalho = [texto(c.value) for c in ws[1]]
    for coluna, valor in valores.items():
        if coluna in cabecalho:
            num_coluna = cabecalho.index(coluna) + 1
        else:
            cabecalho.append(coluna)
            num_coluna = len(cabecalho)
            ws.cell(row=1, column=num_coluna, value=coluna)

        for linha in linhas:
            ws.cell(row=linha, column=num_coluna, value=valor)

    # Salva numa cópia e só depois troca pelo original: se o script for
    # interrompido no meio do salvamento, a planilha original fica intacta.
    temporario = ARQUIVO.with_name(f"~tmp_{ARQUIVO.name}")
    wb.save(temporario)
    for tentativa in range(24):  # até ~2 minutos
        try:
            os.replace(temporario, ARQUIVO)
            return
        except PermissionError:
            if tentativa == 0:
                print("  Planilha travada (aberta no Excel?). Feche-a: tentando gravar de novo por até 2 minutos...")
            time.sleep(5)
    temporario.unlink(missing_ok=True)
    raise ErroGravacao(f"não consegui gravar em {ARQUIVO.name} (arquivo travado). "
                       f"Status que ficou sem gravar nas linhas {linhas}: {valores}")


def titulo_plano(perfil, plano):
    return f"Plano '{perfil}' (orçamentos: {', '.join(plano['orcamentos'])})"


def imprimir_paciente(pg, dados):
    print(f"  Clínica: {dados['clinica']}")
    print(f"  Paciente: {dados['nomePaciente']} (PG: {pg}) | linhas na planilha: {dados['linhas']}")
    for perfil, plano in dados["planos"].items():
        print(f"  - {titulo_plano(perfil, plano)}")
        print(f"      Aluno: {plano['aluno'] or '-'} | Coordenador: {plano['coordenador'] or '-'}")
        for procedimento, info in plano["procedimentos"].items():
            print(f"      {info['quantidade']}x {procedimento} [{info['especialidade']}]")


def imprimir_amostra(pacientes, quantidade=10):
    for i, ((_, pg), dados) in enumerate(pacientes.items()):
        if i >= quantidade:
            break

        print()
        imprimir_paciente(pg, dados)


def tamanho_textarea(valor):
    # Por segurança, conta a quebra de linha como 2 caracteres (\r\n) no maxlength
    return len(valor) + valor.count("\n")


def montar_descricao(perfil, plano):
    """Título do plano + procedimentos, cabendo em LIMITE_DESCRICAO caracteres.

    Tenta com a especialidade; se não couber, sem ela; se ainda não couber, corta com '…'.
    """
    for com_especialidade in (True, False):
        linhas = [titulo_plano(perfil, plano)]
        for procedimento, info in plano["procedimentos"].items():
            linha = f"{info['quantidade']}x {procedimento}"
            if com_especialidade:
                linha += f" [{info['especialidade']}]"
            linhas.append(linha)

        descricao = "\n".join(linhas)
        if tamanho_textarea(descricao) <= LIMITE_DESCRICAO:
            return descricao

    while tamanho_textarea(descricao + "…") > LIMITE_DESCRICAO:
        descricao = descricao[:-1]
    return descricao.rstrip() + "…"


def formatar_duracao(segundos):
    segundos = int(segundos)
    horas, resto = divmod(segundos, 3600)
    minutos, segundos = divmod(resto, 60)
    return f"{horas:02d}:{minutos:02d}:{segundos:02d}"


def relogio_previsao(progresso, parar, intervalo=60):
    """A cada `intervalo` segundos, imprime o tempo restante estimado para terminar."""
    while not parar.wait(intervalo):
        concluidos = progresso["concluidos"]
        total = progresso["total"]
        decorrido = time.time() - progresso["inicio"]

        if concluidos == 0:
            print(f"\n⏱  [{formatar_duracao(decorrido)} decorrido] Calculando previsão...")
            continue

        media = decorrido / concluidos
        restante = media * (total - concluidos)
        termino = datetime.now() + timedelta(seconds=restante)
        print(
            f"\n⏱  {concluidos}/{total} pacientes | média {media:.1f}s/paciente | "
            f"restante: {formatar_duracao(restante)} | término previsto: {termino:%d/%m %H:%M}"
        )


def salvar_print_erro(driver, nome):
    try:
        PASTA_ERROS.mkdir(exist_ok=True)
        nome = re.sub(r"[^\w\-]+", "_", nome)
        driver.save_screenshot(str(PASTA_ERROS / f"{nome}.png"))
        print(f"  Screenshot salvo em {PASTA_ERROS / (nome + '.png')}")
    except Exception:
        pass


# ── Passos na plataforma ───────────────────────────────────────────────────────

def clicar(driver, elemento):
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    driver.execute_script("arguments[0].click();", elemento)


def clicar_mouse(driver, elemento):
    """Clique 'real' (mousedown/mouseup/click) — necessário para select2 e autocomplete."""
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", elemento)
    ActionChains(driver).move_to_element(elemento).pause(0.2).click(elemento).perform()


def selecionar_clinica(driver, wait, clinica):
    """Topo > clínica selecionada > busca `clinica` > escolhe a opção e confere a troca.

    Prefere a opção com o nome exato; se só houver opções que contêm o nome e forem
    mais de uma, falha em vez de chutar (ex.: 'BRASILIA' x 'BRASILIA SUL').
    """
    botao = wait.until(EC.presence_of_element_located((By.ID, "clinica-selecionada")))
    if normalizar(clinica) in normalizar(botao.get_attribute("textContent")):
        print(f"  Clínica '{clinica}' já está selecionada.")
        return

    ActionChains(driver).move_to_element(botao).click(botao).perform()
    time.sleep(1)

    campo_busca = wait.until(EC.element_to_be_clickable(
        (By.XPATH, "//input[@placeholder='Pesquisar clínica']")
    ))
    campo_busca.click()
    campo_busca.clear()
    campo_busca.send_keys(clinica)
    time.sleep(2)

    def opcoes_compativeis(d):
        opcoes = [
            (normalizar(texto(o.get_attribute("textContent")).split("\n")[0]), o)
            for o in d.find_elements(By.CSS_SELECTOR, "a.trocar-clinica")
        ]
        return [(t, o) for t, o in opcoes if normalizar(clinica) in t] or False

    try:
        compativeis = WebDriverWait(driver, 15).until(opcoes_compativeis)
    except TimeoutException:
        raise Exception(f"clínica '{clinica}' não encontrada na lista de clínicas")

    exatas = [o for t, o in compativeis if t == normalizar(clinica)]
    if exatas:
        opcao = exatas[0]
    elif len(compativeis) == 1:
        opcao = compativeis[0][1]
    else:
        raise Exception(f"mais de uma clínica corresponde a '{clinica}': {[t for t, _ in compativeis][:5]}")

    print(f"  Selecionando a clínica: {texto(opcao.get_attribute('textContent')).split(chr(10))[0]}")
    driver.execute_script("arguments[0].click();", opcao)
    time.sleep(5)

    driver.get(f"{URL_BASE}/pacientes")
    time.sleep(3)

    # Confere a troca: o topo deve mostrar a clínica escolhida
    try:
        WebDriverWait(driver, 15).until(lambda d: normalizar(clinica) in normalizar(
            d.find_element(By.ID, "clinica-selecionada").get_attribute("textContent")
        ))
    except TimeoutException:
        atual = normalizar(driver.find_element(By.ID, "clinica-selecionada").get_attribute("textContent"))
        raise Exception(f"a clínica não foi trocada para '{clinica}' (topo mostra '{atual}')")


def localizar_paciente(driver, wait, pg):
    """Passo 1: filtra a lista de pacientes pelo PG e devolve a URL do perfil do paciente."""
    driver.get(f"{URL_BASE}/pacientes")
    time.sleep(2)

    clicar(driver, wait.until(EC.element_to_be_clickable((By.ID, "btn-drawer-filtrosearch-paciente"))))
    time.sleep(1)

    campo_pg = wait.until(EC.element_to_be_clickable((By.ID, "pesquisa-numero-controle")))
    campo_pg.clear()
    campo_pg.send_keys(pg)

    # A lista já vem preenchida: guarda o 1º resultado atual para esperar ele ser substituído
    seletor_link = (By.CSS_SELECTOR, "a[aria-label='Visualizar perfil do paciente']")
    antigos = driver.find_elements(*seletor_link)

    clicar(driver, wait.until(EC.element_to_be_clickable((By.ID, "btn-visualizar-pacientes"))))

    if antigos:
        try:
            wait.until(EC.staleness_of(antigos[0]))
        except TimeoutException:
            pass
    time.sleep(2)

    try:
        wait.until(EC.presence_of_element_located(seletor_link))
    except TimeoutException:
        raise Exception(f"paciente com PG {pg} não encontrado")

    links = driver.find_elements(*seletor_link)
    if len(links) > 1:
        print(f"  Atenção: {len(links)} pacientes com o PG {pg} — usando o primeiro.")

    return links[0].get_attribute("href")


def abrir_novo_plano(driver, wait, url_paciente):
    """Passo 2: abre o paciente > Comercial > Planos de tratamento > Adicionar plano."""
    driver.get(url_paciente)
    time.sleep(2)

    comercial = wait.until(EC.presence_of_element_located(
        (By.XPATH, "//span[contains(@class,'menu-title') and normalize-space()='Comercial']")
    ))
    clicar(driver, comercial)
    time.sleep(1)

    item_planos = wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "div.menu-link.planos-tratamento")))
    clicar(driver, item_planos)
    time.sleep(2)

    botao_novo = wait.until(EC.presence_of_element_located(
        (By.CSS_SELECTOR, "a[href*='/plano-tratamento/novo/']")
    ))
    clicar(driver, botao_novo)

    wait.until(EC.element_to_be_clickable((By.ID, "pti-nome")))
    time.sleep(1)


def selecionar_profissional(driver, wait, plano):
    """Tenta o Aluno, depois o Coordenador e, por último, o PROFISSIONAL fixo (gerente)."""
    campo = wait.until(EC.element_to_be_clickable((By.ID, "pbv-profissional")))

    candidatos = [("Aluno", plano["aluno"]), ("Coordenador", plano["coordenador"])]
    for papel, nome in candidatos:
        if not nome:
            print(f"    {papel}: vazio na planilha — pulando.")
            continue
        print(f"    Tentando {papel}: {nome}")
        try:
            valor = selecionar_autocomplete(driver, campo, nome, exigir_nome=True, tentativas=2)
            print(f"    Profissional ({papel}): {valor}")
            return
        except Exception as e:
            print(f"    {papel} '{nome}' não selecionado ({resumo_erro(e)}) — tentando o próximo.")

    valor = selecionar_autocomplete(driver, campo, PROFISSIONAL, preferir_exato=False)
    print(f"    Profissional (gerente da unidade): {valor}")


def preencher_cabecalho(driver, wait, nome, descricao, plano):
    """Passo 3: nome (máx. 30), descrição (máx. 150) e profissional do plano."""
    campo_nome = wait.until(EC.element_to_be_clickable((By.ID, "pti-nome")))
    campo_nome.clear()
    campo_nome.send_keys(nome[:LIMITE_NOME])

    campo_descricao = driver.find_element(By.ID, "pti-descricao")
    campo_descricao.clear()
    campo_descricao.send_keys(descricao)

    tamanho = len(campo_descricao.get_attribute("value") or "")
    if tamanho > LIMITE_DESCRICAO:
        raise Exception(f"descrição com {tamanho} caracteres (limite {LIMITE_DESCRICAO})")

    selecionar_profissional(driver, wait, plano)


def campo_procedimento_vazio(driver):
    campos = [
        c for c in driver.find_elements(By.CSS_SELECTOR, "input.tipo-procedimento")
        if c.is_displayed() and not c.get_attribute("value")
    ]
    return campos[-1] if campos else False


def container_do_campo(campo):
    """Caixa (modal) onde está o campo do procedimento; se não for modal, o form."""
    for xpath in ("./ancestor::div[contains(concat(' ', @class, ' '), ' modal ')][1]", "./ancestor::form[1]"):
        encontrados = campo.find_elements(By.XPATH, xpath)
        if encontrados:
            return encontrados[0]
    raise Exception("caixa do procedimento não encontrada")


def itens_autocomplete(driver):
    return [
        li for li in driver.find_elements(By.CSS_SELECTOR, "ul.ui-autocomplete li.ui-menu-item")
        if li.is_displayed()
    ]


def resumo_erro(e):
    """Tipo + 1ª linha da mensagem (as do Selenium trazem um stacktrace enorme)."""
    mensagem = texto(getattr(e, "msg", None) or e).split("\n")[0]
    return f"{type(e).__name__}: {mensagem}" if mensagem else type(e).__name__


def digitar_no_campo(driver, campo, valor):
    """Foca, limpa e digita no campo; se o clique for bloqueado (algo por cima), foca via JS."""
    driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", campo)
    try:
        campo.click()
    except Exception:
        driver.execute_script("arguments[0].focus();", campo)
    campo.clear()
    campo.send_keys(valor)


def selecionar_autocomplete(driver, campo, nome, preferir_exato=True, tentativas=3, exigir_nome=False):
    """Digita `nome` num campo autocomplete e escolhe a opção.

    Com `preferir_exato`, prefere a opção com o nome exato; senão pega a primeira.
    Com `exigir_nome`, só aceita opção que contenha o nome digitado (senão falha,
    em vez de pegar outra pessoa qualquer).
    Tenta primeiro com clique do mouse e, se não 'grudar', pelo teclado
    (seta para baixo + Enter).
    """
    for tentativa in range(1, tentativas + 1):
        try:
            digitar_no_campo(driver, campo, nome)
        except Exception as e:
            print(f"    Tentativa {tentativa}: não consegui digitar '{nome}' no campo ({resumo_erro(e)}).")
            time.sleep(2)
            continue

        try:
            WebDriverWait(driver, 20).until(lambda d: itens_autocomplete(d) or False)
        except TimeoutException:
            print(f"    Tentativa {tentativa}: nenhuma opção apareceu para '{nome}'.")
            continue
        time.sleep(1)  # espera a lista terminar de carregar

        itens = itens_autocomplete(driver)
        if not itens:
            continue

        textos = [texto(li.text).split("\n")[0] for li in itens]
        posicao = 0
        if exigir_nome:
            compativeis = [i for i, t in enumerate(textos) if normalizar(nome) in normalizar(t)]
            if not compativeis:
                raise Exception(f"nenhuma opção corresponde a '{nome}' (opções: {textos[:5]})")
            exatos = [i for i in compativeis if normalizar(textos[i]) == normalizar(nome)]
            posicao = (exatos or compativeis)[0]
        elif preferir_exato:
            posicao = next((i for i, t in enumerate(textos) if normalizar(t) == normalizar(nome)), 0)
        escolhido = textos[posicao]

        try:
            if tentativa == 1:
                clicar_mouse(driver, itens[posicao])
            else:
                for _ in range(posicao + 1):
                    campo.send_keys(Keys.ARROW_DOWN)
                    time.sleep(0.2)
                campo.send_keys(Keys.RETURN)
        except Exception as e:
            print(f"    Tentativa {tentativa}: falha ao clicar na opção ({e}).")
            continue
        time.sleep(1)

        valor = texto(campo.get_attribute("value"))
        if valor and not itens_autocomplete(driver):
            if normalizar(valor) != normalizar(nome):
                print(f"    Atenção: selecionado '{valor}' para '{nome}'.")
            return valor

        print(f"    Tentativa {tentativa}: opção '{escolhido}' não ficou selecionada.")

    raise Exception(f"não foi possível selecionar '{nome}'")


def preencher_quantidade(driver, caixa, quantidade):
    """Preenche o campo de quantidade da caixa do procedimento (máx. LIMITE_QUANTIDADE)."""
    if not 1 <= quantidade <= LIMITE_QUANTIDADE:
        raise Exception(f"quantidade {quantidade} fora do limite (1 a {LIMITE_QUANTIDADE})")

    campo = WebDriverWait(driver, 10).until(lambda d: next(
        (c for c in caixa.find_elements(By.CSS_SELECTOR, "input.quantidade-atendimentos") if c.is_displayed()),
        False,
    ))

    campo.click()
    driver.execute_script("arguments[0].select();", campo)
    campo.send_keys(Keys.BACKSPACE)
    campo.send_keys(str(quantidade))
    time.sleep(0.3)

    # Plano B: grava direto no campo e dispara os eventos
    if texto(campo.get_attribute("value")) != str(quantidade):
        driver.execute_script("""
            arguments[0].value = arguments[1];
            arguments[0].dispatchEvent(new Event('input', {bubbles: true}));
            arguments[0].dispatchEvent(new Event('change', {bubbles: true}));
        """, campo, str(quantidade))
        time.sleep(0.3)

    if texto(campo.get_attribute("value")) != str(quantidade):
        raise Exception(f"não foi possível preencher a quantidade {quantidade} (campo ficou '{campo.get_attribute('value')}')")


def dentes_marcados(caixa):
    """Dentes já escolhidos no select2 múltiplo de dentes da caixa."""
    return [texto(c.get_attribute("textContent")).replace("×", "").strip()
            for c in caixa.find_elements(By.CSS_SELECTOR, ".select2-selection.dentes li.select2-selection__choice")]


def selecionar_dente(driver, caixa, dente=DENTE_PADRAO):
    """Mantém 'Individual (por dente)' e marca o dente: digita no campo de dentes e pega a 1ª opção."""
    if dente in dentes_marcados(caixa):
        return

    busca = WebDriverWait(driver, 10).until(lambda d: next(
        (c for c in caixa.find_elements(By.CSS_SELECTOR, ".select2-selection.dentes textarea.select2-search__field")
         if c.is_displayed()),
        False,
    ))

    for tentativa in (1, 2):
        try:
            clicar_mouse(driver, busca)
            busca.send_keys(dente)
            opcao = WebDriverWait(driver, 5).until(lambda d: next(
                (o for o in d.find_elements(By.CSS_SELECTOR, ".select2-container--open .select2-results__option")
                 if o.is_displayed() and o.get_attribute("aria-disabled") != "true"
                 and "loading-results" not in (o.get_attribute("class") or "")
                 and "select2-results__message" not in (o.get_attribute("class") or "")),
                False,
            ))
            if tentativa == 1:
                clicar_mouse(driver, opcao)
            else:
                busca.send_keys(Keys.RETURN)
            time.sleep(0.5)
        except TimeoutException:
            print(f"    Tentativa {tentativa}: nenhuma opção apareceu para o dente {dente}.")
        if dente in dentes_marcados(caixa):
            return
        driver.execute_script("arguments[0].value = '';", busca)  # sem Esc: pode fechar a janela do plano

    # Plano B: marca direto no <select> escondido e dispara o change
    ok = driver.execute_script("""
        var select = arguments[0].querySelector('select.dentes');
        if (!select) return false;
        for (var i = 0; i < select.options.length; i++) {
            var opcao = select.options[i];
            if (opcao.text.trim() === arguments[1] || opcao.value === arguments[1]) {
                var valores = window.jQuery ? (jQuery(select).val() || []) : [];
                valores.push(opcao.value);
                if (window.jQuery) { jQuery(select).val(valores).trigger('change'); }
                else { opcao.selected = true; select.dispatchEvent(new Event('change', {bubbles: true})); }
                return true;
            }
        }
        return false;
    """, caixa, dente)
    time.sleep(0.5)

    if not ok or dente not in dentes_marcados(caixa):
        raise Exception(f"não foi possível marcar o dente {dente}")


def vincular_convenio_se_vazio(driver, caixa, espera=2):
    """Paciente sem convênio: o campo 'paciente-convenio' da caixa vem vazio. Digita
    CONVENIO_PADRAO, escolhe a 1ª opção e confirma 'Vincular plano' no pop-up que abre.
    Com o convênio já preenchido (ou sem o campo na caixa), não faz nada."""
    try:
        campo = visivel(driver, "input.paciente-convenio", raiz=caixa, timeout=espera)
    except TimeoutException:
        return
    if texto(campo.get_attribute("value")):
        return

    print(f"    Paciente sem convênio: vinculando '{CONVENIO_PADRAO}'")
    selecionar_autocomplete(driver, campo, CONVENIO_PADRAO, preferir_exato=False)

    try:
        botao = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.ID, "btn-vincular-convenio-paciente-agenda")))
    except TimeoutException:
        print("    Atenção: o pop-up 'Vincular plano' não apareceu — seguindo com o convênio selecionado.")
        return
    clicar(driver, botao)
    esperar_sumir(driver, botao, "o pop-up 'Vincular plano' não fechou após confirmar")
    time.sleep(1)

    if not texto(campo.get_attribute("value")):
        raise Exception(f"o convênio '{CONVENIO_PADRAO}' não ficou preenchido após vincular")


def salvar_caixa(driver, caixa, campo):
    botoes = [
        b for b in caixa.find_elements(By.CSS_SELECTOR, "button[type='submit']")
        if b.is_displayed() and b.get_attribute("id") != "salvar-novo-plano" and "Salvar" in b.text
    ]
    if not botoes:
        raise Exception("botão Salvar do procedimento não encontrado")

    clicar(driver, botoes[-1])

    # A caixa fecha quando o procedimento é salvo
    try:
        WebDriverWait(driver, 10).until(lambda d: not campo.is_displayed())
    except TimeoutException:
        raise Exception("a caixa do procedimento não fechou após salvar (erro de validação?)")
    except Exception:
        pass  # campo removido da página = salvo
    time.sleep(0.5)


def adicionar_procedimento(driver, wait, nome, quantidade):
    """Adicionar > Adicionar procedimento > busca > quantidade > dente (Individual por dente) > Salvar."""
    botao_adicionar = wait.until(EC.element_to_be_clickable(
        (By.XPATH, "//button[@data-kt-menu-trigger='click' and contains(normalize-space(.),'Adicionar')]")
    ))
    clicar_mouse(driver, botao_adicionar)

    # Espera o menu abrir; se o clique do mouse não abriu, tenta via JS
    try:
        opcao = WebDriverWait(driver, 3).until(EC.visibility_of_element_located((By.ID, "adicionar-procedimento-geral")))
    except TimeoutException:
        clicar(driver, botao_adicionar)
        time.sleep(0.5)
        opcao = driver.find_element(By.ID, "adicionar-procedimento-geral")

    clicar(driver, opcao)

    campo = WebDriverWait(driver, 10).until(campo_procedimento_vazio)
    caixa = container_do_campo(campo)
    time.sleep(0.5)

    vincular_convenio_se_vazio(driver, caixa)
    selecionar_autocomplete(driver, campo, nome)
    vincular_convenio_se_vazio(driver, caixa, espera=1)  # caso o campo só apareça depois do procedimento
    preencher_quantidade(driver, caixa, quantidade)
    selecionar_dente(driver, caixa)
    salvar_caixa(driver, caixa, campo)


def salvar_plano(driver, wait):
    url_antes = driver.current_url
    clicar(driver, wait.until(EC.element_to_be_clickable((By.ID, "salvar-novo-plano"))))

    try:
        WebDriverWait(driver, 20).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("o plano não foi salvo (a página não saiu do cadastro)")
    time.sleep(1)


def cadastrar_plano(driver, wait, url_paciente, perfil, plano):
    abrir_novo_plano(driver, wait, url_paciente)
    preencher_cabecalho(driver, wait, perfil, montar_descricao(perfil, plano), plano)

    for procedimento, info in plano["procedimentos"].items():
        print(f"    + {info['quantidade']}x {procedimento}")
        adicionar_procedimento(driver, wait, procedimento, info["quantidade"])

    salvar_plano(driver, wait)


# ── Nº do plano e autorização ──────────────────────────────────────────────────

def linhas_da_tabela(driver):
    """(N° plano, Nome) de cada linha da lista de planos do paciente."""
    linhas = driver.find_elements(
        By.XPATH, "//table[.//th[contains(normalize-space(), 'plano')]]/tbody/tr"
    )
    resultado = []
    for linha in linhas:
        celulas = linha.find_elements(By.TAG_NAME, "td")
        if len(celulas) >= 2 and re.fullmatch(r"\d+", texto(celulas[0].text)):
            resultado.append((int(texto(celulas[0].text)), texto(celulas[1].text)))
    return resultado


def numeros_na_tabela(driver):
    """Números da coluna 'N° plano' da lista de planos do paciente."""
    return [numero for numero, _ in linhas_da_tabela(driver)]


def capturar_numero_plano(driver, wait, perfil=None):
    """Depois de salvar: devolve o N° plano recém-criado (o maior da lista de planos do paciente).

    Não clica em nada: alguns segundos depois de salvar o sistema vai sozinho para a lista
    de planos do paciente.
    """
    print("    Aguardando a lista de planos do paciente...")
    try:
        WebDriverWait(driver, 30).until(lambda d: numeros_na_tabela(d) or False)
    except TimeoutException:
        raise Exception("a lista de planos do paciente não apareceu depois de salvar")

    linhas = linhas_da_tabela(driver)
    numero, nome = max(linhas)
    if perfil and normalizar(nome) != normalizar(perfil):
        print(f"    Atenção: o maior N° plano da lista ({numero}) se chama '{nome}', "
              f"e não '{perfil}'.")
    return numero


def visivel(driver, seletor, raiz=None, timeout=15):
    """Espera e devolve o primeiro elemento visível que casa com o seletor CSS."""
    raiz = raiz or driver
    return WebDriverWait(driver, timeout).until(lambda d: next(
        (e for e in raiz.find_elements(By.CSS_SELECTOR, seletor) if e.is_displayed()),
        False,
    ))


def botao_submit(driver, rotulo, perto_de=None, timeout=10):
    """Botão submit visível com o `rotulo` no texto.

    Procura primeiro no form/modal/canvas de `perto_de`; se não achar, na página toda.
    """
    raizes = []
    if perto_de is not None:
        raizes += perto_de.find_elements(By.XPATH, (
            "./ancestor::*[self::form or contains(concat(' ', @class, ' '), ' modal ')"
            " or contains(@class, 'offcanvas') or contains(@class, 'drawer')][1]"
        ))
    raizes.append(driver)

    def procurar(d):
        for raiz in raizes:
            botoes = [
                b for b in raiz.find_elements(By.CSS_SELECTOR, "button[type='submit']")
                if b.is_displayed() and normalizar(rotulo) in normalizar(b.text)
            ]
            if botoes:
                return botoes[-1]
        return False

    try:
        return WebDriverWait(driver, timeout).until(procurar)
    except TimeoutException:
        raise Exception(f"botão '{rotulo}' não encontrado")


def esperar_sumir(driver, elemento, mensagem, timeout=15):
    try:
        WebDriverWait(driver, timeout).until(lambda d: not elemento.is_displayed())
    except TimeoutException:
        raise Exception(mensagem)
    except Exception:
        pass  # elemento removido da página = sumiu


def confirmar_alerta_se_houver(driver, timeout=2):
    """Se aparecer um alerta de confirmação (SweetAlert), clica em confirmar."""
    try:
        botao = visivel(driver, ".swal2-confirm", timeout=timeout)
        clicar(driver, botao)
        time.sleep(1)
    except TimeoutException:
        pass


def ler_numero(valor):
    """'1.234,56' / '1,234.56' / '100.00' -> float (o último separador é o decimal)."""
    valor = re.sub(r"[^\d,.]", "", texto(valor))
    if not valor:
        return None
    posicao = max(valor.rfind(","), valor.rfind("."))
    if posicao == -1:
        return float(valor)
    inteiro = re.sub(r"\D", "", valor[:posicao]) or "0"
    decimal = re.sub(r"\D", "", valor[posicao + 1:])
    return float(f"{inteiro}.{decimal}")


def preencher_valor(driver, campo, numero):
    """Preenche um campo com máscara de dinheiro e confere o valor final.

    Máscaras de dinheiro às vezes tratam os dígitos como centavos ('100' vira 1,00),
    então tenta algumas formas de digitar até o campo mostrar o número certo.
    """
    for digitado in (f"{numero}", f"{numero}00", f"{numero},00", f"{numero}.00"):
        campo.click()
        driver.execute_script("arguments[0].select();", campo)
        campo.send_keys(Keys.BACKSPACE)
        campo.send_keys(digitado)
        time.sleep(0.3)

        if ler_numero(campo.get_attribute("value")) == float(numero):
            return

    raise Exception(f"não foi possível preencher o valor {numero} (campo ficou '{campo.get_attribute('value')}')")


def buscar_solicitacao(driver, numero, tentativas=3):
    """Lista de solicitações > filtro rápido 'N° plano' = numero > Pesquisar.

    Devolve a URL de 'Autorizar' da linha desse plano. Tenta de novo algumas vezes,
    porque a solicitação pode demorar um pouco para aparecer depois do cadastro.
    """
    numero = re.sub(r"\.0+$", "", texto(numero))  # 1234.0 (célula numérica do Excel) -> 1234
    for tentativa in range(1, tentativas + 1):
        driver.get(URL_LISTA_AUTORIZACAO)

        tipo = WebDriverWait(driver, 15).until(EC.presence_of_element_located((By.ID, "tipo-filtro-rapido")))
        try:
            Select(tipo).select_by_value("NUMERO_PLANO")
        except Exception:
            pass
        if tipo.get_attribute("value") != "NUMERO_PLANO":
            # Plano B: seleciona direto no <select> e dispara o change
            driver.execute_script("""
                arguments[0].value = 'NUMERO_PLANO';
                if (window.jQuery) { jQuery(arguments[0]).trigger('change'); }
                else { arguments[0].dispatchEvent(new Event('change', {bubbles: true})); }
            """, tipo)
        if tipo.get_attribute("value") != "NUMERO_PLANO":
            raise Exception("não foi possível escolher 'N° plano' no filtro rápido")
        time.sleep(0.5)

        # Com 'N° plano' escolhido, a busca usa o campo numérico codPlano (não o de paciente)
        try:
            campo = visivel(driver, "#codigoPlano-filtro-rapido", timeout=5)
            digitar_no_campo(driver, campo, str(numero))
        except TimeoutException:
            # Plano B: o campo não ficou visível; preenche direto no input e dispara os eventos
            campo = driver.find_element(By.ID, "codigoPlano-filtro-rapido")
            driver.execute_script("""
                arguments[0].value = arguments[1];
                arguments[0].dispatchEvent(new Event('input', {bubbles: true}));
                arguments[0].dispatchEvent(new Event('change', {bubbles: true}));
            """, campo, str(numero))
        time.sleep(0.5)
        if texto(campo.get_attribute("value")) != str(numero):
            raise Exception(f"o N° do plano não entrou na busca (campo ficou '{campo.get_attribute('value')}')")

        links_antes = driver.find_elements(By.CSS_SELECTOR, SELETOR_AUTORIZAR)
        url_antes = driver.current_url
        clicar(driver, botao_submit(driver, "Pesquisar", perto_de=campo))

        # Espera a lista recarregar com o filtro
        try:
            WebDriverWait(driver, 15).until(
                lambda d: d.current_url != url_antes or (links_antes and not links_antes[0].is_displayed())
            )
        except TimeoutException:
            pass
        except Exception:
            pass  # link antigo removido da página = recarregou
        time.sleep(1.5)

        links = driver.find_elements(By.CSS_SELECTOR, SELETOR_AUTORIZAR)
        da_linha = [
            l for l in links
            if re.search(rf"\b{numero}\b", l.find_element(By.XPATH, "./ancestor::tr[1]").text)
        ]
        if da_linha:
            return da_linha[0].get_attribute("href")
        if len(links) == 1:
            print(f"    Atenção: a linha não mostra o nº {numero}, mas o filtro trouxe só 1 solicitação — usando ela.")
            return links[0].get_attribute("href")

        print(f"    Tentativa {tentativa}: solicitação do plano {numero} não encontrada ({len(links)} na lista).")
        time.sleep(3)

    raise Exception(f"solicitação de autorização do plano {numero} não encontrada")


def aplicar_desconto(driver, wait):
    """Adicionar desconto/acréscimo > marcar todos > % > 100 > Aplicar > senha > Salvar.

    Nem todo plano tem a opção de desconto; se ela não aparecer, pula esta etapa.
    """
    try:
        botao_desconto = WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, "a.adicionar-desconto-acrescimo"))
        )
    except TimeoutException:
        print("    Atenção: sem opção de desconto neste plano — seguindo sem desconto.")
        return
    print(f"    Aplicando desconto de {DESCONTO_PERCENTUAL}%")
    clicar(driver, botao_desconto)
    time.sleep(1)

    marcar_todos = wait.until(EC.presence_of_element_located((By.ID, "check-desconto-acrescimo")))
    if not marcar_todos.is_selected():
        clicar(driver, marcar_todos)
        time.sleep(0.5)
    if not marcar_todos.is_selected():
        raise Exception("não foi possível marcar todos os itens do desconto")

    tipo_valor = visivel(driver, "select.rp-tipo-valor")
    Select(tipo_valor).select_by_value("RELATIVO")
    time.sleep(0.5)

    campo_valor = visivel(driver, "input.rp-valor")
    preencher_valor(driver, campo_valor, DESCONTO_PERCENTUAL)

    clicar(driver, visivel(driver, "a.aplicar-desconto-acrescimo"))
    time.sleep(1)

    # A senha nem sempre é pedida: pode aparecer depois de Aplicar, depois de Salvar ou nunca
    if not preencher_senha_se_pedida(driver):
        clicar(driver, botao_salvar_modal(driver, campo_valor))
        confirmar_alerta_se_houver(driver)
        preencher_senha_se_pedida(driver)

    esperar_sumir(driver, campo_valor, "o desconto não foi salvo (senha ou validação?)")
    time.sleep(1.5)


def senha_desconto(clinica=None):
    """Senha do desconto da unidade (a atual, se não informada)."""
    clinica = clinica or CLINICA_ATUAL
    senhas = {normalizar(c): s for c, s in SENHAS_DESCONTO.items() if s}
    if normalizar(clinica) not in senhas:
        raise Exception(f"a senha do desconto da unidade '{clinica}' não foi informada")
    return senhas[normalizar(clinica)]


def pedir_senhas_desconto(clinicas):
    """Pergunta no terminal a senha do desconto de cada unidade que ainda não tem."""
    for clinica in clinicas:
        while not any(normalizar(c) == normalizar(clinica) and s for c, s in SENHAS_DESCONTO.items()):
            SENHAS_DESCONTO[clinica] = getpass.getpass(f"Senha do desconto — {clinica}: ")


def preencher_senha_se_pedida(driver, timeout=3):
    """Se o campo de senha do desconto aparecer, preenche e salva. Devolve True se fez isso."""
    try:
        campo_senha = visivel(driver, "#senha-desc-acresc", timeout=timeout)
    except TimeoutException:
        return False
    senha = senha_desconto()
    print("    Preenchendo a senha do desconto")
    campo_senha.clear()
    campo_senha.send_keys(senha)
    clicar(driver, botao_submit(driver, "Salvar", perto_de=campo_senha))
    confirmar_alerta_se_houver(driver)
    esperar_sumir(driver, campo_senha, "a senha do desconto não foi aceita")
    return True


def botao_salvar_modal(driver, dentro_de, timeout=10):
    """Botão/link visível 'Salvar' no mesmo modal do elemento `dentro_de`."""
    modais = dentro_de.find_elements(By.XPATH, "./ancestor::*[contains(concat(' ', @class, ' '), ' modal ')][1]")
    modal = modais[0] if modais else driver
    try:
        return WebDriverWait(driver, timeout).until(lambda d: next(
            (b for b in modal.find_elements(By.CSS_SELECTOR, "button, a")
             if b.is_displayed() and normalizar(b.text) == "salvar"),
            False,
        ))
    except TimeoutException:
        raise Exception("botão 'Salvar' do desconto não encontrado")


def limpar_condicoes_pagamento(driver, wait):
    """Definir condições de pagamento > Excluir parcelas > Salvar."""
    print("    Limpando as condições de pagamento")
    clicar(driver, wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, "a.definir-condicoes-pagamento"))))
    time.sleep(1)

    botao_excluir = visivel(driver, "a.limpar-parcelas")
    clicar(driver, botao_excluir)
    time.sleep(0.5)
    confirmar_alerta_se_houver(driver)

    botao_salvar = botao_submit(driver, "Salvar", perto_de=botao_excluir)
    clicar(driver, botao_salvar)
    confirmar_alerta_se_houver(driver)
    esperar_sumir(driver, botao_salvar, "as condições de pagamento não foram salvas")
    time.sleep(1.5)


def concluir_negociacao(driver):
    """Clica em Concluir e espera sair da tela de negociação."""
    print("    Concluindo")
    url_antes = driver.current_url
    clicar(driver, botao_submit(driver, "Concluir"))
    confirmar_alerta_se_houver(driver)

    try:
        WebDriverWait(driver, 30).until(lambda d: d.current_url != url_antes)
    except TimeoutException:
        raise Exception("o plano não foi concluído (a página não saiu da negociação)")
    time.sleep(1)


def autorizar_plano(driver, wait, numero):
    """Busca a solicitação pelo nº do plano e faz a autorização (mesmos passos do Autorizador)."""
    print(f"    Buscando a solicitação de autorização do plano {numero}")
    url = buscar_solicitacao(driver, numero)

    print("    Abrindo a negociação")
    driver.get(url)
    time.sleep(2)

    aplicar_desconto(driver, wait)
    limpar_condicoes_pagamento(driver, wait)
    concluir_negociacao(driver)


class ErroLogin(Exception):
    """Login recusado: não adianta tentar de novo com as mesmas credenciais."""


class ErroGravacao(Exception):
    """Não foi possível gravar o Status na planilha. A execução para: reiniciar sem o
    Status gravado cadastraria de novo, no sistema, planos que já foram criados."""


def campo_senha_visivel(driver):
    """O campo de senha visível e habilitado da página (ou False)."""
    return next((
        e for e in driver.find_elements(By.CSS_SELECTOR, "input[type='password']")
        if e.is_displayed() and e.is_enabled()
    ), False)


def fazer_login(driver, wait):
    """Login em duas variações de tela:

    1. depois do usuário, o campo de senha aparece na mesma tela;
    2. depois do usuário, abre outra tela (página ou aba) com #password e o botão #next "Entrar".
    """
    if not USUARIO_CNN or not SENHA_CNN:
        raise ErroLogin("informe o usuário e a senha do Clínica nas Nuvens")

    campo_email = wait.until(EC.presence_of_element_located(
        (By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[1]/input")
    ))
    campo_email.send_keys(USUARIO_CNN)
    url_antes = driver.current_url
    abas_antes = set(driver.window_handles)
    driver.find_element(By.XPATH, "/html/body/div[1]/div/div[2]/div[1]/div/div[3]/form/div[2]/button").click()

    def senha_apareceu(d):
        novas = set(d.window_handles) - abas_antes
        if novas:  # a tela de senha abriu numa aba nova
            d.switch_to.window(novas.pop())
        return campo_senha_visivel(d)

    try:
        campo_senha = WebDriverWait(driver, 30).until(senha_apareceu)
    except TimeoutException:
        raise ErroLogin(f"o sistema não pediu a senha depois do usuário '{USUARIO_CNN}' (usuário inválido?)")
    mesma_tela = driver.current_url == url_antes and set(driver.window_handles) == abas_antes
    print("Senha pedida na mesma tela." if mesma_tela else "Senha pedida em outra tela.")

    campo_senha.click()
    campo_senha.clear()
    campo_senha.send_keys(SENHA_CNN)

    # Botão de entrar: o #next da outra tela, ou o submit do formulário da senha
    botao = next((b for b in driver.find_elements(By.ID, "next") if b.is_displayed()), None)
    if botao is None:
        botao = next((
            b for b in campo_senha.find_elements(
                By.XPATH, "./ancestor::form[1]//button[@type='submit' or not(@type)]")
            if b.is_displayed()
        ), None)
    if botao is not None:
        clicar(driver, botao)
    else:
        campo_senha.send_keys(Keys.ENTER)

    try:
        WebDriverWait(driver, 30).until(lambda d: not campo_senha_visivel(d))
    except TimeoutException:
        raise ErroLogin("usuário ou senha incorretos (o login não passou da tela de senha)")
    print("Login feito.")


def pedir_credenciais():
    """Pergunta no terminal o usuário e a senha que não foram informados."""
    global USUARIO_CNN, SENHA_CNN
    while not USUARIO_CNN:
        USUARIO_CNN = input("Usuário (e-mail) do Clínica nas Nuvens: ").strip()
    while not SENHA_CNN:
        SENHA_CNN = getpass.getpass("Senha: ")


def executar():
    global CLINICA_ATUAL
    pacientes = carregar_pacientes()

    if LIMITE_PACIENTES:
        pacientes = dict(list(pacientes.items())[:LIMITE_PACIENTES])

    if not pacientes:
        print("Nenhum paciente pendente encontrado.")
        return

    total_planos = sum(len(d["planos"]) for d in pacientes.values())
    print(f"{len(pacientes)} paciente(s) pendente(s), {total_planos} plano(s) de tratamento.")
    for clinica, (qtd_pacientes, qtd_planos) in resumo_por_clinica(pacientes).items():
        print(f"  - {clinica}: {qtd_pacientes} paciente(s), {qtd_planos} plano(s)")

    opcoes = webdriver.ChromeOptions()
    if HEADLESS:
        opcoes.add_argument("--headless=new")
        opcoes.add_argument("--window-size=1920,1080")
    driver = webdriver.Chrome(options=opcoes)
    if not HEADLESS:
        driver.maximize_window()
    wait = WebDriverWait(driver, 15)
    parar_relogio = threading.Event()

    try:
        # ── Login ──────────────────────────────────────────────────────────────
        driver.get(f"{URL_BASE}/")

        fazer_login(driver, wait)
        time.sleep(3)

        for popup in driver.find_elements(By.XPATH, "//button[text()='X']"):
            if popup.is_displayed():
                driver.execute_script("arguments[0].click();", popup)
                time.sleep(1)
                break

        # ── Loop principal: clínica por clínica ────────────────────────────────
        total = len(pacientes)

        progresso = {"concluidos": 0, "total": total, "inicio": time.time()}
        threading.Thread(target=relogio_previsao, args=(progresso, parar_relogio), daemon=True).start()

        clinica_atual = None
        clinicas_com_falha = set()

        for idx, ((clinica, pg), dados) in enumerate(pacientes.items(), start=1):
            progresso["concluidos"] = idx - 1
            nome_paciente = dados["nomePaciente"]

            if PARAR.is_set():
                print("\nParada solicitada: encerrando antes do próximo paciente.")
                break

            if clinica in clinicas_com_falha:
                continue

            if clinica != clinica_atual:
                qtd_pacientes, qtd_planos = resumo_por_clinica(pacientes)[clinica]
                print(f"\n{'═' * 70}\nClínica: {clinica} — {qtd_pacientes} paciente(s), {qtd_planos} plano(s)\n{'═' * 70}")
                try:
                    selecionar_clinica(driver, wait, clinica)
                    clinica_atual = clinica
                    CLINICA_ATUAL = clinica
                except Exception as e:
                    # Sem Status gravado: os pacientes dessa clínica ficam para a próxima execução
                    print(f"  ERRO ao selecionar a clínica '{clinica}': {resumo_erro(e)} — pulando esta clínica.")
                    salvar_print_erro(driver, f"clinica_{clinica}")
                    clinicas_com_falha.add(clinica)
                    clinica_atual = None
                    continue

            print(f"\n[{idx}/{total}] {'─' * 60}")
            imprimir_paciente(pg, dados)

            if MODO_REVISAO:
                continue

            # 1. Localiza o paciente pelo PG (dispensável se todos os planos só faltam autorizar)
            url_paciente = None
            if not all(p["so_autorizar"] for p in dados["planos"].values()):
                try:
                    url_paciente = localizar_paciente(driver, wait, pg)
                    print(f"  Paciente localizado: {url_paciente}")
                except Exception as e:
                    print(f"  ERRO ao localizar '{nome_paciente}' (PG: {pg}): {e}")
                    salvar_print_erro(driver, f"{pg}_localizar")
                    try:
                        marcar_status(dados["linhas"], "erro")
                        print("  Marcado como erro na planilha.")
                    except ErroGravacao:
                        raise
                    except Exception as erro_gravacao:
                        print(f"  Falha ao gravar erro na planilha: {erro_gravacao}")
                    continue

            # 2. Cadastra cada plano (um por Perfil Tratamento)
            for perfil, plano in dados["planos"].items():
                if plano["so_autorizar"]:
                    # Já existe no sistema (nova tentativa só da autorização)
                    numero = plano["numero"]
                    print(f"  Plano '{perfil}' já cadastrado (N° {numero}): só falta autorizar.")
                    if not numero:
                        print(f"  ERRO: o plano '{perfil}' está para autorizar, mas não tem o N° do plano na planilha.")
                        marcar_status(plano["linhas"], "erro autorização")
                        continue
                else:
                    print(f"  Cadastrando plano '{perfil}'...")

                    try:
                        cadastrar_plano(driver, wait, url_paciente, perfil, plano)

                    except Exception as e:
                        print(f"  ERRO no plano '{perfil}' de '{nome_paciente}' (PG: {pg}): {e}")
                        salvar_print_erro(driver, f"{pg}_{perfil}")
                        try:
                            marcar_status(plano["linhas"], "erro")
                            print("  Marcado como erro na planilha.")
                        except ErroGravacao:
                            raise
                        except Exception as erro_gravacao:
                            print(f"  Falha ao gravar erro na planilha: {erro_gravacao}")
                        continue

                    # Daqui em diante o plano já existe no sistema: nunca marcar 'erro' (que
                    # sugere não cadastrado), e sim 'cadastrado' ou 'erro autorização'.
                    try:
                        numero = capturar_numero_plano(driver, wait, perfil)
                    except Exception as e:
                        print(f"  Plano '{perfil}' cadastrado, mas não consegui ler o N° do plano: {e}")
                        salvar_print_erro(driver, f"{pg}_{perfil}_numero")
                        marcar_status(plano["linhas"], "erro autorização" if AUTORIZAR_APOS_CADASTRO else "cadastrado")
                        continue
                    # Se esta gravação falhar, ErroGravacao interrompe tudo (não reinicia)
                    marcar_status(plano["linhas"], "cadastrado", numero_plano=numero)
                    print(f"  Plano '{perfil}' cadastrado: N° {numero}.")

                if not AUTORIZAR_APOS_CADASTRO:
                    continue

                print(f"  Autorizando plano {numero}...")
                try:
                    autorizar_plano(driver, wait, numero)
                    marcar_status(plano["linhas"], "autorizado")
                    print(f"  Plano {numero} autorizado.")
                except Exception as e:
                    print(f"  ERRO ao autorizar o plano {numero} de '{nome_paciente}' (PG: {pg}): {resumo_erro(e)}")
                    salvar_print_erro(driver, f"{pg}_{numero}_autorizacao")
                    try:
                        marcar_status(plano["linhas"], "erro autorização")
                        print("  Marcado como 'erro autorização' na planilha.")
                    except ErroGravacao:
                        raise
                    except Exception as erro_gravacao:
                        print(f"  Falha ao gravar erro na planilha: {erro_gravacao}")

        progresso["concluidos"] = total
        print(f"\nCadastro de planos concluído! Tempo total: {formatar_duracao(time.time() - progresso['inicio'])}")
        if clinicas_com_falha:
            print(f"Clínicas puladas (não foi possível selecionar): {', '.join(sorted(clinicas_com_falha))}")

    except Exception:
        # Salva o estado da tela para diagnosticar onde travou
        try:
            driver.save_screenshot(str(PASTA / "erro.png"))
            with open(PASTA / "erro.html", "w", encoding="utf-8") as f:
                f.write(driver.page_source)
            print(f"\nURL no momento do erro: {driver.current_url}")
            print(f"Screenshot salvo em {PASTA / 'erro.png'}")
        except Exception:
            pass
        raise

    finally:
        parar_relogio.set()
        driver.quit()


if __name__ == "__main__":
    pedir_credenciais()
    if AUTORIZAR_APOS_CADASTRO:
        pedir_senhas_desconto(resumo_por_clinica(carregar_pacientes()))
    # Reinicia tudo do zero em caso de qualquer erro (menos login recusado)
    while True:
        try:
            executar()
            break
        except ErroLogin as e:
            print(f"\nERRO de login: {e}")
            break
        except ErroGravacao as e:
            print(f"\nERRO de gravação: {e}\nExecução interrompida para não cadastrar planos em dobro. "
                  "Feche a planilha no Excel, confira as linhas acima e rode de novo.")
            break
        except Exception as e:
            print(f"\nERRO: {type(e).__name__}: {e}")
            traceback.print_exc(limit=3)
            print("Reiniciando em 10 segundos...")
            time.sleep(10)
