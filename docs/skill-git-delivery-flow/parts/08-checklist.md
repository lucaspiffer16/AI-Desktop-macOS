## Checklist rápido de entrega

- [ ] descoberta de padrão do projeto executada quando `.context/git-preferences.json` estava ausente ou incompleto
- [ ] `git` e `gh` validados no início
- [ ] `gh auth status` validado no início
- [ ] issues atribuídas consultadas no repo atual
- [ ] itens de Project consultados (com `[DRAFT]` identificado)
- [ ] usuário escolheu item para priorização
- [ ] issue criada via `gh` quando não havia issue adequada
- [ ] preferências salvas em `.context/git-preferences.json`
- [ ] branch de trabalho usada e fora de `main`, `homolog` e `staging`
- [ ] branch de trabalho criada da base correta (`staging` para feature/bugfix e `main` para hotfix)
- [ ] branch criada como worktree (padrão) ou exceção justificada
- [ ] diretório do worktree informado no chat
- [ ] usuário navegou para o diretório correto (quando worktree)
- [ ] ID da issue incluído na branch quando aplicável e sem ambiguidade
- [ ] comentários de issue registrados (início, homolog, aprovação para staging, bloqueio, conclusão) quando aplicável
- [ ] status do Project atualizado (`In progress`, `In review`, `Done`) quando aplicável
- [ ] `CHANGELOG.md` atualizado
- [ ] lint, testes e build verdes
- [ ] `npm run build` e `docker build .` executados quando aplicáveis
- [ ] segurança validada (vulnerabilidades, SAST e secrets)
- [ ] sincronização remota validada antes do push
- [ ] confirmação explícita recebida antes do push
- [ ] PR formal criado para `homolog` quando a etapa exigir validação integrada
- [ ] quando branch nasceu de `staging`, alinhamento `staging`/`homolog` validado antes do PR da feature para `homolog`
- [ ] PR formal `staging` -> `homolog` criado quando alinhamento de base foi necessário
- [ ] validação em `homolog` concluída antes de promover para `staging`
- [ ] aprovação explícita do desenvolvedor recebida antes de promover para `staging`
- [ ] aprovação do desenvolvedor registrada em comentário na issue ou nas issues relacionadas
- [ ] PR formal criado para `staging` somente após aprovação explícita
- [ ] nenhum push direto em `main`, `homolog` ou `staging`
- [ ] resumo dos comandos executados foi apresentado
- [ ] PR segue template da skill
- [ ] PR vinculado à issue (`Closes #...`) quando aplicável
- [ ] PR não foi fechado via CLI fora da exceção de release autorizada
- [ ] merge apenas após aprovação explícita
- [ ] quando houver stacked branch, dependência registrada no PR (`Depends on #<PR-A>`) e na issue
- [ ] worktree removida após merge do PR (quando aplicável)
- [ ] `git worktree prune` executado quando solicitado
- [ ] auditoria preenchida com link da issue (ou justificativa)
- [ ] auditoria preenchida com link do PR
- [ ] auditoria preenchida com resultado dos checks
- [ ] auditoria preenchida com resumo final e risco/rollback
- [ ] auditoria preenchida com path do worktree (ou N/A)

Checklist extra quando houver release:

- [ ] usuário autorizou fluxo de release
- [ ] todas as features e bugfixes da release foram aprovadas
- [ ] `staging` contém apenas itens aprovados
- [ ] nenhuma feature experimental entrou na release
- [ ] build validada
- [ ] migrações revisadas
- [ ] versionamento atualizado
- [ ] tag da release definida
- [ ] PR formal `staging` -> `main` criado
- [ ] tag criada em `main`

Checklist extra quando houver hotfix:

- [ ] hotfix nasceu da `main`
- [ ] correção validada
- [ ] testes executados
- [ ] PR formal `hotfix/*` -> `main` criado
- [ ] tag criada em `main`
- [ ] `staging` sincronizada após o merge do hotfix
- [ ] `homolog` sincronizada após o merge do hotfix
