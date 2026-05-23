---
title: Product Vision
aliases: []
tags: [prd/vision, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Product Vision

Create a native macOS conversational AI desktop app focused on privacy, local-first operation, multi-provider support, and extensibility.

The positioning is a professional productivity tool rather than a thin chat wrapper. This impacts UX expectations (speed, reliability, keyboard flow), technical decisions (provider abstraction, streaming), and trust controls (privacy and secure key management).

## Rationale

- Native UX and keyboard-centric flow improve daily use for technical users.
- Local-first behavior reduces privacy risk and cloud dependency.
- Provider-agnostic design avoids lock-in and keeps model choice flexible.

## Assumptions

- Users are comfortable configuring providers and models.
- Local endpoints may be unavailable at times and must degrade gracefully.
- Fast startup and streaming are core perceived-quality signals.

## Non-Goals

- Become a social or collaborative workspace in MVP.
- Replace IDEs, terminals, or full project management tools.

## Related

- [[Main_Goals]]
- [[Product_Principles]]
- [[Technical_Overview]]
- [[MVP_Scope_In]]
- [[Requirement_Index]]
