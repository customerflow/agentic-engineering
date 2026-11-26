---
name: implement-feature
description: Implement an already approved feature plan with bounded specialist tasks and isolated worktrees.
---

# Feature implementation

1. Confirm the plan is approved and the working tree is understood.
2. Create a task checklist and assign one owner per task.
3. Use separate Git worktrees for concurrent code-writing tasks.
4. Agree API/data contracts before parallel backend/frontend implementation.
5. Require each worker to report changed files, tests, and limitations.
6. Integrate changes in a controlled order and resolve conflicts deliberately.
7. Do not merge to protected branches or deploy.
8. Run `/verify-change`, `/cf-security-review`, and `/review-change`.

If worktree setup, agent capability, or safe parallelism is unavailable, work sequentially. Never simulate parallel execution.
