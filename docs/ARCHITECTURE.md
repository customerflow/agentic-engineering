# Architecture

## V1 components

- Human Product Owner: defines priorities and approves plans, merges, and deployments.
- Orchestrator: decomposes work, delegates, tracks handoffs, and reports status.
- Product Manager: requirements and acceptance criteria.
- Architect: system design and technical decisions.
- Backend/Frontend Engineers: implementation within explicit scopes.
- QA: independent verification.
- Security: defensive security review.
- Code Reviewer: independent diff review.
- Git worktrees: isolate concurrent writing tasks.
- GitHub Actions: repeatable CI gates.

## Coordination principles

Use sequential delegation for small work. Use parallel agents only when tasks have stable contracts and non-overlapping file ownership. The orchestrator remains accountable for integration, but cannot override human approval gates.

## Not included in V1

No always-on server, custom agent dashboard, autonomous production deployment, production database access, custom vector memory, or custom orchestration backend. Add these only after V1 proves useful.
