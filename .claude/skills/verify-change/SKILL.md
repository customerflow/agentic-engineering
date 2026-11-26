---
name: verify-change
description: Run project-appropriate formatting, static analysis, type checks, tests, and builds for a defined change set; report exact results.
argument-hint: "[plan-file] [base-ref]"
---

# Verification

Arguments (optional, any order): a path to a plan file, a base ref.

Received: $ARGUMENTS

## Change set

"The change" is everything on this branch since it left the base branch, committed or not. A plain `git diff` is not enough: it shows nothing once work is committed.

1. Base ref: an argument that is not a path to an existing file. Otherwise the `Base branch` recorded in the plan file, if one was given. Otherwise the repository's default branch, from `git symbolic-ref --short refs/remotes/origin/HEAD`. If none of these resolves, stop and report that a base ref is needed. Do not guess.
2. Starting commit: `git merge-base HEAD <base-ref>`.
3. Contents: `git diff <starting-commit>` covers committed, staged, and unstaged changes to tracked files. `git status --short` lists untracked files, which that diff leaves out.
4. If the change set is empty, say so and stop.

Name the base ref and starting commit in the report.

## Steps

1. Inspect project manifests and documented commands; do not guess scripts. If a plan file was given, include the verification commands it defines.
2. Establish the change set and list the files in it.
3. Run the narrowest relevant tests first.
4. Run formatter/linter/type-check/build commands when defined.
5. Capture actual exit status and meaningful output.
6. Identify skipped checks and why they were skipped.
7. Do not modify code merely to suppress failures without understanding the cause.

Report command, result (PASS/FAIL/BLOCKED/NOT RUN), and evidence for each check.
