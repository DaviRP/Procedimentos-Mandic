"""
Converte os planos de tratamento do sistema antigo (lista de PRODUTOS comprados)
em planos do sistema novo (lista de PROCEDIMENTOS).

Caminho do de-para:
    produto comprado --(aba Grupos de equivalencia)--> grupo de equivalência --(aba Procedimentos e Grupos)--> procedimento

Os dados do sistema novo vêm do template único
01.GruposDeEquivalencia/Template Procedimentos, Grupos e Produtos.xlsx:
    Procedimentos           -> nomes dos procedimentos do sistema novo
    Procedimentos e Grupos  -> procedimento -> grupo de equivalência -> quantidade
    Grupos de equivalencia  -> grupo -> produtos. O produto do plano antigo é casado
                               pelas colunas "Código" (TOTVS) e "Numero Fabricante",
                               se existirem na aba, e depois pelo nome do produto.

Itens que já eram "Procedimento" no sistema antigo são casados primeiro pelo nome
(DEPARA_PROCEDIMENTOS abaixo + nome idêntico) e, se não houver, pelo grupo do código.

Saída: Plano_Tratamento_Convertido.xlsx com as abas
    Plano de Tratamento  -> conversões com certeza
    Revisar              -> casos ambíguos, com sugestão e candidatos
    Sem equivalência     -> itens sem procedimento correspondente
    Itens originais      -> cada linha original e para onde foi
    De-Para Procedimentos-> de-para manual usado para os procedimentos antigos
"""
import collections
import math
import os
import re
import unicodedata

import openpyxl
from openpyxl.styles import Font, PatternFill
from openpyxl.utils import get_column_letter

# Caminhos relativos à pasta do script, independente de onde ele é executado
os.chdir(os.path.dirname(os.path.abspath(__file__)))

ARQ_PLANOS = "Planos de tratamento após 10.09 Vitória V Final.xlsx"
ABA_PLANOS = "Planilha Final"
ARQ_TEMPLATE = "Template Procedimentos, Grupos e Produtos.xlsx"
ABA_PROCEDIMENTOS = "Procedimentos"
ABA_FICHA = "Procedimentos e Grupos"
ABA_GRUPOS = "Grupos de equivalencia"
ARQ_SAIDA = "Plano_Tratamento_Convertido.xlsx"

# Nomes aceitos para cada coluna do template (comparados sem acento/maiúscula/pontuação)
COLS_PROCEDIMENTOS = {"nome": ["Nome do procedimento"]}
COLS_FICHA = {"nome": ["Nome procedimento"], "grupo": ["Nome do Grupo"], "qtd": ["quantidade"]}
COLS_GRUPOS = {
    "grupo": ["Nome do Grupos", "Nome do Grupo"],
    "nome": ["Nome Produto", "Nome do produto"],
    "codigo": ["Código", "Código TOTVS"],
    "cod_fab": ["Numero Fabricante", "Nº Fabricante", "Cód. Fabricante", "Código Fabricante"],
}

SEM_GRUPO = "Sem grupo de equivalência"
# A planilha de planos tem linhas 100% idênticas repetidas (duplicadas na extração). True = considera só uma.
REMOVER_DUPLICADAS = True
GRUPOS_INATIVOS = {"Inativar", "inativar"}

# Procedimento antigo -> (procedimento novo | None, observação).
# None = não existe equivalente seguro -> vai para "Revisar" com os candidatos listados na observação.
DEPARA_PROCEDIMENTOS = {
    "COROA EM E-MAX (DISSILICATO DE LITIO)": ("Coroa em dissilicato de Litio", ""),
    "COROA PROVISORIA SOBRE IMPLANTE ACRILICA POR ELEMENTO (SOLICITAR CILINDRO E PARAFUSO SEPARADAMENTE)":
        ("Coroa Provisória Sobre Implante (Solicitar Cilindro e Parafuso Separadamente)", ""),
    "COROA PROVISÓRIA ACRÍLICA (POR ELEMENTO)": ("Coroa Provisória", ""),
    "COROA PROVISÓRIA POR ELEMENTO": ("Coroa Provisória", ""),
    "PERIO - AUMENTO DE COROA CLÍNICA": ("Aumento de Coroa Clínica ", ""),
    "PERIO - ENXERTO GENGIVAL LIVRE": ("Enxerto gengival Livre", ""),
    "FACETA LAMINADA EM E-MAX": ("Faceta laminada em dissilicato de litio", ""),
    "INLAY/ONLAY E-MAX": ("Inlay/Onlay em Dissilicato de Lítio", ""),
    "KIT PRF TERCEIRIZADO": ("PRF – Serviço Terceirizado", ""),
    "PLANEJAMENTO SELF -ADITEK": ("Planejamento - Aditek ", ""),
    "PROFILAXIA E POLIMENTO CORONARIO": ("Profilaxia", ""),
    "PROFILAXIA (LIMPEZA) - ULTRASSOM": ("Profilaxia", ""),
    "PROTESE PARCIAL REMOVIVEL COM DENTES BIOLUX - INCLUINDO ARMACAO, MONTAGEM, ACRILIZACAO E CARACTERIZACAO)":
        ("Prótese Parcial Removível", ""),
    "PROTESE PARCIAL REMOVIVEL COM DENTES PREMIUM - INCLUINDO ARMACAO, MONTAGEM, ACRILIZACAO E CARACTERIZACAO)":
        ("Prótese Parcial Removível", ""),
    "PROTESE PARCIAL REMOVIVEL COM DENTES TRILUX - INCLUINDO ARMACAO, MONTAGEM, ACRILIZACAO E CARACTERIZACAO)":
        ("Prótese Parcial Removível", ""),
    "PROTESE PARCIAL REMOVIVEL PROVISORIA (INCLUINDO BASE DE PROVA, MONTAGEM, ACRILIZACAO E DENTES)":
        ("Prótese Parcial Removível Provisória", ""),
    "PROTESE TOTAL COMPLETA COM DENTES BIOLUX (COM CARACTERIZACAO)": ("Prótese Total", ""),
    "PROTESE TOTAL COMPLETA COM DENTES PREMIUM OU IVOCLAIR (COM CARACTERIZACAO)": ("Prótese Total", ""),
    "PROTESE TOTAL COMPLETA COM DENTES TRILUX (COM CARACTERIZACAO)": ("Prótese Total", ""),
    "FASE PROTETICA DE PROTESE PROTOCOLO COM DENTES PREMIUM OU IVOCLAIR (INCLUINDO BARRA, SOLDAS E ACRILIZACAO) (SOLICITAR CILINDROS E PARAFUSOS)":
        ("Protocolo (Solicitar Cilindros e Parafusos a Parte)", ""),
    "FASE PROTETICA DE PROTESE PROTOCOLO COM DENTES TRILUX (INCLUINDO BARRA, SOLDAS E ACRILIZACAO) (SOLICITAR CILINDROS E PARAFUSOS)":
        ("Protocolo (Solicitar Cilindros e Parafusos a Parte)", ""),
    # Sem equivalente seguro -> Revisar
    "COROA METALOCERAMICA UNITARIA": (None, "Não há coroa metalocerâmica no sistema novo. Candidatos: Coroa em Zircônia | Coroa em cerâmica personalizada"),
    "COROA PARAFUSADA METALO-CERAMICA SOBRE IMPLANTE (SOLICITAR PILAR SEPARADAMENTE)":
        (None, "Não há metalocerâmica sobre implante. Candidatos: Coroa Parafusada sobre implante em Zircônia"),
    "PÔNTICO EM METALOCERÂMICA": (None, "Sem pôntico no sistema novo. Candidatos: Coroa em Zircônia | Coroa em cerâmica personalizada"),
    "NÚCLEO ESTÉTICO": (None, "Candidatos: Núcleo | Retentor Intrarradicular em Fibra de Vidro | Pino de Fibra de Vidro"),
    "PERIO - ENXERTO CONJUNTIVO": (None, "Candidatos: Recobrimento Radicular (Por Hemi-Arco) | Enxerto gengival Livre"),
    "PERIO - FRENECTOMIA": (None, "Candidatos: Frenectomia Labial | Frenectomia Lingual"),
    "PERIO - EXODONTIA (POR ELEMENTO)": (None, "Candidatos: Exodontia Simples | Exodontia Cirúrgica (Dente Incluso, Impactado, Supranumerário ou Raiz Residual)"),
    "PERIO - PLASTIA DE REBORDO (REMOÇÃO DE TORUS OU TUBER)":
        (None, "Candidatos: Cirurgia de Tórus Palatino e/ou Mandibular (Unilateral ou Bilateral) | Alveoloplastia e/ou Alveolotomia Cirúrgica"),
    "PERIO - INSTALAÇÃO DE IMPLANTE (IMPLANTE NÃO INCLUSO)": (None, "Candidatos: Implante Unitário – Básico | Implante Unitário – Premium"),
    "CIRURGIA AVANÇADA": (None, "Sem equivalente direto. Verificar qual cirurgia foi feita"),
    "LEVANTAMENTO DE SEIO MAXILAR (NÃO INCLUI BIOMATERIAL)": (None, "Sem levantamento de seio no sistema novo. Candidatos: Enxerto Ósseo Convencional | Intermediário | Avançado"),
    "BARRA 3X3 RETA": (None, "Candidatos: Barra 3x3 Higiênica"),
    "BARRA TRANSPALATINA (BTP)": (None, "Sem equivalente no sistema novo"),
    "ENCERAMENTO DIAGNÓSTICO POR ELEMENTO": (None, "Sem equivalente no sistema novo"),
    "LOGISTICA OPERACIONAL": (None, "Sem equivalente no sistema novo"),
    "FRESAGENS PARA P.P.R.": (None, "Sem equivalente no sistema novo"),
}

# Grupos de implante / componentes por linha (Básico x Premium)
LINHAS = ("Básico", "Premium")
G_IMPLANTE = {"Básico": "Implante Básico", "Premium": "Implante - Premium"}
G_CICATRIZADOR = {"Básico": "Cicatrizador - Básico", "Premium": "Cicatrizador Premium"}
G_CICAT_REABERTURA = {"Básico": "Cicatrizador - Reabertura - Básico", "Premium": "Cicatrizador - Reabertura - Premium"}
G_ANALOGO = {"Básico": "Análogo Básico", "Premium": "Análogo Premium"}
G_TRANSFERENTE = {"Básico": "Transferente Básico", "Premium": "Transferente Premium"}
G_PILAR = {"Básico": "Pilar Básico", "Premium": "Pilar Premium"}
G_COPING = {"Básico": "Coping/Cilindro/Ucla/Tampa Proteção Básico", "Premium": "Cilindro/Coping/Ucla Premium"}
G_PARAFUSO = {"Básico": "Parafusos Protéticos Básico", "Premium": "Parafuso Premium"}
G_PILAR_PROV = {"Básico": "Pilar provisório Basico", "Premium": "Pilar provisório Premium"}

P_IMPL_UNIT = {"Básico": "Implante Unitário – Básico", "Premium": "Implante Unitário – Premium"}
P_IMPL_PROT = {"Básico": "Implantes para Protocolo - Básico", "Premium": "Implantes para protocolo - Premium"}
P_IMPL_EXTRA = {"Básico": "Extra - Implante para Protocolo – Básico", "Premium": "Extra - Implante para Protocolo – Premium"}
P_COMP_UNIT = {"Básico": "Componentes para Coroa Unitária – Básico", "Premium": "Componentes para Coroa Unitária – Premium"}
P_COMP_PROV = {"Básico": "Componentes para Coroa Provisória Unitária – Básico", "Premium": "Componentes para Coroa Provisória Unitária – Premium"}
P_COMP_PROT = {"Básico": "Componentes para Protocolo - Básico", "Premium": "Componentes para Protocolo - Premium"}
P_COMP_EXTRA = {"Básico": "Extra - Componentes para Protocolo - Básico", "Premium": None}

GRUPOS_TRATADOS = set()
for d in (G_IMPLANTE, G_CICATRIZADOR, G_ANALOGO, G_TRANSFERENTE, G_PILAR, G_COPING, G_PARAFUSO, G_PILAR_PROV):
    GRUPOS_TRATADOS.update(d.values())

# Grupos "acessórios": já estão embutidos em outro procedimento; só geram procedimento próprio se estiverem sozinhos
GRUPOS_KIT = {
    "Kits Compostos Cirúrgicos", "Kits Compostos Cirurgia", "Kits compostos Reabertura",
    "Kits HOF - Bioestimulador", "Kits HOF - Preenchimento", "Kits HOF - Toxina",
    "Kit Fios", "Kit Microagulhamento", "Ativo Basico",
}


def norm(s):
    s = unicodedata.normalize("NFKD", str(s or "")).encode("ascii", "ignore").decode().upper()
    return re.sub(r"\s+", " ", s).strip()


def chave(s):
    return re.sub(r"[^A-Z0-9]", "", norm(s))


def tokens(s):
    s = re.sub(r"(\d),(\d)", r"\1.\2", norm(s))
    return set(re.findall(r"\d+(?:\.\d+)?|[A-Z]+", s))


def similaridade(a, b):
    ta, tb = (a if isinstance(a, set) else tokens(a)), (b if isinstance(b, set) else tokens(b))
    return len(ta & tb) / len(ta | tb) if ta and tb else 0.0


# Desempate quando um produto está em mais de um grupo: palavra-chave no nome -> trecho do nome do grupo
PALAVRAS_GRUPO = [
    ("PROVIS", "PILAR PROVIS"),
    ("CILIN", "COPING"), ("UCLA", "COPING"), ("COPING", "COPING"), ("PROTECAO", "COPING"),
    ("CICATRIZ", "CICATRIZADOR"),
    ("ANALOGO", "ANALOGO"), ("TRANSFER", "TRANSFERENTE"),
]


def desempatar_por_nome(desc, grupos):
    d = norm(desc)
    for palavra, trecho in PALAVRAS_GRUPO:
        if palavra in d:
            achou = {g for g in grupos if trecho in norm(g)}
            if len(achou) == 1:
                return achou
    return grupos


def ler(arq, aba, max_col):
    wb = openpyxl.load_workbook(arq, read_only=True, data_only=True)
    linhas = []
    for r in wb[aba].iter_rows(max_col=max_col, values_only=True):  # max_col=None = todas
        linhas.append(r)
    wb.close()
    while linhas and all(c is None for c in linhas[-1]):
        linhas.pop()
    return linhas


def ler_aba(arq, aba, colunas, obrigatorias):
    """Lê uma aba pelo nome das colunas: devolve lista de dicts com as chaves de `colunas`.

    `colunas` = {chave: [nomes aceitos no cabeçalho]}. Colunas fora de `obrigatorias`
    que não existirem na aba vêm como None (e a chave aparece em faltando).
    """
    linhas = ler(arq, aba, None)
    cab = [chave(c) for c in linhas[0]]
    pos, faltando = {}, []
    for k, nomes in colunas.items():
        achou = next((cab.index(chave(n)) for n in nomes if chave(n) in cab), None)
        if achou is None:
            if k in obrigatorias:
                raise SystemExit(f'Coluna "{nomes[0]}" não encontrada na aba "{aba}" de {arq}. Cabeçalho: {linhas[0]}')
            faltando.append(k)
        pos[k] = achou
    dados = [{k: (r[p] if p is not None and p < len(r) else None) for k, p in pos.items()} for r in linhas[1:]]
    return dados, faltando


def num(v, padrao=1.0):
    try:
        return float(str(v).replace(",", "."))
    except (TypeError, ValueError):
        return padrao


def fmt_qtd(q):
    return int(q) if float(q).is_integer() else round(q, 2)


# ---------------------------------------------------------------- cargas
def carregar_ficha():
    grupo_procs = collections.defaultdict(list)   # grupo -> [procedimentos]
    grupo_qtd = {}                                 # (proc, grupo) -> qtd na ficha
    procs = {}                                     # nome normalizado -> nome

    # Catálogo completo do sistema novo (inclui procedimentos sem grupo de equivalência)
    catalogo_procs, _ = ler_aba(ARQ_TEMPLATE, ABA_PROCEDIMENTOS, COLS_PROCEDIMENTOS, {"nome"})
    for linha in catalogo_procs:
        if linha["nome"]:
            procs[norm(linha["nome"])] = str(linha["nome"])

    ficha, _ = ler_aba(ARQ_TEMPLATE, ABA_FICHA, COLS_FICHA, {"nome", "grupo", "qtd"})
    for linha in ficha:
        nome, grupo, qtd = linha["nome"], linha["grupo"], linha["qtd"]
        if not nome:
            continue
        nome = str(nome)
        procs.setdefault(norm(nome), nome)
        if grupo and str(grupo).strip() != SEM_GRUPO:
            grupo = str(grupo).strip()
            if nome not in grupo_procs[grupo]:
                grupo_procs[grupo].append(nome)
            grupo_qtd[(nome, grupo)] = num(qtd, 1) or 1
    return grupo_procs, grupo_qtd, procs


def carregar_grupos():
    linhas, faltando = ler_aba(ARQ_TEMPLATE, ABA_GRUPOS, COLS_GRUPOS, {"grupo", "nome"})
    if faltando:
        nomes = {"codigo": '"Código" (TOTVS)', "cod_fab": '"Numero Fabricante"'}
        print(f'Atenção: aba "{ABA_GRUPOS}" sem a(s) coluna(s) {", ".join(nomes[k] for k in faltando)} — '
              "os produtos dos planos serão casados só pelo nome, e mais itens irão para Revisar/Sem equivalência.")
    por_codigo = collections.defaultdict(list)       # Código TOTVS -> [(tokens do nome, grupo)]
    por_cod_fab = collections.defaultdict(list)      # Cód. fabricante -> [(tokens do nome, grupo)]
    por_nome = collections.defaultdict(set)
    catalogo = []   # (tokens, grupo)
    for linha in linhas:
        grupo, codigo, nome, cod_fab = linha["grupo"], linha["codigo"], linha["nome"], linha["cod_fab"]
        if not grupo:
            continue
        grupo = str(grupo).strip()
        tk = tokens(nome)
        if codigo:
            por_codigo[chave(codigo)].append((tk, grupo))
        if cod_fab:
            por_cod_fab[chave(cod_fab)].append((tk, grupo))
        if nome:
            por_nome[chave(nome)].add(grupo)
            catalogo.append((tk, grupo))
    return por_codigo, por_cod_fab, por_nome, catalogo


def grupos_do_codigo(desc, candidatos, exigir_nome):
    """Entre os produtos com o mesmo código, fica com os de nome mais parecido.
    Códigos de fabricante curtos colidem entre produtos diferentes, por isso exigem nome parecido."""
    tk = tokens(desc)
    notas = [(similaridade(tk, tk2), g) for tk2, g in candidatos]
    melhor = max(s for s, _ in notas)
    if exigir_nome and melhor < 0.3:
        return set()
    return {g for s, g in notas if s >= melhor - 0.05}


def grupo_por_similaridade(desc, catalogo):
    """Procura os produtos mais parecidos no catálogo e faz uma votação do grupo."""
    tk = tokens(desc)
    if not tk:
        return None, 0
    notas = sorted(((similaridade(tk, tk2), g) for tk2, g in catalogo), reverse=True)
    melhor = notas[0][0]
    if melhor < 0.45:
        return None, melhor
    votos = collections.Counter(g for s, g in notas[:7] if s >= melhor - 0.15)
    grupo, n = votos.most_common(1)[0]
    concordancia = n / sum(votos.values())
    return grupo, min(melhor, concordancia)


# ---------------------------------------------------------------- principal
def main():
    grupo_procs, grupo_qtd, procs_novos = carregar_ficha()
    grupos_validos = set(grupo_procs)
    por_codigo, por_cod_fab, por_nome, catalogo = carregar_grupos()

    planos = ler(ARQ_PLANOS, ABA_PLANOS, 30)
    cab = planos[0]
    idx = {c: i for i, c in enumerate(cab) if c}
    itens = []
    vistas = set()
    duplicadas = 0
    for n_linha, r in enumerate(planos[1:], start=2):
        if not any(r) or not r[idx["ORCAMENTO_REAL"]]:
            continue
        if REMOVER_DUPLICADAS:
            if r in vistas:
                duplicadas += 1
                continue
            vistas.add(r)
        itens.append({
            "linha": n_linha,
            "orc": str(r[idx["ORCAMENTO_REAL"]]),
            "pg": r[idx["PG"]],
            "paciente": r[idx["Nome_Paciente"]],
            "data": r[idx["Data_Criacao"]],
            "perfil": r[idx["Perfil_Tratamento"]],
            "especialidade": r[idx["Nome_Especialidade"]],
            "coordenador": r[idx["Coordenador"]],
            "aluno": r[idx["Aluno_Associado"]],
            "tipo": r[idx["tipo_item"]],
            "codigo": r[idx["codigo_produto"]],
            "desc": (str(r[idx["descricao_produto"]] or "")).replace("\xa0", " ").strip(),
            "qtd": num(r[idx["quantidade_produto"]], 1),
            "destino": "",
        })

    catalogo_valido = [(tk, g) for tk, g in catalogo if g in grupos_validos]
    cache_sim = {}
    for it in itens:
        it["grupos"], it["via"], it["incerto"] = set(), "", False
        if it["tipo"] == "Procedimento" and (it["desc"] in DEPARA_PROCEDIMENTOS or norm(it["desc"]) in procs_novos):
            it["via"] = "nome do procedimento"
            continue
        cod = chave(it["codigo"])
        g = por_codigo.get(cod) and grupos_do_codigo(it["desc"], por_codigo[cod], exigir_nome=False)
        if g:
            it["grupos"], it["via"] = g, "código"
        else:
            g = por_cod_fab.get(cod) and grupos_do_codigo(it["desc"], por_cod_fab[cod], exigir_nome=True)
            if g:
                it["grupos"], it["via"] = g, "código do fabricante"
            else:
                g = por_nome.get(chave(it["desc"]))
                if g:
                    it["grupos"], it["via"] = set(g), "nome"
        if it["grupos"]:
            # Produto marcado como "Inativar" (ex.: implante descontinuado): sugere o grupo de um produto parecido
            if it["grupos"] <= GRUPOS_INATIVOS and "PARAMENTA" not in norm(it["desc"]):
                g, nota = grupo_por_similaridade(it["desc"], catalogo_valido)
                if g:
                    it["grupos"], it["incerto"] = {g}, True
                    it["via"] += f' -> produto inativo, grupo por nome aproximado ({nota:.0%})'
            continue
        if it["desc"] not in cache_sim:
            cache_sim[it["desc"]] = grupo_por_similaridade(it["desc"], catalogo)
        g, nota = cache_sim[it["desc"]]
        if g:
            it["grupos"], it["via"] = {g}, f"nome aproximado ({nota:.0%})"
            it["incerto"] = nota < 0.6

    plano, revisar, sem_eq = [], [], []

    por_orc = collections.OrderedDict()
    for it in itens:
        por_orc.setdefault(it["orc"], []).append(it)

    for orc, lista in por_orc.items():
        base = lista[0]
        cab_orc = {"orc": orc, "pg": base["pg"], "paciente": base["paciente"], "data": base["data"],
                   "perfil": base["perfil"], "especialidade": base["especialidade"],
                   "coordenador": base["coordenador"], "aluno": base["aluno"]}
        procs_orc = set()     # procedimentos já definidos neste orçamento (certos ou sugeridos)

        def origem(its):
            return " | ".join(f'{fmt_qtd(i["qtd"])}x {i["desc"]}' for i in its)

        def add_plano(proc, qtd, its, regra):
            procs_orc.add(proc)
            plano.append({**cab_orc, "proc": proc, "qtd": fmt_qtd(qtd), "regra": regra, "origem": origem(its)})
            for i in its:
                i["destino"] = i["destino"] or f"Plano: {proc}"

        def add_revisar(sugestao, qtd, candidatos, motivo, its):
            if sugestao:
                procs_orc.add(sugestao)
            revisar.append({**cab_orc, "sugestao": sugestao or "", "qtd": fmt_qtd(qtd) if qtd else "",
                            "candidatos": candidatos, "motivo": motivo, "origem": origem(its)})
            for i in its:
                i["destino"] = i["destino"] or f"Revisar: {sugestao or motivo}"

        def add_sem(it, motivo):
            sem_eq.append({**cab_orc, "tipo": it["tipo"], "codigo": it["codigo"], "desc": it["desc"],
                           "qtd": fmt_qtd(it["qtd"]), "grupo": ", ".join(sorted(it["grupos"])), "motivo": motivo})
            it["destino"] = f"Sem equivalência: {motivo}"

        # 1) Procedimentos antigos -> pelo nome
        pendentes = []
        protocolo_def = protocolo_prov = 0
        for it in lista:
            if it["tipo"] == "Procedimento":
                d = norm(it["desc"])
                if "PROTOCOLO" in d and "PROFILAXIA" not in d:
                    if "PROVISORIO" in d:
                        protocolo_prov += it["qtd"]
                    else:
                        protocolo_def += it["qtd"]
                if it["desc"] in DEPARA_PROCEDIMENTOS:
                    novo, obs = DEPARA_PROCEDIMENTOS[it["desc"]]
                    if novo:
                        add_plano(novo, it["qtd"], [it], "de-para de procedimento")
                    elif obs.startswith("Sem equivalente no sistema novo"):
                        add_sem(it, obs)
                    else:
                        add_revisar("", it["qtd"], obs, "Procedimento antigo sem equivalente direto", [it])
                    continue
                if d in procs_novos:
                    add_plano(procs_novos[d], it["qtd"], [it], "mesmo nome")
                    continue
            pendentes.append(it)
        n_protocolos = protocolo_def or protocolo_prov

        # 2) Resolve itens com mais de um grupo e agrupa quantidades
        grupos_orc = set()
        for it in pendentes:
            if len(it["grupos"]) == 1:
                grupos_orc |= it["grupos"]
        tem_implante = any(G_IMPLANTE[l] in grupos_orc for l in LINHAS)
        qtd_grupo = collections.defaultdict(float)
        itens_grupo = collections.defaultdict(list)
        kits_multi = []   # kits que estão em mais de um grupo de kit
        for it in pendentes:
            gs = it["grupos"]
            if not gs:
                add_sem(it, f"Produto não encontrado na aba {ABA_GRUPOS}")
                continue
            if len(gs) > 1:
                validos = gs & grupos_validos
                gs = validos or gs
            if len(gs) > 1:
                for l in LINHAS:
                    if gs == {G_CICATRIZADOR[l], G_CICAT_REABERTURA[l]}:
                        gs = {G_CICATRIZADOR[l] if tem_implante else G_CICAT_REABERTURA[l]}
            if len(gs) > 1:
                gs = desempatar_por_nome(it["desc"], gs)
            if len(gs) > 1:
                ja = gs & grupos_orc
                if len(ja) == 1:
                    gs = ja
            if len(gs) > 1 and gs <= GRUPOS_KIT:
                kits_multi.append((it, gs))
                continue
            if it["incerto"]:
                g = next(iter(gs))
                add_revisar("", it["qtd"], " | ".join(grupo_procs.get(g, [])) or g,
                            f'Grupo sugerido "{g}" — casado via {it["via"]}; confirmar', [it])
                continue
            if len(gs) > 1:
                cands = sorted({p for g in gs for p in grupo_procs.get(g, [])})
                add_revisar("", it["qtd"], " | ".join(cands) or ", ".join(sorted(gs)),
                            f"Produto pertence a mais de um grupo: {', '.join(sorted(gs))}", [it])
                continue
            g = next(iter(gs))
            if g not in grupos_validos:
                add_sem(it, f'Grupo "{g}" não está ligado a nenhum procedimento na aba {ABA_FICHA}')
                continue
            qtd_grupo[g] += it["qtd"]
            itens_grupo[g].append(it)

        def its(*gs):
            return [i for g in gs for i in itens_grupo.get(g, [])]

        # 3) Implantes
        for l in LINHAS:
            gi, gc = G_IMPLANTE[l], G_CICATRIZADOR[l]
            n = qtd_grupo.get(gi, 0)
            if n:
                origem_its = its(gi, gc)
                if n_protocolos:
                    pc = n_protocolos
                    if n >= 4 * pc:
                        extra = n - 4 * pc
                        sug = f"{P_IMPL_PROT[l]} x{fmt_qtd(pc)}" + (f" + {P_IMPL_EXTRA[l]} x{fmt_qtd(extra)}" if extra else "")
                    else:
                        sug = ""
                    add_revisar(P_IMPL_PROT[l], pc, f"{sug or P_IMPL_PROT[l]} | {P_IMPL_UNIT[l]} x{fmt_qtd(n)}",
                                f"Orçamento tem protocolo ({fmt_qtd(pc)}) e {fmt_qtd(n)} implante(s): confirmar se são de protocolo ou unitários",
                                origem_its)
                    procs_orc.add(P_IMPL_UNIT[l])
                else:
                    add_plano(P_IMPL_UNIT[l], n, origem_its, "implante (sem protocolo no orçamento)")
            elif qtd_grupo.get(gc):
                add_revisar("", qtd_grupo[gc], " | ".join(grupo_procs[gc]),
                            "Cicatrizador sem implante no orçamento", its(gc))

        # 4) Componentes protéticos
        so_acessorios = []   # linhas que só têm análogo/transferente/parafuso
        for l in LINHAS:
            grupos_comp = [G_ANALOGO[l], G_TRANSFERENTE[l], G_PILAR[l], G_COPING[l], G_PARAFUSO[l], G_PILAR_PROV[l]]
            if not any(qtd_grupo.get(g) for g in grupos_comp):
                continue
            origem_its = its(*grupos_comp)
            prov = qtd_grupo.get(G_PILAR_PROV[l], 0)
            defin = max(qtd_grupo.get(G_PILAR[l], 0), qtd_grupo.get(G_COPING[l], 0))
            if n_protocolos:
                cands = [P_COMP_PROT[l], P_COMP_UNIT[l], P_COMP_PROV[l]] + ([P_COMP_EXTRA[l]] if P_COMP_EXTRA[l] else [])
                add_revisar(P_COMP_PROT[l], n_protocolos, " | ".join(cands),
                            "Componentes em orçamento com protocolo: confirmar se são de protocolo ou de coroa unitária",
                            origem_its)
                continue
            if prov:
                add_plano(P_COMP_PROV[l], prov, its(G_PILAR_PROV[l], G_ANALOGO[l], G_TRANSFERENTE[l], G_PARAFUSO[l]) if not defin else its(G_PILAR_PROV[l]),
                          "pilar provisório")
            if defin:
                add_plano(P_COMP_UNIT[l], defin, its(G_PILAR[l], G_COPING[l], G_ANALOGO[l], G_TRANSFERENTE[l], G_PARAFUSO[l]),
                          "pilar/coping (sem protocolo no orçamento)")
            if not prov and not defin:
                so_acessorios.append((l, origem_its))
        for l, origem_its in so_acessorios:
            # Ex.: análogo/transferente Básico + pilar Premium -> já cobertos pelos componentes da outra linha
            ja = [p for p in (*P_COMP_UNIT.values(), *P_COMP_PROV.values()) if p in procs_orc]
            if ja:
                for i in origem_its:
                    i["destino"] = f"Incluído em: {ja[0]}"
                continue
            q = max(qtd_grupo.get(G_ANALOGO[l], 0), qtd_grupo.get(G_TRANSFERENTE[l], 0), qtd_grupo.get(G_PARAFUSO[l], 0))
            add_revisar(P_COMP_UNIT[l], q, f"{P_COMP_UNIT[l]} | {P_COMP_PROV[l]}",
                        "Só análogo/transferente/parafuso, sem pilar ou coping", origem_its)

        # 5) Demais grupos (exceto kits)
        for g in list(qtd_grupo):
            if g in GRUPOS_TRATADOS or g in GRUPOS_KIT:
                continue
            cands = grupo_procs[g]
            if len(cands) == 1:
                p = cands[0]
                q = math.ceil(qtd_grupo[g] / grupo_qtd.get((p, g), 1))
                add_plano(p, q, its(g), f"grupo {g}")
            else:
                ja = [p for p in cands if p in procs_orc]
                if ja:
                    for i in its(g):
                        i["destino"] = f"Incluído em: {ja[0]}"
                else:
                    add_revisar("", qtd_grupo[g], " | ".join(cands), f'Grupo "{g}" serve a vários procedimentos', its(g))

        # 6) Kits: absorvidos pelo procedimento que já os inclui
        for g in list(qtd_grupo):
            if g not in GRUPOS_KIT:
                continue
            cands = grupo_procs[g]
            ja = [p for p in cands if p in procs_orc]
            if ja:
                for i in its(g):
                    i["destino"] = f"Incluído em: {ja[0]}"
            elif len(cands) == 1:
                add_plano(cands[0], qtd_grupo[g], its(g), f"kit {g}")
            else:
                add_revisar("", qtd_grupo[g], " | ".join(cands),
                            f'Kit "{g}" sem procedimento principal no orçamento', its(g))
        for it, gs in kits_multi:
            cands = sorted({p for g in gs for p in grupo_procs[g]})
            ja = [p for p in cands if p in procs_orc]
            if ja:
                it["destino"] = f"Incluído em: {ja[0]}"
            else:
                add_revisar("", it["qtd"], " | ".join(cands),
                            f'Kit sem procedimento principal no orçamento ({", ".join(sorted(gs))})', [it])

    salvar(itens, plano, revisar, sem_eq)

    print(f"Itens lidos: {len(itens)} em {len(por_orc)} orçamentos ({duplicadas} linhas duplicadas ignoradas)")
    print(f"Plano de Tratamento: {len(plano)} linhas")
    print(f"Revisar: {len(revisar)} linhas")
    print(f"Sem equivalência: {len(sem_eq)} linhas")
    print(f"Destinos: {collections.Counter(i['destino'].split(':')[0] for i in itens)}")
    print(f"Arquivo gerado: {ARQ_SAIDA}")


# ---------------------------------------------------------------- saída
def escrever_aba(wb, titulo, colunas, linhas, cor):
    ws = wb.create_sheet(titulo)
    ws.append([c for c, _ in colunas])
    for c in ws[1]:
        c.font = Font(bold=True, color="FFFFFF")
        c.fill = PatternFill("solid", fgColor=cor)
    for l in linhas:
        ws.append([l.get(k, "") for _, k in colunas])
    for i, (nome, k) in enumerate(colunas, start=1):
        larg = max([len(str(nome))] + [len(str(l.get(k, ""))) for l in linhas[:500]])
        ws.column_dimensions[get_column_letter(i)].width = min(max(10, larg + 2), 70)
    ws.freeze_panes = "A2"
    ws.auto_filter.ref = ws.dimensions


def salvar(itens, plano, revisar, sem_eq):
    wb = openpyxl.Workbook()
    wb.remove(wb.active)
    cab = [("Orçamento", "orc"), ("PG", "pg"), ("Paciente", "paciente"), ("Data Criação", "data"),
           ("Perfil Tratamento", "perfil"), ("Especialidade", "especialidade"),
           ("Coordenador", "coordenador"), ("Aluno Associado", "aluno")]
    escrever_aba(wb, "Plano de Tratamento",
                 cab + [("Procedimento (sistema novo)", "proc"), ("Quantidade", "qtd"),
                        ("Regra aplicada", "regra"), ("Itens de origem", "origem")], plano, "2E7D32")
    escrever_aba(wb, "Revisar",
                 cab + [("Sugestão", "sugestao"), ("Qtd", "qtd"), ("Candidatos", "candidatos"),
                        ("Motivo", "motivo"), ("Itens de origem", "origem")], revisar, "EF6C00")
    escrever_aba(wb, "Sem equivalência",
                 cab + [("Tipo", "tipo"), ("Código", "codigo"), ("Descrição", "desc"), ("Qtd", "qtd"),
                        ("Grupo encontrado", "grupo"), ("Motivo", "motivo")], sem_eq, "C62828")
    orig = [{"linha": i["linha"], "orc": i["orc"], "paciente": i["paciente"], "tipo": i["tipo"],
             "codigo": i["codigo"], "desc": i["desc"], "qtd": fmt_qtd(i["qtd"]),
             "grupos": ", ".join(sorted(i["grupos"])), "via": i["via"], "destino": i["destino"]} for i in itens]
    escrever_aba(wb, "Itens originais",
                 [("Linha", "linha"), ("Orçamento", "orc"), ("Paciente", "paciente"), ("Tipo", "tipo"),
                  ("Código", "codigo"), ("Descrição", "desc"), ("Qtd", "qtd"), ("Grupo(s)", "grupos"),
                  ("Casado via", "via"), ("Destino", "destino")], orig, "455A64")
    dp = [{"antigo": k, "novo": v[0] or "(revisar)", "obs": v[1]} for k, v in DEPARA_PROCEDIMENTOS.items()]
    escrever_aba(wb, "De-Para Procedimentos",
                 [("Procedimento antigo", "antigo"), ("Procedimento novo", "novo"), ("Observação", "obs")], dp, "455A64")
    wb.save(ARQ_SAIDA)


if __name__ == "__main__":
    main()
