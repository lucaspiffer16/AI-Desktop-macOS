---
title: PRD to Notes Coverage Matrix
aliases: ["Coverage Matrix"]
tags: [trace/requirement, trace/acceptance, trace/architecture, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# PRD to Notes Coverage Matrix

Use this matrix for quick audit of requirement coverage, implementation mapping, and validation readiness.

| PRD Area | Primary Notes | Acceptance / Validation | Architecture / Runtime |
| --- | --- | --- | --- |
| Product Vision | [[Product_Vision]] | [[Requirement_Index]] | [[Technical_Overview]] |
| Main Goals | [[Main_Goals]] | [[Requirement_to_Acceptance_Map]] | [[Requirement_to_Architecture_Map]] |
| Personas | [[Personas]] | [[UX_States]] | [[Privacy_Requirements]] |
| MVP In Scope | [[MVP_Scope_In]] | [[AC-001]], [[AC-002]], [[AC-003]], [[AC-004]], [[AC-005]], [[AC-006]] | [[Delivery_Plan_MVP]] |
| MVP Out of Scope | [[MVP_Scope_Out]] | [[Roadmap_Phases]] | [[Cloud_Sync_Out_of_Scope]] |
| User Flow: Add Provider | [[Flow_Add_Provider]] | [[AC-001]], [[AC-002]] | [[Provider_Abstraction]], [[Error_Handling]] |
| User Flow: Start Conversation | [[Flow_Start_Conversation]] | [[AC-003]], [[AC-004]] | [[Networking_and_Streaming]], [[Conversation_Domain]] |
| User Flow: Privacy Mode | [[Flow_Privacy_Mode]] | [[AC-005]], [[AC-006]] | [[Privacy_Layer_Modes]], [[Global_Shortcuts]] |
| Privacy Constraint | [[Privacy_Requirements]], [[Privacy_Limitations]] | [[AC-005]], [[AC-006]] | [[Capture_Restriction_Attempt]] |
| Security Constraint | [[Security_Requirements]], [[Keychain_Policy]] | [[AC-002]] | [[SwiftData_Strategy]], [[Error_Handling]] |
| Tech Overview | [[Technical_Overview]] | [[Documentation_Verification_Checklist]] | [[High_Level_Architecture]], [[Modular_Domains]] |
| Provider Abstraction | [[Provider_Abstraction]] | [[AC-001]], [[AC-003]] | [[Architectural_Contracts]], [[OpenAI_Compatible]] |
| Persistence Strategy | [[SwiftData_Strategy]] | [[AC-004]] | [[Future_Migration_SQLite_GRDB]] |
| Runtime Concerns | [[Error_Handling]], [[Performance_Requirements]] | [[AC-003]], [[AC-006]] | [[UX_States]] |
| Planning and Risk | [[Delivery_Plan_MVP]], [[Milestones]], [[Risk_Register]] | [[Documentation_Verification_Checklist]] | [[ADR-0001-SwiftData-for-MVP]] |

## Audit Use

- Sprint planning: validate planned stories map to one or more matrix rows.
- QA planning: derive scenario coverage from AC-linked rows.
- Architecture review: confirm runtime and integration notes still satisfy mapped requirements.

## Related

- [[Requirement_Index]]
- [[Requirement_to_Acceptance_Map]]
- [[Requirement_to_Architecture_Map]]
