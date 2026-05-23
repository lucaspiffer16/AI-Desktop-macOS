## Descoberta de padrão do projeto

Executar esta etapa somente quando `.context/git-preferences.json` estiver ausente ou incompleto.

Objetivo:

- detectar padrões existentes do repositório
- preencher preferências locais sem inventar convenções fora da skill

## O que detectar

- estilo de commit predominante (`conventional` ou `gitmoji`)
- padrão de branch predominante suportado pela skill
- uso opcional de IDs de issue no nome da branch
- branches canônicas disponíveis (`main`, `homolog`, `staging`)
- branch default do GitHub

Comandos de referência:

```bash
git branch --all
git log --oneline -n 30
gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'
```

## Regras de naming a detectar

Detectar se o projeto já usa uma destas formas:

- `feature/<contexto-curto>`
- `feature/<id>/<contexto-curto>`
- `feature/<id1-id2>/<contexto-curto>`
- `bugfix/<contexto-curto>`
- `bugfix/<id>/<contexto-curto>`
- `bugfix/<id1-id2>/<contexto-curto>`
- `hotfix/<contexto-curto>`

Regra:

- se houver issue única associada ao trabalho, usar o ID automaticamente quando isso for identificável
- se houver múltiplas issues associadas ao mesmo trabalho, usar o segmento agregado, ex.: `02-03`
- se houver ambiguidade, confirmar no chat antes de nomear a branch

## Registro no contexto

Persistir em `.context/git-preferences.json`:

- `commitStyle`
- `language`
- `canonicalBranches` (`main`, `homolog`, `staging`)
- `baseBranches.feature = main`
- `baseBranches.bugfix = main`
- `baseBranches.hotfix = main`
- `projectPatterns` (padrões detectados)
- `promotionFlow = ["homolog", "staging", "main"]`
- `discoveryCompleted: true`

## Regras

- se a branch default não for `main`, informar no chat
- não sobrescrever preferências completas sem confirmação do usuário
- não detectar `develop` como branch canônica deste fluxo
