---
title: Modular Domains
aliases: []
tags: [tech/architecture, tech/domain, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Modular Domains

- Application
- Core Domain
- Provider
- Conversation
- Persistence
- Privacy
- Security
- Shared Infrastructure

## Domain Boundaries

- Application: bootstrapping, routing, global state.
- Core Domain: models, invariants, domain-level behaviors.
- Provider: capability negotiation, model listing, chat interface.
- Conversation: lifecycle, ordering, context association.
- Persistence: repositories, mapping, migrations.
- Privacy: UI masking behavior and shortcut reactions.
- Security: keychain reads/writes and sensitive data policy.
- Shared Infrastructure: logging, configuration, utilities.

## Coupling Constraints

- Domain modules expose protocols rather than concrete dependencies.
- Provider and persistence modules evolve independently.

## Related

- [[Architectural_Principles]]
- [[Provider_Abstraction]]
