## Auditoria mínima por entrega

Ao finalizar cada entrega, registrar os artefatos mínimos abaixo para histórico técnico e de incidentes.

Artefatos obrigatórios:

- tipo da operação (`homolog`, `staging`, `release`, `hotfix`)
- link da issue (ou justificativa explícita quando não existir)
- link do PR
- resultado dos checks principais (lint, testes, build, segurança)
- resumo final da entrega
- path do worktree utilizado (ou N/A se branch temporária)

Template de registro:

```md
## Auditoria da entrega

- Tipo: <homolog|staging|release|hotfix>
- Issue: <url-da-issue-ou-N/A-com-justificativa>
- PR: <url-do-pr>
- Checks: lint <ok/falhou> | testes <ok/falhou> | build <ok/falhou> | segurança <ok/falhou>
- Resumo final: <2-4 linhas sobre o que mudou e impacto>
- Risco/Rollback: <1-2 linhas>
- Worktree: <path-do-worktree-ou-N/A>
```

Regras:

- não encerrar o fluxo sem preencher os artefatos obrigatórios
- quando houver falha em check, registrar ação corretiva ou bloqueio
- manter o texto curto, objetivo e verificável
- registrar path completo do worktree para rastreabilidade

Campos extras quando houver release:

- tag criada em `main`
- URL da GitHub Release
- URL do PR `staging` -> `main`

Campos extras quando houver hotfix:

- tag criada em `main`
- confirmação da sincronização em `staging`
- confirmação da sincronização em `homolog`
