# Bug fix workflow

1. Record expected and actual behavior, environment, reproduction steps, and impact.
2. Reproduce the bug before changing code when practical.
3. QA or developer creates a failing regression test.
4. Architect checks scope if data/API/security boundaries are affected.
5. Assign one implementation owner.
6. Implement the smallest safe fix.
7. Run regression tests and `/verify-change`.
8. Run `/review-change`; include `/cf-security-review` for security-sensitive paths.
9. Prepare a PR. Human approves merge and deployment.
