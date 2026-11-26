# New feature workflow

1. Capture request in `templates/feature-request.md`.
2. Run `/plan-feature <request>` and save the plan to `docs/plans/` when asked.
3. Product Manager defines user outcomes and acceptance criteria.
4. Architect inspects current code and proposes the minimum compatible design.
5. Orchestrator creates task ownership, dependencies, file scopes, and test gates.
6. Human reviews the saved plan and records approval in it: `Status` set to `Approved`, and the "Plan approved" line ticked with a name and date.
7. Run `/implement-feature docs/plans/<name>.md`. It stops if the plan is not approved, and only a human can start it.
8. Run `/verify-change`, `/cf-security-review`, and `/review-change`, each with the plan file.
9. Resolve blocking findings and rerun affected checks.
10. Run `/prepare-pr docs/plans/<name>.md`.
11. Human inspects diff, CI, and PR; human approves merge.
12. Human initiates and verifies deployment.

Approval checkpoints: plan approval, recorded in the plan file, before `/implement-feature`; human approval before merge; human approval before deployment.
