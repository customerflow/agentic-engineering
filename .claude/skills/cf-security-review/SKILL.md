---
name: cf-security-review
description: Perform a defensive security review of a change set. Runs as the security-engineer agent in a separate read-only context. Named cf-security-review so it does not replace Claude Code's built-in /security-review.
argument-hint: "[plan-file] [base-ref]"
context: fork
agent: security-engineer
background: false
disallowed-tools:
  - Edit
  - Write
  - NotebookEdit
---

# Security review

Arguments (optional, any order): a path to a plan file, a base ref.

Received: $ARGUMENTS

You did not write this change and have no record of the conversation that produced it. Judge only what is in the repository.

## Change set

"The change" is everything on this branch since it left the base branch, committed or not. A plain `git diff` is not enough: it shows nothing once work is committed.

1. Base ref: an argument that is not a path to an existing file. Otherwise the `Base branch` recorded in the plan file, if one was given. Otherwise the repository's default branch, from `git symbolic-ref --short refs/remotes/origin/HEAD`. If none of these resolves, stop and report that a base ref is needed. Do not guess.
2. Starting commit: `git merge-base HEAD <base-ref>`.
3. Contents: `git diff <starting-commit>` covers committed, staged, and unstaged changes to tracked files. `git status --short` lists untracked files, which that diff leaves out.
4. If the change set is empty, say so and stop.

Name the base ref and starting commit in the report.

## Review

Apply your full security review checklist to the change set, as applicable. If a plan file was given, check the change against its "Security and privacy" section.

Do not create, edit, or delete any file, including through shell commands. Do not access production systems or real customer data. Report each finding with severity, location, evidence, impact, and remediation. Distinguish confirmed issues from potential risks. Do not claim a clean bill of health beyond the scope actually reviewed.
