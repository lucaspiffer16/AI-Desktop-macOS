---
title: Documentation Verification Checklist
aliases: ["Doc Verification Checklist"]
tags: [trace/architecture, trace/acceptance, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Documentation Verification Checklist

Use this checklist at the end of each detailing phase.

## A. Structure and Metadata

- [ ] Note has required frontmatter (`title`, `tags`, `status`, `source`).
- [ ] Tags follow [[Tag_Taxonomy]].
- [ ] Note appears in at least one relevant MOC.
- [ ] Link to source anchor exists: [[PRD_TechnicalSpec_Original]].

## B. Link Integrity

- [ ] All `[[wikilinks]]` in edited notes resolve.
- [ ] No stale links to renamed notes.
- [ ] Related section points to product + technical contexts.

## C. Requirement Consistency

- [ ] Requirement edits reflected in [[Requirement_Index]].
- [ ] Acceptance mappings updated in [[Requirement_to_Acceptance_Map]].
- [ ] Architecture mappings updated in [[Requirement_to_Architecture_Map]].

## D. Scope and Roadmap Consistency

- [ ] In-scope and out-of-scope boundaries remain explicit.
- [ ] Deferred items point to roadmap phase notes.
- [ ] No accidental scope expansion in MVP notes.

## E. Privacy and Security Accuracy

- [ ] No note implies guaranteed invisibility for capture/privacy behavior.
- [ ] Secret handling statements remain aligned with Keychain policy.
- [ ] Risk implications reflected in [[Risk_Register]].

## F. Acceptance and Testability

- [ ] AC notes remain testable and unambiguous.
- [ ] Edge and error paths are documented where required.
- [ ] Performance and runtime expectations are linked.

## G. Change Log (manual)

- Date:
- Phase:
- Notes reviewed:
- Main inconsistencies found:
- Resolutions applied:
- Follow-up required:

## Related

- [[Documentation_Detailing_Plan]]
- [[MOC_Roadmap]]
