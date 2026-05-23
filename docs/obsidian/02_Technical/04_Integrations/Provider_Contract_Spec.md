---
title: Provider Contract Spec
aliases: ["Provider Interface Contract"]
tags: [tech/integration, tech/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Provider Contract Spec

## Protocol Shape (conceptual)

```swift
protocol AIProvider {
  func listModels(config: ProviderConfig) async throws -> [ProviderModel]
  func sendMessage(input: ChatInput, config: ProviderConfig) async throws -> ChatOutput
  func streamMessage(input: ChatInput, config: ProviderConfig) -> AsyncThrowingStream<StreamEvent, Error>
  func detectCapabilities(config: ProviderConfig) async -> CapabilitySet
}
```

## Shared DTOs

- `ProviderConfig`: baseURL, authRef, timeout, headers, providerType.
- `ChatInput`: conversationId, model, messages, temperature, maxTokens.
- `StreamEvent`: tokenDelta, usageSnapshot, completion, error.
- `CapabilitySet`: supportsStreaming, supportsSystemRole, supportsToolCalls (future).

## Contract Guarantees

- Streaming emits ordered deltas.
- Completion event is emitted exactly once on success.
- Provider-specific errors are mapped to unified error model.
- Adapters must be side-effect free regarding persistence.

## Versioning Rule

- Any contract-breaking change requires ADR and migration plan.

## Related

- [[Provider_Abstraction]]
- [[Error_Model]]
- [[OpenAI_Compatible]]
