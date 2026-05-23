---
title: OpenAI Compatible
aliases: []
tags: [tech/integration, tech/networking, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# OpenAI-Compatible Integration

Supports `/chat/completions`, SSE streaming, and bearer authentication.

## Request Expectations

- Base URL + path normalization for OpenAI-compatible variants.
- Bearer token authentication from Keychain-managed credential.
- Model identifier validation before request submission.

## Streaming Expectations

- Parse SSE chunk events incrementally.
- Handle stream termination and malformed chunk fallback.
- Surface partial response safely on interruption.

## Related

- [[AC-001]]
- [[Networking_and_Streaming]]
- [[AC-003]]
