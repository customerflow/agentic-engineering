# New feature workflow

1. Capture request in `templates/feature-request.md`.
2. Run `/plan-feature`.
3. Product Manager defines user outcomes and acceptance criteria.
4. Architect inspects current code and proposes the minimum compatible design.
5. Orchestrator creates task ownership, dependencies, file scopes, and test gates.
6. Human reviews and approves the plan.
7. Run `/implement-feature`.
8. Run `/verify-change`, `/cf-security-review`, and `/review-change`.
9. Resolve blocking findings and rerun affected checks.
10. Run `/prepare-pr`.
11. Human inspects diff, CI, and PR; human approves merge.
12. Human initiates and verifies deployment.

Approval checkpoints: plan approval before implementation for material/high-risk work; human approval before merge; human approval before deployment.
