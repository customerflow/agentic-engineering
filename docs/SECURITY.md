# Security and threat model

## Assets to protect

Source code, intellectual property, API credentials, SSH keys, customer data, local databases, GitHub permissions, and deployment environments.

## Threats

- Prompt injection in repository files, issues, docs, or tool output.
- Accidental secret disclosure in prompts or logs.
- Destructive shell commands or migrations.
- Excessive MCP/GitHub permissions.
- Malicious dependencies or install scripts.
- Cross-tenant data exposure in SaaS projects.
- Unreviewed code reaching protected branches or production.

## Controls

- Human approval for merge and deployment.
- No production credentials or customer data in local agent environment.
- Least-privilege GitHub tokens and MCP scopes.
- Normal Claude Code permission prompts; no unrestricted mode.
- Secret scanning and `.gitignore`.
- Isolated test databases and disposable environments.
- Worktrees for parallel writers.
- CI checks and independent review.
- Inspect external scripts and dependencies before execution.

## Limitations

Claude instructions and deny rules are not a security sandbox. For untrusted code, use a disposable VM/container, restricted OS user, network restrictions, and no personal credentials. Review Anthropic's current security and permission documentation before changing settings.
