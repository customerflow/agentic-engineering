# CustomerFlow Agentic Engineering

A local-Ubuntu, Claude Code-based engineering team for planning, implementing, testing, reviewing, and preparing software changes across CustomerFlow repositories.

## Operating model

- **Runtime:** Local Ubuntu workstation.
- **AI runtime:** Claude Code CLI.
- **Team:** Orchestrator, Product Manager, Architect, Backend Engineer, Frontend Engineer, QA Engineer, Security Engineer, Code Reviewer.
- **Isolation:** Git worktrees for parallel work; one branch/worktree per implementation task.
- **Release policy:** Agents may prepare commits and pull requests, but a human must approve merges and all deployments.
- **Default safety:** No production credentials, no production database access, no unattended deployment, and no destructive database operations.

This repository is an operating framework and set of templates. It does not automatically grant Claude Code access to GitHub, databases, or other services. Configure and approve integrations separately.

## Quick start

```bash
# 1. Install prerequisites
sudo apt update
sudo apt install -y git curl unzip jq

# 2. Install Claude Code using Anthropic's current official installer.
# Follow: https://code.claude.com/docs/en/overview
# Do not use an unverified third-party installer.

# 3. Clone this repository
git clone https://github.com/customerflow/agentic-engineering.git
cd agentic-engineering

# 4. Review all policies before use
less docs/SECURITY.md
less policies/permissions.md

# 5. Run local checks
./scripts/check-framework.sh

# 6. Authenticate and start Claude Code
claude
```

Inside Claude Code, start with:

```text
Read CLAUDE.md and docs/GETTING_STARTED.md.
Inspect this framework without changing files.
Explain the operating model, safety boundaries, and first-run checklist.
```

## Use it in a software project

Recommended: copy or selectively adapt `.claude/`, `CLAUDE.md`, `policies/`, and `workflows/` into the target repository. Do not blindly overwrite an existing `CLAUDE.md` or Claude settings file.

Alternatively, keep this framework as a separate repo and ask Claude Code to read its instructions while working in the target project. Ensure the target project's own `CLAUDE.md` remains authoritative for project-specific conventions.

## First feature workflow

1. Create a Git issue or write a request using `templates/feature-request.md`.
2. Start Claude Code in the target repository.
3. Ask the orchestrator to run `/plan-feature`.
4. Review and approve the feature plan before implementation.
5. Ask the orchestrator to execute `/implement-feature` with the approved plan.
6. Run `/verify-change`, `/security-review`, and `/review-change`.
7. Inspect the complete diff and test output yourself.
8. Ask Claude to prepare a pull request description.
9. A human reviews and merges the PR.
10. A human initiates and verifies deployment.

## Important

- Claude's reports are not proof that a command succeeded. Inspect command output and CI results.
- Use a separate, non-privileged OS account or container for untrusted repositories where practical.
- Never paste API keys, private keys, passwords, customer data, or production secrets into prompts.
- The deny rules in `.claude/settings.json` are guardrails, not a complete security boundary.
- Review permissions and tool names against the installed Claude Code version before enabling them.
