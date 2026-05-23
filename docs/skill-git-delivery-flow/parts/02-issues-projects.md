## Descoberta inicial de trabalho

Após bootstrap, consultar itens do trabalho atual.

## Issues do repositório atual

Comando base:

```bash
gh issue list --assignee @me --state open
```

Regras:

- exibir resumo curto (número, título, estado)
- se não houver issues atribuídas, informar claramente

## Projects do owner atual

Consultar itens abertos relacionados ao repositório atual, incluindo draft issues.

Regras de apresentação:

- identificar draft com prefixo `[DRAFT]`
- exibir tipo, título, status, prioridade e tamanho quando existir
- perguntar qual item deve ser priorizado

Se falhar por permissão:

- informar bloqueio de Project
- seguir com o fluxo local sem bloquear desenvolvimento

## Governança de status no Project

Quando houver item vinculado ao trabalho:

- iniciar implementação: status equivalente a `In progress`
- abrir PR para `homolog`: status equivalente a `In review`
- aprovação para `staging`: manter status equivalente ao processo de revisão vigente
- conclusão validada: status equivalente a `Done`

Regras:

- respeitar nomenclatura existente do Project
- reportar no resumo de comandos qualquer falha de atualização

Comando de referência para atualização de status (ajustar IDs):

```bash
gh project item-edit --id <item-id> --project-id <project-id> --field-id <status-field-id> --single-select-option-id <option-id>
```

## Criação obrigatória de issue (quando necessário)

Se não existir issue adequada, criar issue antes de branch, commit ou PR.

Passos:

1. confirmar repositório e escopo
2. definir título objetivo
3. preencher body com template desta seção
4. criar com `gh issue create`
5. aplicar metadados (`--assignee`, `--label`, `--milestone`) quando aplicável
6. vincular ao Project, quando houver

Template de issue:

```md
## Contexto

Descreva o problema/oportunidade e impacto atual.

## Objetivo

Descreva o resultado esperado da entrega.

## Escopo inicial

-
-

## Critérios de aceite

-
-
```

Comandos de referência:

```bash
gh issue create --title "<titulo>" --body-file "/tmp/issue.md" --assignee @me
gh issue create --title "<titulo>" --body "<template-preenchido>" --assignee @me --label enhancement
gh project item-add <project-number> --owner <owner> --url <issue-url>
```

Regras:

- não duplicar issues; verificar similares abertas antes
- se houver `[DRAFT]` equivalente no Project, converter para issue em vez de duplicar
- após criar, informar número, título e URL no chat

## Padrão de comentários em issue

Manter rastreabilidade da execução com comentários curtos na issue quando aplicável.

### 1) Início de trabalho

Quando a issue for priorizada para execução, comentar:

- que o trabalho foi iniciado
- branch de trabalho associada
- escopo curto do que será entregue

Modelo:

```text
Estou iniciando a implementação desta issue.
Branch: <tipo>/<id-ou-ids-opcional>/<contexto-curto>
Escopo desta entrega: <resumo em 1-2 linhas>
```

### 2) Validação em homolog

Quando a branch for promovida para `homolog`, comentar:

- que a promoção para `homolog` foi realizada
- link do PR para `homolog`
- status resumido dos checks

Modelo:

```text
Eu promovi esta entrega para homolog.
PR para homolog: <url-do-pr>
Checks: lint <ok/falhou> | testes <ok/falhou> | build <ok/falhou> | segurança <ok/falhou>
```

### 3) Aprovação para staging

Após confirmação explícita do desenvolvedor, comentar:

- que a validação em `homolog` foi concluída
- que eu recebi aprovação explícita para promover a branch para `staging`
- escopo aprovado

Modelo:

```text
Eu concluí a validação desta entrega em homolog.
Eu recebi aprovação explícita do desenvolvedor para promover esta branch para staging.
Escopo aprovado: <resumo curto>
```

### 4) Bloqueio

Se houver impedimento técnico/negocial, comentar:

- motivo objetivo do bloqueio
- impacto no prazo/escopo
- próximo passo para destravar

Modelo:

```text
Eu identifiquei o seguinte bloqueio: <causa objetiva>.
Impacto: <prazo/escopo>.
Próximo passo: <ação necessária + responsável, quando aplicável>.
```

### 5) Conclusão

Ao abrir PR vinculado para `staging`, `main` ou concluir o fluxo, comentar:

- link do PR
- status resumido dos checks
- observações relevantes de risco/rollback quando houver

Modelo:

```text
Eu concluí esta etapa da entrega.
PR: <url-do-pr>
Checks: lint <ok/falhou> | testes <ok/falhou> | build <ok/falhou> | segurança <ok/falhou>
Risco/Rollback: <curto, se aplicável>
```

Regras:

- usar idioma escolhido no chat
- manter comentários objetivos e verificáveis
- não publicar dados sensíveis, segredos ou credenciais
- se houver mais de uma issue relacionada ao mesmo trabalho, comentar em todas

Comandos de referência para comentários:

```bash
gh issue comment <numero-da-issue> --body "Estou iniciando a implementação desta issue."
gh issue comment <numero-da-issue> --body "Eu promovi esta entrega para homolog."
gh issue comment <numero-da-issue> --body "Eu recebi aprovação explícita do desenvolvedor para promover esta branch para staging."
gh issue comment <numero-da-issue> --body "PR: <url-do-pr>"
```

## Decisão de issue adequada (3 passos)

Aplicar esta decisão antes de criar uma nova issue.

### Passo 1: Reaproveitar issue existente

Reaproveitar issue aberta quando todos os critérios abaixo forem atendidos:

- mesmo objetivo principal
- escopo inicial com alta sobreposição (aprox. 70% ou mais)
- critérios de aceite compatíveis sem reescrever completamente
- issue no repositório correto
- issue não está concluída (`Done`) nem fechada

Se atender, usar a issue existente e seguir o fluxo.

### Passo 2: Converter `[DRAFT]` equivalente

Se não houver issue adequada no passo 1, verificar itens `[DRAFT]` no Project.

Converter `[DRAFT]` para issue quando:

- o draft representa o mesmo objetivo da entrega
- o escopo é suficiente para iniciar implementação
- a conversão evita abrir issue duplicada

Após converter, usar a issue gerada como referência oficial.

### Passo 3: Criar issue nova

Criar issue nova somente quando os passos 1 e 2 não forem atendidos.

Regras finais:

- usar o template obrigatório desta skill
- aplicar metadados mínimos (`assignee`, labels e milestone quando aplicável)
- retornar no chat o resultado da decisão: `reaproveitada`, `convertida de [DRAFT]` ou `nova criada`
