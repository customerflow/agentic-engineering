# Agent permission policy

## Baseline

- Use Claude Code's normal permission prompts; do not use bypass-permissions mode.
- Keep `.claude/settings.local.json` untracked and review local overrides.
- Deny reading common secret paths, but remember this is not a complete sandbox.
- Grant the minimum tools needed to each agent.
- QA and Code Reviewer should be read-only for implementation code.
- Security Engineer should be read-only by default.
- Use MCP servers only after reviewing their tools, scopes, and data handling.
- Do not connect production systems.

## Approval required

Explicit human approval is required for:
- Merge, release, or deployment.
- Pushes to protected branches.
- Destructive database/schema/data operations.
- Authentication/authorization policy changes.
- Credential or permission changes.
- New paid services, dependencies with material licensing impact, or telemetry.
- External messages, purchases, or customer-facing actions.

## Worktree policy

- One writer per worktree.
- One owner per file/module at a time.
- No shared mutable worktree among parallel agents.
- Inspect status and diff before integrating.
