# Operations

## Daily cycle

1. Update local main branch.
2. Create a feature branch or worktree.
3. Start Claude Code in the target repository.
4. Review plan before implementation.
5. Monitor agent tasks and inspect generated diffs.
6. Run verification and independent reviews.
7. Prepare PR; human reviews and merges.
8. Human deploys and verifies.

## Parallel work

Keep concurrency modest (2–4 coding workers initially). Increase only after measuring task success, review burden, context cost, and conflict rate.

## Recovery

- If an agent fails, inspect its worktree and git status before retrying.
- If tests fail, preserve logs and reproduce the failure.
- If a worktree is no longer needed, inspect its branch and uncommitted changes before removing it.
- Never use `git clean -fd`, `git reset --hard`, or destructive cleanup as a generic recovery step.
