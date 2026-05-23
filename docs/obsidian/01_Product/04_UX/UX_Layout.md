---
title: UX Layout
aliases: []
tags: [ux/layout, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# UX Layout

- Left sidebar: conversations, search, pinned chats.
- Main area: messages, streaming responses, composer.
- Top bar: provider, model, privacy toggle, settings.

## Interaction Priorities

- Conversation context must remain visually stable during streaming.
- Provider/model controls must remain visible for quick switching.
- Privacy controls require immediate discoverability.

## Layout Constraints

- Sidebar must support rapid conversation switching and pinned context.
- Main area prioritizes readability and incremental rendering.
- Top bar should not become overloaded with non-MVP controls.

## Related

- [[UX_States]]
- [[Flow_Start_Conversation]]
- [[Flow_Privacy_Mode]]
