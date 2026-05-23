---
title: Main Goals
aliases: []
tags: [prd/goals, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Main Goals

## Primary

- Multi-provider connectivity.
- Local and remote provider support.
- Fast conversational interaction.
- Local history persistence.
- Native macOS UX.

Primary goals define MVP success and should map directly to acceptance criteria and delivery milestones.

## Secondary

- Contextual memory.
- RAG workflows.
- Project and file integrations.
- Agents and tools.

Secondary goals are expansion targets and should not block MVP completion.

## Goal to Scope Mapping

- Provider flexibility -> [[MVP_Scope_In]], [[Provider_Abstraction]]
- Fast interactions -> [[AC-003]], [[Performance_Requirements]]
- Local persistence -> [[AC-004]], [[SwiftData_Strategy]]
- Privacy during usage -> [[AC-005]], [[AC-006]], [[Privacy_Limitations]]

## Trade-Offs

- Prioritizing local-first simplicity delays cloud sync and collaboration.
- Supporting multiple providers early increases integration complexity.

## Related

- [[MVP_Scope_In]]
- [[Roadmap_Phases]]
- [[Requirement_to_Acceptance_Map]]
- [[Requirement_to_Architecture_Map]]
