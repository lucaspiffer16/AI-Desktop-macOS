---
title: Editorial Style Guide
aliases: ["Doc Writing Guide"]
tags: [docs/index, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Editorial Style Guide

This guide standardizes writing style and section order across the vault.

## Required Frontmatter

- `title`
- `aliases`
- `tags`
- `status`
- `source`

## Recommended Section Order

1. `# <Note Title>`
2. `## Context` (what this note solves)
3. `## Requirements` or `## Scope` (if applicable)
4. `## Scenarios` / `## Rules` / `## Constraints`
5. `## Validation Focus` or `## Measurable Checks` (if testable)
6. `## Related`

## Writing Rules

- Use short, direct sentences.
- Prefer explicit constraints over vague goals.
- Keep one concept per note.
- Use consistent terms from [[Glossary]].
- Every note should link to at least one product note and one technical note when applicable.

## Link Rules

- Use `[[Wiki Links]]` for internal references.
- Prefer note-level links; use section anchors only when needed.
- If a note is renamed, update all references in maps and MOCs.

## Status Rules

- `status/active`: ready for execution and review.
- `status/draft`: incomplete or future work.
- `status/accepted`: decision frozen (ADR-style).
- `status/template`: reusable scaffolds.

## Consistency Checks

- Run [[Documentation_Verification_Checklist]] after each phase.
- Confirm requirement mappings in [[Requirement_to_Acceptance_Map]] and [[Requirement_to_Architecture_Map]].
