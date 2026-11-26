---
name: prepare-pr
description: Prepare a human-reviewable pull request title, summary, and checklist for a defined change set, without pushing or merging. Run by a human.
argument-hint: "[plan-file] [base-ref]"
disable-model-invocation: true
---

# Prepare pull request

Arguments (optional, any order): a path to a plan file, a base ref.

Received: $ARGUMENTS

## Change set

"The change" is everything on this branch since it left the base branch, committed or not. A plain `git diff` is not enough: it shows nothing once work is committed.

1. Base ref: an argument that is not a path to an existing file. Otherwise the `Base branch` recorded in the plan file, if one was given. Otherwise the repository's default branch, from `git symbolic-ref --short refs/remotes/origin/HEAD`. If none of these resolves, stop and report that a base ref is needed. Do not guess.
2. Starting commit: `git merge-base HEAD <base-ref>`.
3. Contents: `git diff <starting-commit>` covers committed, staged, and unstaged changes to tracked files. `git status --short` lists untracked files, which that diff leaves out.
4. If the change set is empty, say so and stop.

Name the base ref and starting commit in the report.

## Pull request

Confirm the branch and the change set. Summarize problem, solution, user-visible changes, migration/API impact, tests actually run, security review, rollout/rollback notes, and known limitations. Generate a PR title and body. Do not push, open, approve, merge, or deploy unless the user explicitly requests the specific action and the connected tool is available. Human approval is required before merge and deployment.
