---
title: Global Shortcuts
aliases: []
tags: [tech/runtime, tech/privacy, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Global Shortcuts

Required shortcuts:

- Open app
- Privacy mode
- Hide window

## Behavioral Requirements

- Shortcut handling must work when app is backgrounded as allowed by macOS policy.
- Trigger latency should be minimal and predictable.
- Conflicts with system/global shortcuts must be detectable and configurable.

## Validation Focus

- Verify shortcut registration lifecycle on app launch/relaunch.
- Verify privacy shortcut behavior under active streaming.

## Related

- [[Flow_Privacy_Mode]]
- [[AC-005]]
