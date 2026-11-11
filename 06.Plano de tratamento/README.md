# Planos de Tratamento

Converte orçamentos do sistema antigo em planos de tratamento e cadastra/autoriza esses planos no Clínica nas Nuvens.

Também tem a tela **Agendamentos**, que coleta as agendas do OdontoSig para um banco de agendamentos (veja abaixo).

## Como abrir

Dois cliques em `Abrir App Planos.command`. Na primeira vez, ele cria o `.venv` e instala `openpyxl` e `selenium`.

## Estrutura

```
06.Plano de tratamento/
├── Abrir App Planos.command    abre o app (Mac)
├── app/                        código do app
│   ├── app_planos.py           servidor local + telas (web/index.html)
│   ├── cofre.py                guarda as senhas lembradas no cofre do sistema
│   ├── Plano de tratamento.py  robô que cadastra/autoriza no Clínica nas Nuvens
│   ├── TransformadorDePlanos.py  conversão dos orçamentos em planos
│   ├── agendamentos.py       tela Agendamentos: banco de agendamentos, coleta e integração
│   ├── cnn_agenda.py         robô que agenda no Clínica nas Nuvens (um jeito por Tipo)
│   ├── odontosig.py          robô que lê as agendas do OdontoSig
│   └── web/index.html
├── scripts/                    robôs avulsos, rodados à mão (fora do app)
│   ├── Autorizador de plano_headless.py
│   └── Plano de tratamento_multi.py
├── ferramentas/
│   └── empacotar.py            gera o ZIP para outro computador (Windows/Mac)
├── dados/                      tudo o que é lido/gravado — nada de código aqui
│   ├── Banco de Planos de Tratamento.xlsx
│   ├── Banco de Agendamentos.xlsx   agendas coletadas do OdontoSig (fora do git)
│   ├── app_config.json         catálogo em uso
│   ├── catalogos/              planilhas de procedimentos, grupos e produtos
│   ├── importados/             cópia de cada planilha importada
│   ├── conversoes/             relatório de cada conversão
│   ├── erros/                  prints de tela quando a integração falha
│   ├── backups/                cópias automáticas do banco (as 30 mais recentes)
│   ├── logs/historico_status.jsonl  toda mudança de Status feita pelo robô
│   └── planilhas/              planilhas usadas pelos scripts avulsos
└── dist/                       pacote gerado pelo empacotar.py (fora do git)
```

## Menu

Rail de ícones à esquerda com os dois módulos: **Planos de tratamento** (Novo plano manual, Importar, Banco, Integrar e Catálogo) e **Agendamentos** (Coletar, Integrar, Resumo, Agendamentos no banco e Coletas). O painel ao lado mostra as telas do módulo escolhido. Os badges do rail somam as pendências do módulo. A busca (Ctrl/⌘ + K) procura nos dois módulos. O painel pode ser recolhido, e o app lembra a escolha. Pelo teclado: Tab, ↑/↓ entre itens, → entra no painel, Esc volta.

Cada item da Agenda é uma tela própria: `#agendamentos/coletar`, `/linhas` (revisar e aprovar), `/integrar`, `/resumo` e `/coletas`.

## Agendamentos (OdontoSig)

Menu **Agendas › Agendamentos**. Coleta as agendas do OdontoSig e grava em `dados/Banco de Agendamentos.xlsx`, a base para integrar as agendas no Clínica nas Nuvens.

1. Informe usuário e senha do OdontoSig (usados só na coleta, não ficam guardados), as unidades e o período.
2. Para cada unidade, o robô (`odontosig.py`) faz login, escolhe a unidade, abre `#/relatorios/prontuarios`, preenche o período e lê a tabela página por página.
3. A coluna "Data / Horário" (`03/11/2026 - 08:00`) vira **Data** e **Hora**. Observação com `[Agendamento cancelado - ...]` marca **Cancelado = Sim** e a data em **Cancelado em**.

**Sem duplicar:** um agendamento é identificado por Origem + Unidade + Data + Hora + PG + Nome + Agendado com. Coletar de novo o mesmo período só atualiza Tipo, Coordenador, Turma, Observações e Cancelado, se mudaram.

**Abas do banco:** `Agendamentos` (uma linha por agendamento, com `Status integração`, `Integrado em` e `Mensagem integração`) e `Coletas` (um registro por unidade coletada: período, páginas, lidos, novos, atualizados, situação).

Backups em `dados/backups/Agendamentos *.xlsx` (ao abrir, antes de cada coleta ou integração e ao fechar; os 30 mais recentes). Erros da coleta e da integração geram print e HTML em `dados/erros`.

### Revisar e aprovar

Como nos planos: só sobem os agendamentos **aprovados**. Em **Agendamentos no banco** (passo 2 do menu da Agenda), filtre por situação (aguardando aprovação, aprovados, integrados, com erro, cancelados), aprove linha a linha ou selecione várias e use **Aprovar selecionados**.

**Editar** muda data, hora, paciente, PG, tipo, "agendado com", turma e observações de um agendamento que ainda não subiu (integrados e cancelados não são editáveis). Se o agendamento tinha dado erro na integração (ou paciente não encontrado), salvar a edição limpa o status e ele volta para a fila.

A coluna `Chave` guarda a identidade do agendamento no OdontoSig (Unidade + Data + Hora + PG + Nome + Agendado com, no momento da coleta) e não muda com a edição: coletar de novo o mesmo período acha a mesma linha, sem duplicar. Numa linha editada no app, a coleta só atualiza o cancelamento — as outras mudanças do OdontoSig não desfazem a edição. Colunas novas: `Aprovado`, `Editado em` e `Chave`.

### Integrar no Clínica nas Nuvens

Painel **Integrar no Clínica nas Nuvens**, na mesma tela. Agenda os agendamentos **aprovados** que ainda não têm `Status integração` e não estão cancelados, unidade por unidade (`cnn_agenda.CLINICAS` liga a unidade do OdontoSig à clínica do Clínica nas Nuvens). Cada Tipo do OdontoSig agenda de um jeito, configurado em `cnn_agenda.TIPOS`. Prontos:

| Tipo do OdontoSig | Fluxo | Tipo de atendimento | Procedimento |
|---|---|---|---|
| TRIAGEM | agenda livre | Triagem Geral - 10 minutos | Atendimento Triagem |
| TRIAGEM DIRECIONADA | reserva da turma | Triagem direcionada - 30 min | 1ª opção de "triagem direcionada" |
| TRATAMENTO | reserva da turma | Tratamento - 1h | sem procedimento |
| CENTRO CIRURGICO | reserva da turma | Centro Cirúrgico - 4h | sem procedimento |
| CLINICA APOIO | agenda livre | Clinica de Apoio - 15 min | sem procedimento |

Falta: RADIOLOGIA.

**TRIAGEM** (agenda livre):

1. `/agenda/index` → **Adicionar** → **Agendamento**.
2. Tipo de atendimento *Triagem Geral - 10 minutos*.
3. Paciente buscado pelo **nome** (igual ao do banco; se não existir, a linha fica `paciente não encontrado` e nada é agendado).
4. Profissional = *Agendado com* (a opção igual, senão a 1ª da lista).
5. Convênio *GRUPO MANDIC*, se não vier preenchido (confirma "Vincular plano" se abrir).
6. Procedimento *Atendimento Triagem*.
7. Data, horário inicial = Hora e horário final = Hora + 15 min.
8. Observação "Atendimento Migrado: Confira os detalhes antes de seguir." → **Agendar**.

**TRIAGEM DIRECIONADA** (dentro da reserva da turma):

1. `/agenda/index` → filtro de pesquisa **Turma** → digita a turma do OdontoSig e pega a 1ª opção (se o nome inteiro não achar nada, tenta pelo código, ex.: `8514/25`). Sem opção: erro "turma não está disponível no filtro".
2. Na lista da turma (próximas ou anteriores, conforme a data), pega a reserva do dia cujo horário cobre Hora até Hora + 15 min. Sem reserva: erro "turma não tem horários".
3. **Adicionar agendamento** na reserva → tipo *Triagem direcionada - 30 min* → tira a cadeira.
4. Aluno: o OdontoSig não traz o aluno (o "Agendado com" é o coordenador); o robô tenta esse nome e, sem opção igual, deixa o campo vazio.
5. Paciente pelo nome, convênio GRUPO MANDIC, procedimento: a 1ª opção para "triagem direcionada".
6. Horário inicial = Hora, final = Hora + 15 min; observação padrão + "Observações do OdontoSig: ..." → **Agendar**.

O status é gravado logo depois de cada agendamento: `integrado`, `paciente não encontrado` ou `erro` (com o motivo em `Mensagem integração`). Linhas com status não são integradas de novo; para tentar outra vez, apague o status no banco. Se o sistema mostrar um aviso ao agendar (horário ocupado, por exemplo), o robô não confirma nada: marca `erro` com o texto do aviso.

## Segurança do banco

- **Gravação atômica:** cada gravação vai primeiro para um arquivo temporário e só depois substitui o banco, então uma queda no meio não corrompe o arquivo.
- **Excel aberto:** com o banco aberto no Excel, o app não grava nem inicia integrações, e mostra um aviso. Senão, ao salvar no Excel, a versão dele escreveria por cima do que o app gravou.
- **Histórico:** o robô registra cada Status no histórico antes de gravar no banco. Se a gravação falhar, a integração para em vez de reiniciar e cadastrar em dobro. Na próxima integração, o Status perdido é recuperado do histórico.
- **Linhas mudadas de lugar:** se as linhas do banco mudarem de posição durante a integração, o robô procura o plano certo pela clínica, PG e perfil.
- **Senhas lembradas:** a opção "Lembrar login e senhas" guarda as senhas no Keychain (Mac) ou com a proteção do Windows (DPAPI). O `app_config.json` nunca tem senha em texto puro, e o pacote gerado pelo `empacotar.py` não leva as senhas.
- **Backups:** o app faz backup do banco ao abrir, antes de importar e antes de integrar.

O código procura os dados em `../dados`. Para usar outra pasta de dados, defina a variável `PLANOS_DADOS`.

## Entregar para outra pessoa

```bash
.venv/bin/python3 ferramentas/empacotar.py              # leva o banco atual
.venv/bin/python3 ferramentas/empacotar.py --sem-banco  # banco vazio
```

Gera `dist/Planos de Tratamento.zip`. No Windows não precisa instalar nada além do Google Chrome: o Python vai junto, na pasta `python/`.
