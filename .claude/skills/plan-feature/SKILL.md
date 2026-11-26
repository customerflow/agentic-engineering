---
name: plan-feature
description: Analyze a feature request and create an implementation plan without changing application code.
---

# Feature planning

1. Read project instructions and relevant documentation.
2. Inspect current implementation and Git status.
3. Ask Product Manager to define scope and acceptance criteria.
4. Ask Architect to inspect the system and design a compatible solution.
5. Identify data, API, frontend, security, migration, and operational impacts.
6. Break work into bounded tasks with owners and dependencies.
7. Identify parallel tasks and file ownership boundaries.
8. Define exact verification commands based on the project's manifests.
9. Save the plan to `docs/plans/<short-feature-name>.md` only if the user approves creating the plan file.

Do not implement code. Mark assumptions and unresolved questions clearly. Stop for human approval before implementation for high-risk or ambiguous work.
