---
title: Error Handling
aliases: []
tags: [tech/runtime, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Error Handling

Errors are categorized into provider, authentication, timeout, persistence, and network errors.

User-facing errors should be human-readable and operationally useful.

## Error Categories

- Provider errors: invalid response, unsupported capability, model not found.
- Authentication errors: missing/invalid key, denied keychain access.
- Timeout errors: upstream latency exceeds configured limits.
- Persistence errors: save/read failures and migration issues.
- Network errors: unreachable host, DNS failure, TLS issues.

## Runtime Policy

- Classify errors before rendering user copy.
- Preserve user work context whenever possible.
- Avoid exposing low-level stack traces in UI.

## Related

- [[UX_States]]
- [[Requirement_to_Acceptance_Map]]
- [[Error_Model]]
