---
name: review-change
description: Independently review a change set for correctness, regressions, maintainability, and test coverage. Runs as the code-reviewer agent in a separate read-only context that has not seen the implementation conversation.
argument-hint: "[plan-file] [base-ref]"
context: fork
agent: code-reviewer
background: false
disallowed-tools:
  - Edit
  - Write
  - NotebookEdit
---

# Code review

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

1. Inspect the full change set and related call sites.
2. If a plan file was given, compare behavior against each of its acceptance criteria. If none was given, state that requirement coverage was not assessed.
3. Check tests for meaningful assertions.
4. Report actionable findings with file and line references.
5. Do not create, edit, or delete any file, including through shell commands.
6. Recommend APPROVE or REQUEST CHANGES with rationale.
