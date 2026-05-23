## Gate técnico obrigatório

Executar validações compatíveis com o projeto antes de commit/push.

Exemplos:

- lint (`npm run lint`, `ruff check`, `golangci-lint run`)
- testes (`npm test`, `pytest`, `go test ./...`)
- build/typecheck (`npm run build`, `npm run tsc`, `mvn test`, `docker build .`)

Base mínima recomendada para Node/container:

- `npm run build`
- `docker build .`

Comandos de referência:

```bash
npm run lint
npm test
npm run build
docker build .
```

Se qualquer etapa falhar:

- não commitar
- não fazer push
- corrigir e reexecutar

## Gate de segurança obrigatório

Executar também verificações de segurança compatíveis com o stack:

- vulnerabilidades de dependências (`npm audit`, `pnpm audit`, `pip-audit`)
- SAST quando disponível (`semgrep scan`, `sonar-scanner`, `codeql`)
- secrets scan (`gitleaks detect`, `trufflehog git file://.`)

Comandos de referência:

```bash
npm audit
semgrep scan
gitleaks detect
```

Regras:

- adaptar comandos ao projeto
- se ferramenta não existir, informar limitação e sugerir adoção
- com falha de segurança, bloquear commit e push

## Changelog

Atualizar `CHANGELOG.md` em `[Não lançado]` no idioma da conversa.

Seções:

- `### Adicionado`
- `### Alterado`
- `### Corrigido`
- `### Removido`
- `### Segurança`
