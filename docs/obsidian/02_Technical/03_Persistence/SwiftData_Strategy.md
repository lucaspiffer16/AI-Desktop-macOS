---
title: SwiftData Strategy
aliases: []
tags: [tech/persistence, plan/adr, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# SwiftData Strategy

SwiftData is the official MVP persistence choice for providers, conversations, messages, settings, and privacy preferences.

This decision trades advanced query flexibility for faster implementation and better native integration in early stages.

## Constraints

- API keys remain in Keychain only.
- Persistence design should remain migration-ready.

## Related

- [[Keychain_Policy]]
- [[Cloud_Sync_Out_of_Scope]]
- [[ADR-0001-SwiftData-for-MVP]]
