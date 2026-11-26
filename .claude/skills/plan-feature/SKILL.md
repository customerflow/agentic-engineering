---
name: plan-feature
description: Analyze a feature request and create an implementation plan from the plan template without changing application code. The plan is written as Draft; a human approves it before /implement-feature.
argument-hint: "<feature request, issue reference, or path to a request file>"
---

# Feature planning

Request: $ARGUMENTS

If the request is empty, ask for it before doing anything else.

1. Read project instructions and relevant documentation.
2. Inspect current implementation and Git status. Note the branch this work will merge into.
3. Ask Product Manager to define scope and acceptance criteria.
4. Ask Architect to inspect the system and design a compatible solution.
5. Identify data, API, frontend, security, migration, and operational impacts.
6. Break work into bounded tasks with owners and dependencies.
7. Identify parallel tasks and file ownership boundaries.
8. Define exact verification commands based on the project's manifests.
9. Write the plan using every section of [plan-template.md](plan-template.md), found at `${CLAUDE_SKILL_DIR}/plan-template.md`. Set `Status` to `Draft`, fill in `Base branch`, and leave the Human approvals section unticked.
10. Present the plan, then ask whether to save it to `docs/plans/<short-feature-name>.md`. Tell the user that `/implement-feature` only runs from a saved plan file.

Rules:

- Do not implement code. The only file this skill may create or change is the plan file under `docs/plans/`, and only after the user agrees to save it.
- Never set `Status` to `Approved` or tick "Plan approved" on your own judgment. Record approval only when the user states in this conversation that this plan is approved, and then record who approved it and the date.
- Mark assumptions and unresolved questions clearly.
- Stop once the plan is presented. Implementation starts only when a human runs `/implement-feature` on an approved plan.
