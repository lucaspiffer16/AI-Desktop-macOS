---
title: Risk Register
aliases: []
tags: [trace/risk, status/active]
status: active
source: "[[PRD_TechnicalSpec_Original]]"
---

# Risk Register

- Deployment target mismatch vs product target.
- Provider behavior divergence across vendors.
- Streaming cancellation and UI state consistency.
- Privacy feature expectations vs OS/software capture realities.
- Potential SwiftData query limits as dataset grows.

## Mitigations

- Track target compatibility in release checklist.
- Define provider contract tests before adding multiple vendors.
- Add streaming cancellation tests.
- Keep explicit privacy limitation copy in product UX.
- Reassess persistence strategy after MVP telemetry.

## Ownership and Review

- Owner: Engineering Lead.
- Contributors: Product, QA.
- Review cadence: weekly during MVP build, then bi-weekly.

## Trigger Events

- Deployment target or platform requirement changes.
- New provider onboarding.
- Repeated streaming or restore regressions.
- Security/privacy incident or near miss.

## Related

- [[Build_and_Deployment_Constraints]]
- [[Privacy_Limitations]]
