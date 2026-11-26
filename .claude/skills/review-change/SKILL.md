---
name: review-change
description: Independently review the current diff for correctness, regressions, maintainability, and test coverage.
---

# Code review

1. Inspect the full diff and related call sites.
2. Compare behavior with approved acceptance criteria.
3. Look for correctness defects, regressions, unsafe assumptions, data loss, authorization gaps, and missing error handling.
4. Check tests for meaningful assertions.
5. Report actionable findings with file and line references.
6. Do not edit implementation files.
7. Recommend APPROVE or REQUEST CHANGES with rationale.
