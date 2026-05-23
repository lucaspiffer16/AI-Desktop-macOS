---
title: Privacy Layer Modes
aliases: []
tags: [tech/privacy, tech/runtime, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Privacy Layer Modes

- Blur Mode
- Compact Mode
- Hide Mode
- Capture Restriction Attempt (best effort)

## Mode Semantics

- Blur Mode: content remains spatially visible but unreadable.
- Compact Mode: sensitive message area is hidden/minimized.
- Hide Mode: app window is minimized/hidden quickly.
- Capture Restriction Attempt: advisory mitigation only.

## Fallback Policy

- If configured mode fails, fallback to Hide Mode.
- Restore behavior must preserve user context where possible.

## Related

- [[Privacy_Limitations]]
- [[AC-005]]
- [[AC-006]]
