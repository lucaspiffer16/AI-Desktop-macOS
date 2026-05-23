---
title: Flow Start Conversation
aliases: []
tags: [flow/conversation, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Flow: Start Conversation

1. Open app.
2. Select provider and model.
3. Create conversation.
4. Send message.
5. Stream response.
6. Persist local history.

## Alternate Paths

- Provider is unavailable after selection.
- User cancels streaming mid-response.
- Conversation save fails and enters retry queue.

## Error States

- Network or timeout errors should preserve the draft input.
- Partial streamed content must remain visible if cancellation was user-initiated.
- Provider errors should include human-readable recovery actions.

## State Transitions

- `idle` -> `sending` -> `streaming` -> `complete`
- `streaming` -> `canceled` -> `idle`
- `sending|streaming` -> `error` -> `idle`

## Related

- [[AC-003]]
- [[AC-004]]
- [[Conversation_Domain]]
- [[UX_States]]
