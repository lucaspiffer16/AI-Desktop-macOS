## Gate obrigatório de sincronização antes de push

Antes de qualquer `push`:

- executar `git fetch`
- validar divergência da branch local com a branch remota de tracking
- se estiver atrás/divergente, sincronizar antes de prosseguir

Comandos de referência:

```bash
git fetch
git status -sb
git rev-list --left-right --count @{upstream}...HEAD
```

Se falhar:

- não fazer `push`
- informar estado de divergência
- orientar próximo passo

## Worktree: considerações

No diretório do worktree, fetch/sync funciona normalmente.

Cada worktree tem seu próprio:

- index (git status isolado)
- working directory
- HEAD independente

Para sincronizar a branch de origem ou o alvo atual da promoção:

```bash
git fetch origin <branch-de-referencia>
git rebase origin/<branch-de-referencia>  # ou merge, conforme preferência do projeto
```

## Confirmação explícita de push

Pergunta obrigatória antes do push:

- `Confirmar push agora?`

Regra:

- sem confirmação explícita do usuário, não executar `git push`

Comando de referência (somente após confirmação explícita):

```bash
git push
```

## Resumo obrigatório após comandos

Após comandos relevantes, sempre retornar:

- comando executado
- status (`ok` ou `falhou`)
- resultado principal em uma linha
- próximo passo em caso de falha

Regras:

- não omitir falhas
- manter resumo objetivo
- agrupar comandos relacionados quando fizer sentido
