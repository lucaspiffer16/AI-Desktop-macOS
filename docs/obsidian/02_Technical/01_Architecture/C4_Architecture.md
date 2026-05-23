---
title: C4 Architecture
aliases: ["C4 Model"]
tags: [tech/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# C4 Architecture

## Context (L1)

```mermaid
flowchart LR
  User[User on macOS] --> App[AI Desktop macOS]
  App --> OpenAI[OpenAI-Compatible APIs]
  App --> Ollama[Ollama Local Endpoint]
  App --> LMStudio[LM Studio Local Endpoint]
  App --> Keychain[macOS Keychain]
  App --> SwiftData[Local SwiftData Store]
```

## Container (L2)

```mermaid
flowchart TB
  subgraph App[AI Desktop macOS]
    UI[SwiftUI UI]
    VM[ViewModels]
    Provider[Provider Abstraction Layer]
    Services[Services: Networking, Persistence, Security, Privacy]
    Store[SwiftData Repositories]
    Secure[Keychain Adapter]
  end
  UI --> VM --> Provider
  VM --> Services
  Services --> Store
  Services --> Secure
```

## Component (L3)

- UI Components: sidebar, conversation pane, composer, top bar.
- ViewModels: provider settings VM, conversation VM, privacy VM.
- Provider adapters: OpenAI-compatible adapter, Ollama adapter, LM Studio adapter.
- Infrastructure adapters: URLSession client, SwiftData repository, Keychain repository, shortcut manager.

## Boundary Rules

- UI only talks to ViewModels.
- ViewModels depend on abstractions, not concrete provider implementations.
- Provider adapters do not manage persistence directly.

## Related

- [[High_Level_Architecture]]
- [[Modular_Domains]]
- [[Provider_Abstraction]]
