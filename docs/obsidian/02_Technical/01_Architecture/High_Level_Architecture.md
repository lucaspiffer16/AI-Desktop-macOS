---
title: High Level Architecture
aliases: []
tags: [tech/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# High-Level Architecture

- App Layer
- UI Layer
- ViewModels
- Services
- Provider Layer
- Persistence Layer
- Security Layer
- Privacy Layer

## Responsibility Split

- App Layer: lifecycle, scene composition, dependency wiring.
- UI Layer: rendering and interaction handling only.
- ViewModels: orchestration and state transitions.
- Services: side effects (network, persistence, keychain).
- Provider Layer: vendor-independent AI operations.
- Persistence Layer: local storage and query behavior.
- Security Layer: secrets and sensitive operations.
- Privacy Layer: visual privacy modes and shortcut triggers.

## Boundary Rules

- UI and ViewModels must not call vendor-specific adapters directly.
- Security and privacy concerns cannot be implemented as ad-hoc UI hacks.

## Related

- [[Modular_Domains]]
- [[Architectural_Contracts]]
