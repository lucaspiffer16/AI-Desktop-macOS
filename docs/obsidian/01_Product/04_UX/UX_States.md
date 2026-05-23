---
title: UX States
aliases: []
tags: [ux/state, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# UX States

- Idle conversation state.
- Streaming state.
- Provider error state.
- Privacy active state.
- Restored state after privacy mode.

## Transition Model

- Idle -> Sending -> Streaming -> Completed
- Any active state -> Error (provider, auth, timeout, persistence, network)
- Any visible state -> Privacy Active -> Restored

## UX Requirements by State

- Streaming state must feel live and cancellable.
- Error state must preserve context and offer clear recovery.
- Restored state must return to previous conversation position.

## Related

- [[Error_Handling]]
- [[AC-006]]
- [[Performance_Requirements]]
