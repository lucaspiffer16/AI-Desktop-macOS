---
title: Error Model
aliases: ["Unified Error Model"]
tags: [tech/runtime, tech/integration, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Error Model

## Categories

- `AuthError`
- `TimeoutError`
- `NetworkError`
- `ProviderError`
- `PersistenceError`
- `PrivacyModeError`

## Error Payload (conceptual)

- `category: ErrorCategory`
- `code: String`
- `userMessage: String`
- `recoveryHint: String?`
- `isRetryable: Bool`
- `cause: Error?` (internal)

## Mapping Rules

- HTTP 401/403 -> `AuthError`
- Connectivity/TLS/DNS -> `NetworkError`
- Stream timeout -> `TimeoutError`
- Invalid provider payload -> `ProviderError`
- Save/read failures -> `PersistenceError`

## UX Rules

- UI shows `userMessage` and optional `recoveryHint` only.
- Low-level internals remain in internal logs with redaction.
- Retry button appears only when `isRetryable = true`.

## Related

- [[Error_Handling]]
- [[Provider_Contract_Spec]]
- [[UX_States]]
