---
title: Flow Add Provider
aliases: []
tags: [flow/provider, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Flow: Add Provider

1. Open settings.
2. Select Add Provider.
3. Fill name, base URL, API key, type.
4. Test connection.
5. Validate endpoint and list models.
6. Save provider.

## Alternate Paths

- Connection test fails due to invalid URL, auth error, timeout, or malformed response.
- Model listing succeeds but save is blocked if no model is selected and no default behavior is defined.

## Error States

- Show validation feedback without exposing secrets.
- Preserve typed values except API key if user chooses secure reset.
- Provide retry action and provider diagnostics hint.

## State Transitions

- `editing` -> `testing` -> `validated` -> `saved`
- `testing` -> `failed` -> `editing`

## Related

- [[AC-001]]
- [[AC-002]]
- [[Provider_Abstraction]]
- [[Error_Handling]]
