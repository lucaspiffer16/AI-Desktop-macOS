---
title: Architectural Contracts
aliases: []
tags: [tech/architecture, trace/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Architectural Contracts

- UI cannot depend on vendor APIs directly.
- New providers should be added with minimal impact.
- Local and remote providers should present consistent UX behavior.
- Provider layer supports model listing, chat, streaming, capabilities, config.

These contracts are non-negotiable boundaries that prevent vendor lock-in and reduce coupling between UI, networking, and persistence.

## Related

- [[Provider_Abstraction]]
- [[OpenAI_Compatible]]
