---
name: git-delivery-flow
description: Workflow modular de Git com descoberta de padrão do projeto, promoção controlada entre main, homolog e staging, validações técnicas/segurança, PR formal por etapa e release alinhada ao ciclo oficial.
metadata:
  language: pt-BR
  style: workflow
---

## Propósito

Padronizar entrega com Git em qualquer projeto, reduzindo erro operacional, evitando contaminação entre ambientes e mantendo rastreabilidade de validação, release e hotfix.

## Como usar este guia modular

Este arquivo é o roteador principal. Leia somente os módulos necessários para a etapa atual.

Ordem recomendada de leitura:

1. `parts/00-project-discovery.md`
2. `parts/01-bootstrap.md`
3. `parts/02-issues-projects.md`
4. `parts/03-branch-commit.md`
5. `parts/04-validation-security.md`
6. `parts/05-push-sync.md`
7. `parts/06-pr.md`
8. `parts/07-hotfix.md` (somente quando aplicável)
9. `parts/08-checklist.md`
10. `parts/09-auditoria.md`
11. `parts/10-release-flow.md` (somente quando usuário pedir release)

## Regras invioláveis

- proibido commit direto em `main`
- proibido commit direto em `homolog`
- proibido commit direto em `staging`
- proibido `push` direto em `main`
- proibido `push` direto em `homolog`
- proibido `push` direto em `staging`
- proibido promover `homolog` para `staging`
- proibido promover `homolog` para `main`
- proibido desenvolver diretamente em `main`
- proibido criar `hotfix` a partir de `staging`
- proibido fechar PR via `gh pr close`, exceto quando o fluxo de release autorizar fechamento de PR com base em `staging`
- proibido merge automático via `gh pr merge`
- nenhuma exceção operacional invalida estas regras

## Gates globais obrigatórios

- sem `git` e `gh` instalados, a skill não pode ser usada
- sem autenticação válida no `gh`, etapas de GitHub devem ser bloqueadas com aviso claro
- promoção para `homolog`, `staging` ou `main` exige PR formal
- promoção para `staging` exige confirmação explícita do desenvolvedor após validação em `homolog`
- a confirmação do desenvolvedor para `staging` deve ser registrada nos comentários da issue ou das issues relacionadas
- antes de `push`, sempre validar sincronização remota e pedir confirmação explícita
- após comandos relevantes, sempre apresentar resumo objetivo no chat

## Modelo canônico de branches

- `main`: produção
- `homolog`: validação integrada
- `staging`: construção controlada da próxima release

Regras:

- `feature/*` nasce de `main`
- `bugfix/*` nasce de `main`
- `hotfix/*` nasce de `main`
- `staging` recebe somente features e bugfixes aprovados
- `main` recebe somente release vinda de `staging` ou `hotfix` aprovado

## Modelo canônico de promoção

Fluxo esperado:

1. `feature/*` ou `bugfix/*` -> `homolog`
2. após aprovação explícita do desenvolvedor, a mesma branch -> `staging`
3. `staging` -> `main` no fluxo de release
4. `hotfix/*` -> `main`, com sincronização posterior para `staging` e `homolog`

## Modelo canônico de worktree

Toda branch de trabalho é criada como worktree em diretório separado.

- diretório padrão: `../<tipo>-<ids-opcional>-<contexto>`
- benefício: isolamento completo (node_modules, build, edits)
- ao finalizar, remover worktree após merge do PR

## Persistência de preferências

Salvar preferências da conversa em:

- `.context/git-preferences.json`

Formato:

```json
{
  "commitStyle": "conventional",
  "language": "pt-BR",
  "canonicalBranches": {
    "main": "main",
    "homolog": "homolog",
    "staging": "staging"
  },
  "baseBranches": {
    "feature": "main",
    "bugfix": "main",
    "hotfix": "main"
  },
  "projectPatterns": {
    "commitStyleDetected": "conventional",
    "branchNamingDetected": "segmented",
    "issueIdUsage": "optional-auto"
  },
  "promotionFlow": ["homolog", "staging", "main"],
  "discoveryCompleted": true,
  "updatedAt": "2026-04-15T00:00:00.000Z"
}
```

Valores aceitos:

- `commitStyle`: `conventional` | `gitmoji`
- `language`: `pt-BR` | `en`
- `projectPatterns.branchNamingDetected`: `segmented`
- `projectPatterns.issueIdUsage`: `optional-auto`

## Regra de versionamento do contexto local

Arquivos de contexto em `.context/` devem ser versionados no repositório.

Regras:

- manter apenas dados úteis ao fluxo de engenharia
- não armazenar segredos, tokens, credenciais ou dados sensíveis
- revisar alterações de `.context/` no PR como qualquer outro arquivo

## Escopo da escolha de idioma e estilo

O estilo de commit e idioma confirmados no início do chat valem para:

- nome de branch
- mensagem de commit
- título e corpo do PR
- texto do changelog
- comentários de issue

## Referência rápida por tarefa

- descoberta de padrão e branches do projeto: `parts/00-project-discovery.md`
- iniciar chat e validar ambiente: `parts/01-bootstrap.md`
- priorizar trabalho em issues/projects: `parts/02-issues-projects.md`
- branch, commit e worktree: `parts/03-branch-commit.md`
- qualidade e segurança: `parts/04-validation-security.md`
- sincronização e push: `parts/05-push-sync.md`
- criação de PR por etapa: `parts/06-pr.md`
- incidente urgente: `parts/07-hotfix.md`
- encerramento da entrega: `parts/08-checklist.md`
- registro de auditoria da entrega: `parts/09-auditoria.md`
- geração de release e PR para `main`: `parts/10-release-flow.md`
