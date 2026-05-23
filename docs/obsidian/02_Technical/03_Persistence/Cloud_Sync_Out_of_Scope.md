---
title: Cloud Sync Out of Scope
aliases: []
tags: [tech/persistence, mvp/scope/out, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Cloud Sync Out of Scope

Cloud synchronization is excluded from MVP. CloudKit should not be enabled in initial implementation.

## Why Deferred

- Reduces synchronization complexity and conflict handling overhead.
- Keeps debugging focused on local correctness first.
- Avoids early coupling with account/cloud assumptions.

## Guardrails

- Persistence abstractions should not hardcode CloudKit behavior.
- Deferred sync references must stay in roadmap notes, not MVP tasks.

## Related

- [[Future_Migration_SQLite_GRDB]]
- [[Roadmap_Phases]]
- [[MVP_Scope_Out]]
