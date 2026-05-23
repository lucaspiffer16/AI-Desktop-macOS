## Política explícita de hotfix

Para incidente urgente em produção, usar fluxo separado sem quebrar políticas invioláveis.

Branch:

- `hotfix/<contexto-curto>`

## Regras críticas

- hotfix nasce da `main`
- hotfix volta diretamente para `main`
- hotfix nunca deve depender de `staging`
- manter validações técnicas e de segurança antes de commit ou push
- abrir PR formal para `main` com contexto do incidente
- após merge em `main`, sincronizar a correção com `staging` e `homolog` por PR formal
- proibido fechar PR via CLI e proibido merge automático

## Fluxo obrigatório

1. criar `hotfix/*` a partir de `main`
2. implementar e validar a correção
3. abrir PR formal para `main`
4. após merge autorizado, criar tag em `main`
5. criar branch de sincronização a partir de `main` já corrigida
6. abrir PR formal dessa branch para `staging`
7. abrir PR formal dessa mesma branch para `homolog`

Comandos de referência:

```bash
git switch main
git switch -c "hotfix/<contexto-curto>"
git add <arquivos-relevantes>
git commit -m "fix(hotfix): <descricao-curta>"
git push -u origin "hotfix/<contexto-curto>"
gh pr create --base main --title "hotfix: <titulo>" --body-file "/tmp/pr-body.md"
git switch main
git pull
git switch -c "hotfix-sync/<contexto-curto>"
git push -u origin "hotfix-sync/<contexto-curto>"
gh pr create --base staging --head "hotfix-sync/<contexto-curto>" --title "hotfix sync: <titulo>" --body-file "/tmp/pr-body.md"
gh pr create --base homolog --head "hotfix-sync/<contexto-curto>" --title "hotfix sync: <titulo>" --body-file "/tmp/pr-body.md"
```

## Pós-incidente obrigatório

- registrar impacto, causa raiz e mitigação no PR ou changelog
- registrar decisão técnica de curto prazo adotada
- incluir plano de prevenção (testes, monitoramento) para evitar recorrência
- registrar na auditoria a sincronização com `staging` e `homolog`
