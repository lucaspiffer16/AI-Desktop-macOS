## Convenção de branch

Padrão segmentado recomendado:

- `<tipo>/<contexto-curto>`
- `<tipo>/<id-issue>/<contexto-curto>`
- `<tipo>/<id1-id2>/<contexto-curto>`

Tipos:

- `feature`, `bugfix`, `hotfix`, `refactor`, `chore`, `docs`, `test`, `build`, `ci`

Regra de mapeamento:

- `refactor`, `chore`, `docs`, `test`, `build` e `ci` seguem a regra de origem de `feature/*`, salvo convenção explícita diferente do projeto

Regras:

- usar `kebab-case`
- manter curto e descritivo
- respeitar idioma da conversa
- quando houver issue única associada, incluir o ID se isso for identificável sem ambiguidade, ex.: `feature/02/pagamento-cartao`
- quando houver múltiplas issues associadas, agregar IDs no segundo segmento, ex.: `bugfix/02-03/correcao-opacity`
- se não houver issue adequada ou houver ambiguidade, omitir o segmento de IDs até confirmação

## Origem das branches

Regras fixas deste fluxo:

- `feature/*` nasce de `main`
- `bugfix/*` nasce de `main`
- `hotfix/*` nasce de `main`
- `refactor/*`, `chore/*`, `docs/*`, `test/*`, `build/*` e `ci/*` nascem de `main`

## Criação de branch como worktree (PADRÃO)

Toda branch de trabalho é criada como worktree em diretório separado.

### Fluxo obrigatório

1. Confirmar tipo, issue ou issues e contexto
2. Gerar nome da branch segmentada
3. Gerar path do worktree: `../<tipo>-<ids-opcional>-<contexto>`
4. Criar worktree a partir de `main`:

```bash
git worktree add -b <tipo>/<ids-opcional>/<contexto> ../<tipo>-<ids-opcional>-<contexto> main
```

5. Informar caminho do worktree no chat
6. Usuário navega para o novo diretório
7. Trabalhar normalmente no diretório isolado

### Comandos de referência

```bash
# Listar worktrees existentes
git worktree list

# Criar worktree com nova branch
git worktree add -b <branch> ../<path> main

# Criar worktree para branch existente
git worktree add ../<path> <branch-existente>

# Remover worktree
git worktree remove ../<path>

# Limpeza de worktrees órfãos
git worktree prune
```

### Regras

- nunca criar worktree dentro do repo principal
- nome do diretório = `<tipo>-<ids-opcional>-<contexto>` (sem `/`, kebab-case)
- ao finalizar entrega, remover worktree após merge do PR

### Exceção: branch temporária ou rápida

Se o usuário quiser apenas algo rápido (ex.: ver um arquivo, ajuste pequeno), permitir criar branch normal sem worktree mediante confirmação explícita.

```bash
git switch main
git switch -c <tipo>/<ids-opcional>/<contexto>
```

- documentar motivo no chat
- não é o padrão recomendado

## Manutenção de worktrees

Comandos para gerenciar worktrees órfãos ou finalizados.

### Listar worktrees

```bash
git worktree list
```

### Remover worktree específica

```bash
git worktree remove ../<path>
```

### Limpeza de worktrees órfãos

```bash
git worktree prune
```

Executar quando:

- branch foi deletada remotamente mas worktree local existe
- worktree aponta para commit que não existe mais
- usuário pediu limpeza geral

## Gate de branch antes de commit/push

- se branch atual for `main`, interromper fluxo imediatamente
- se branch atual for `homolog`, interromper fluxo imediatamente
- se branch atual for `staging`, interromper fluxo imediatamente
- criar ou usar branch de trabalho e só então continuar

Comandos de referência (quando não usar worktree):

```bash
git branch --show-current
git switch main
git switch -c <tipo>/<id-ou-ids-opcional>/<contexto-curto>
```

## Estilo de commit

O estilo escolhido no início da conversa vale para toda a entrega.

### Conventional Commits

Formato:

```text
<type>(<scope-opcional>): <descrição curta no imperativo>
```

Tipos recomendados:

- `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`

### Gitmoji

Formato:

```text
:gitmoji: <descrição curta no imperativo>
```

ou

```text
:gitmoji: (<scope>) <descrição curta>
```

## Regras gerais de commit

- assunto objetivo e curto
- idioma igual ao combinado
- sem commit se validações ou gates estiverem falhando
