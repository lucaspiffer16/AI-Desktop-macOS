---
title: Git Delivery Flow Adoption
aliases: ["Git Workflow Adoption"]
tags: [plan/roadmap, status/active]
status: active
source: "[[git-delivery-flow]]"
---

# Git Delivery Flow Adoption

## Canonical Rules (must follow)

- No direct commit on `main`, `homolog`, `staging`.
- No direct push to `main`, `homolog`, `staging`.
- Work branches must start from `main`.
- Promotion sequence: work branch -> `homolog` -> `staging` -> `main`.
- Every promotion requires formal PR.

## Operational Gates

- Bootstrap required before GitHub operations: `git`, `gh`, `gh auth status`.
- Sync required before push: `git fetch` + divergence check.
- Push requires explicit user confirmation.
- Promotion to `staging` requires explicit developer approval after `homolog` validation and issue comment.

## Worktree Standard

- Default branch work happens in dedicated worktree outside repo root.
- Worktree naming: `../<tipo>-<ids-opcional>-<contexto>`.
- Remove worktree after PR merge.

## Bootstrap Note for This Repository

Current repository is in startup stage. Before feature production starts:

1. Publish current startup codebase using controlled branch + PR flow.
2. Ensure canonical remote branches exist (`homolog`, `staging`).
3. Configure branch protection for `main`, `homolog`, `staging`.
4. Save local workflow preferences in `.context/git-preferences.json`.

## Recommended First Delivery Operation

- Operation type: `docs/chore` bootstrap.
- Goal: publish current baseline (app scaffold + docs vault) before feature work.
- Output: PR to `homolog`, then promotion to `staging` when approved.

## Related

- [[Documentation_Detailing_Plan]]
- [[Documentation_Verification_Checklist]]
- [[MOC_Roadmap]]
