## Bootstrap obrigatório

Antes de qualquer ação de versionamento:

- validar `git --version`
- validar `gh --version`
- validar autenticação `gh auth status`

Se qualquer validação falhar:

- interromper o uso da skill
- informar claramente o item ausente/quebrado
- orientar instalação/configuração

Comandos de referência:

```bash
git --version
gh --version
gh auth status
```

## Abertura padrão do chat

Sempre iniciar com:

1. estilo de commit: `conventional` ou `gitmoji`
2. idioma: `pt-BR` ou `en`
3. operação desejada:
   - iniciar `feature`
   - iniciar `bugfix`
   - promover para `homolog`
   - promover para `staging`
   - executar `release`
   - iniciar `hotfix`

Mesmo com preferência salva no projeto, confirmar essas escolhas no início de todo chat.

Modelo sugerido:

```text
Antes de começarmos, confirme:
1) Estilo de commit: conventional ou gitmoji
2) Idioma: pt-BR ou en
3) Operação desejada: feature, bugfix, promover para homolog, promover para staging, release ou hotfix

Vou validar git/gh/autenticação, listar issues atribuídas e itens de Project (marcando [DRAFT] quando aplicável) e te pergunto qual item priorizar.
```

## Regra de identificação de issue

- quando houver issue única identificável para o trabalho, sugerir o uso automático do ID na branch
- quando houver múltiplas issues ligadas ao mesmo trabalho, sugerir o segmento agregado, ex.: `02-03`
- se houver ambiguidade entre issues ou contexto, confirmar no chat antes de criar a branch

## Regra de bloqueio

- sem bootstrap verde, não avançar para branch, commit, PR ou release
- sem confirmação explícita do usuário, não fazer push
- sem confirmação explícita do desenvolvedor após validação em `homolog`, não promover branch para `staging`
