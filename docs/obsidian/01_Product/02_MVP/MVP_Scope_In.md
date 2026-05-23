---
title: MVP Scope In
aliases: []
tags: [mvp/scope/in, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Included in MVP

- Provider management.
- Supported providers: OpenAI-compatible, LM Studio, Ollama.
- Conversation lifecycle + streaming.
- Privacy modes and shortcuts.
- Security via Keychain.
- Native SwiftUI desktop UX.

This scope defines strict MVP boundaries and should be treated as the implementation baseline for milestones, acceptance, and traceability.

## Boundary Rules

- New feature requests must map to an existing MVP deliverable or be deferred.
- Any feature without direct AC coverage is out of MVP by default.
- Security and privacy controls are first-class MVP features, not polish.

## Dependencies

- Provider management depends on [[Provider_Abstraction]].
- Streaming UX depends on [[Networking_and_Streaming]].
- Secure persistence depends on [[SwiftData_Strategy]] and [[Keychain_Policy]].

## Related

- [[MVP_Scope_Out]]
- [[MVP_Deliverables]]
- [[Requirement_to_Acceptance_Map]]
- [[Delivery_Plan_MVP]]
