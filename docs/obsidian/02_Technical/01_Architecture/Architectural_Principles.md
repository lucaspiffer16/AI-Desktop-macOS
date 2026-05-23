---
title: Architectural Principles
aliases: []
tags: [tech/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Architectural Principles

- Provider abstraction.
- Persistence isolation.
- Privacy isolation.

## Practical Rules

- Provider abstraction: normalize request and response semantics across vendors.
- Persistence isolation: repositories hide storage details from UI and provider adapters.
- Privacy isolation: mode switching logic is centralized and testable.

## Anti-Patterns to Avoid

- Injecting provider-specific parsing into views.
- Mixing keychain and persistence responsibilities.
- Treating privacy modes as cosmetic-only features.

## Related

- [[Architectural_Contracts]]
- [[Product_Principles]]
- [[Requirement_to_Architecture_Map]]
