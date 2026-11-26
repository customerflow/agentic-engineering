# Getting started

## Prerequisites

- Ubuntu 22.04+ recommended.
- Git, curl, jq, and a supported Node.js runtime if required by the current Claude Code installer.
- Claude account or API access with Claude Code entitlement.
- GitHub access for repositories you are authorized to work on.

Install Claude Code only using Anthropic's official current instructions:
https://code.claude.com/docs/en/overview

## First run

1. Clone this framework.
2. Read `CLAUDE.md`, `docs/SECURITY.md`, and `policies/`.
3. Run `./scripts/check-framework.sh`.
4. Start `claude` and authenticate.
5. Ask it to explain the framework without modifying files.
6. Test one specialist agent on a harmless read-only task.
7. Test `/plan-feature` on a small feature; review the plan.
8. Only then allow a bounded implementation in a disposable branch/worktree.

## Apply to another repository

1. Back up its existing Claude configuration.
2. Copy/adapt agent, skill, and rule files.
3. Merge—not overwrite—settings and project instructions.
4. Add project-specific commands and architecture documentation.
5. Ensure the target repo's secret files are excluded and not available to the agent.
6. Run a read-only inspection first.

## Verify framework

```bash
./scripts/check-framework.sh
```

The script checks repository structure and basic Markdown/frontmatter presence. It does not validate every Claude Code feature against every CLI version.
