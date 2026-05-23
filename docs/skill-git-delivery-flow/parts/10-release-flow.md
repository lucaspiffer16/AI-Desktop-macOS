## Fluxo de release (sob demanda)

Executar somente quando o usuário pedir explicitamente para gerar release.

## Pré-condições

- autorização explícita do usuário para iniciar release
- `staging` contém apenas itens aprovados
- nenhuma feature experimental está presente na release
- build validada
- migrações revisadas
- versionamento atualizado
- versão e tag planejadas para a publicação

## Sequência obrigatória

1. confirmar quais itens aprovados compõem a release atual
2. validar que `staging` contém somente esses itens
3. criar PR formal de `staging` para `main`
4. após merge autorizado, criar a tag planejada em `main`
5. criar GitHub Release usando o changelog

## Regras críticas

- sem pedido explícito, não iniciar release
- release oficial acontece por `staging` -> `main`
- `homolog` nunca gera release diretamente
- tags oficiais devem ser criadas em `main`
- é estritamente proibido fechar PR para `main`
- é estritamente proibido fechar PR de release para `main`

Comandos de referência:

```bash
gh pr create --base main --head staging --title "release: <versao>" --body-file "/tmp/pr-body.md"
git switch main
git pull
git tag "v<major.minor.patch>"
git push origin "v<major.minor.patch>"
gh release create "v<major.minor.patch>" --target main --title "v<major.minor.patch>" --notes-file "CHANGELOG.md"
```

## Auditoria de release

Registrar no fechamento:

- itens incluídos na release
- URL do PR `staging` -> `main`
- tag criada em `main`
- URL da GitHub Release
