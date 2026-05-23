---
title: Future Migration SQLite GRDB
aliases: []
tags: [tech/persistence, plan/roadmap, status/draft]
status: draft
source: "[[PRD_TechnicalSpec_Original]]"
---

# Future Migration Option

If advanced querying is required, migrate persistence to SQLite, optionally using GRDB.

## Migration Triggers

- Query latency or memory behavior degrades with realistic history size.
- Complex query patterns exceed SwiftData capability or maintainability limits.

## Preparation Steps

- Keep domain models persistence-agnostic.
- Maintain repository interfaces stable for storage backend swap.
- Track migration risk in [[Risk_Register]].

## Related

- [[SwiftData_Strategy]]
- [[ADR-0001-SwiftData-for-MVP]]
