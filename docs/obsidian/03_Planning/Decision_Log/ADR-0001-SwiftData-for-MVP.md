---
title: ADR-0001 SwiftData for MVP
aliases: []
tags: [plan/adr, tech/persistence, status/accepted]
status: accepted
source: "[[PRD_TechnicalSpec_Original]]"
---

# ADR-0001: SwiftData for MVP Persistence

## Context

Need native local persistence with low implementation overhead.

## Decision

Use SwiftData as MVP persistence layer.

## Consequences

- Faster delivery and stronger SwiftUI alignment.
- Keep secrets out of SwiftData (Keychain only).
- Re-evaluate for SQLite/GRDB if advanced query constraints emerge.

## Related

- [[SwiftData_Strategy]]
- [[Future_Migration_SQLite_GRDB]]
