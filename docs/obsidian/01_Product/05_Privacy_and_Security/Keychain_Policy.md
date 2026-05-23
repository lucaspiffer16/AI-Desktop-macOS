---
title: Keychain Policy
aliases: []
tags: [tech/security, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Keychain Policy

API keys and secrets are stored exclusively in macOS Keychain. SwiftData must not contain raw API keys.

## Policy Rules

- Provider records store only key references or metadata, never raw key values.
- Keychain access failures must surface recoverable user guidance.
- Secret rotation should overwrite active credential path and invalidate old handles.

## Related

- [[Security_Requirements]]
- [[SwiftData_Strategy]]
