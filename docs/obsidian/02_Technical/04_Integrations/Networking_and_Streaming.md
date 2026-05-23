---
title: Networking and Streaming
aliases: []
tags: [tech/networking, tech/streaming, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Networking and Streaming

- Use URLSession.
- Use async/await.
- Stream responses progressively.
- UI updates incrementally and supports cancellation.

Streaming is a product-critical behavior and should be validated against smooth rendering, cancellation responsiveness, and error recovery.

## Runtime Contract

- Never block main thread for stream parsing.
- Emit ordered token events and explicit completion/cancel/error signals.
- Cancellation must propagate from UI to network task immediately.

## Failure Handling

- Timeout and network failures classify into user-actionable messages.
- Partial outputs are retained when logically safe.
- Retry behavior should avoid duplicate assistant messages.

## Related

- [[AC-003]]
- [[Error_Handling]]
- [[Performance_Requirements]]
- [[Sequence_Streaming]]
- [[State_Machines]]
