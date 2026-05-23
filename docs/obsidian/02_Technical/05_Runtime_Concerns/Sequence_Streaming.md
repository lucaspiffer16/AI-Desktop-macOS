---
title: Sequence Streaming
aliases: ["Streaming Sequence"]
tags: [tech/streaming, tech/networking, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Sequence Streaming

## End-to-End Sequence

```mermaid
sequenceDiagram
  participant U as User
  participant UI as SwiftUI
  participant VM as ConversationVM
  participant P as Provider Adapter
  participant API as Provider Endpoint
  participant DB as SwiftData

  U->>UI: Send prompt
  UI->>VM: submit(message)
  VM->>DB: persist user message
  VM->>P: streamMessage(input)
  P->>API: open stream request
  API-->>P: token chunks
  P-->>VM: StreamEvent.tokenDelta
  VM-->>UI: update partial assistant text
  API-->>P: completion event
  P-->>VM: StreamEvent.completion
  VM->>DB: persist final assistant message
  VM-->>UI: mark completed
```

## Cancellation Sequence

- User cancels from UI.
- VM cancels stream task immediately.
- Partial assistant content is finalized with `streamState = canceled`.
- UI returns to idle and preserves draft context.

## Failure Sequence

- Provider/network error triggers unified error mapping.
- Partial content remains when safe.
- User gets retryable action if eligible.

## Related

- [[Networking_and_Streaming]]
- [[State_Machines]]
- [[Error_Model]]
