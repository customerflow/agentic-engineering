---
name: verify-change
description: Run project-appropriate formatting, static analysis, type checks, tests, and builds; report exact results.
---

# Verification

1. Inspect project manifests and documented commands; do not guess scripts.
2. Check the working tree and diff.
3. Run the narrowest relevant tests first.
4. Run formatter/linter/type-check/build commands when defined.
5. Capture actual exit status and meaningful output.
6. Identify skipped checks and why they were skipped.
7. Do not modify code merely to suppress failures without understanding the cause.

Report command, result (PASS/FAIL/BLOCKED/NOT RUN), and evidence for each check.
