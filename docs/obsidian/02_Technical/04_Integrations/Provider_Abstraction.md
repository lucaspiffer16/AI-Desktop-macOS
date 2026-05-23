---
title: Provider Abstraction
aliases: []
tags: [tech/integration, tech/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Provider Abstraction

Defines a unified interface for model listing, chat, streaming, capability detection, and provider-specific configuration.

## Minimum Interface Contract

- `listModels(providerConfig) -> [Model]`
- `sendMessage(conversationContext, message) -> Response`
- `streamMessage(conversationContext, message) -> AsyncSequence<TokenEvent>`
- `detectCapabilities(providerConfig) -> CapabilitySet`

## Error Surface

- AuthError
- TimeoutError
- ConnectivityError
- ProviderResponseError
- UnsupportedCapabilityError

## Design Notes

- Capability negotiation should drive UI affordances.
- Local and remote providers must expose equivalent high-level behaviors.

## Related

- [[OpenAI_Compatible]]
- [[LM_Studio]]
- [[Ollama]]
- [[Architectural_Contracts]]
- [[Provider_Contract_Spec]]
