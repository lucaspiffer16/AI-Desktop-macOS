---
title: Security Requirements
aliases: []
tags: [tech/security, trace/requirement, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Security Requirements

- Store secrets in Keychain.
- Never persist raw keys in plain text.
- Avoid logging secret material.

## Operational Rules

- Secrets only enter memory when required for request execution.
- Redact sensitive fields in diagnostics and analytics events.
- Credential update flows must invalidate stale in-memory values.

## Validation Focus

- Verify no plain-text secrets in persistence models.
- Verify no raw secret content in logs or user-visible errors.

## Related

- [[Keychain_Policy]]
- [[AC-002]]
- [[Error_Handling]]
