---
title: State Machines
aliases: ["Runtime State Machines"]
tags: [tech/runtime, tech/streaming, tech/privacy, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# State Machines

## Conversation Streaming State

```mermaid
stateDiagram-v2
  [*] --> Idle
  Idle --> Sending: send message
  Sending --> Streaming: first token
  Sending --> Error: request fail
  Streaming --> Completed: end event
  Streaming --> Canceled: user cancel
  Streaming --> Error: stream fail
  Completed --> Idle
  Canceled --> Idle
  Error --> Idle: recover
```

## Privacy State

```mermaid
stateDiagram-v2
  [*] --> Normal
  Normal --> PrivacyActive: shortcut on
  PrivacyActive --> Restoring: shortcut off
  Restoring --> Normal
  PrivacyActive --> FallbackHide: mode apply fail
  FallbackHide --> Restoring
```

## State Invariants

- Only one streaming operation per conversation at a time.
- Privacy active state must prevent readable content exposure.
- Cancel operation cannot create duplicate assistant messages.

## Related

- [[Flow_Start_Conversation]]
- [[Flow_Privacy_Mode]]
- [[AC-003]]
- [[AC-005]]
- [[AC-006]]
