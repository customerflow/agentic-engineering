---
name: implement-feature
description: Implement an approved feature plan with bounded specialist tasks and isolated worktrees. Run by a human with the plan file as the argument; stops if the plan is not approved.
argument-hint: "<path to approved plan, e.g. docs/plans/my-feature.md>"
disable-model-invocation: true
---

# Feature implementation

Plan file: $ARGUMENTS

## Approval gate

Do this before anything else.

1. Read the plan file named above. If no path was given or the file does not exist, stop and say so. A plan that exists only in the conversation does not count; save it with `/plan-feature` first.
2. Continue only if `Status` is `Approved` or `In progress` and the "Plan approved" line under Human approvals is ticked with a name and date. If the two disagree or either is missing, stop and report exactly what is missing.
3. Never approve the plan yourself, and never treat earlier conversation as approval in place of the file.
4. Stop if `Base branch` is empty, or if the plan lists unresolved questions that block implementation.

## Steps

1. Confirm the working tree is understood. Set the plan's `Status` to `In progress`.
2. Create a task checklist from the plan and assign one owner per task.
3. Use separate Git worktrees for concurrent code-writing tasks.
4. Agree API/data contracts before parallel backend/frontend implementation.
5. Require each worker to report changed files, tests, and limitations.
6. Integrate changes onto one integration branch created from the plan's base branch, in a controlled order, resolving conflicts deliberately. The whole change must be present in that one checkout before verification.
7. Do not merge to protected branches or deploy.
8. From the integration branch, run `/verify-change`, `/cf-security-review`, and `/review-change`, passing the plan file to each so they compare against the plan's base branch and acceptance criteria.

If worktree setup, agent capability, or safe parallelism is unavailable, work sequentially. Never simulate parallel execution.
