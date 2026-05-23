---
title: Flow Privacy Mode
aliases: []
tags: [flow/privacy, tech/privacy, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Flow: Privacy Mode

1. Press global shortcut.
2. App hides, blurs, or minimizes content.
3. Exit privacy mode.
4. Restore previous state.

## Alternate Paths

- Shortcut is pressed while app is unfocused.
- Privacy mode is toggled repeatedly in short intervals.
- Restore fails due to changed window context and falls back to safe default layout.

## Error States

- If preferred privacy mode fails, fallback to hide mode.
- Shortcut conflicts should surface a settings warning.

## State Transitions

- `normal` -> `privacy-active` -> `restoring` -> `normal`
- `privacy-active` -> `fallback-hide` when blur/compact cannot be applied.

## Related

- [[AC-005]]
- [[AC-006]]
- [[Privacy_Limitations]]
- [[Global_Shortcuts]]
