---
name: security-review
description: Perform a defensive security review of a proposed code change.
---

# Security review

Review authentication, authorization, tenant boundaries, validation, injection, secrets, logging, PII, file operations, external requests, rate limits, dependencies, and migration/data risks as applicable.

Use read-only review by default. Do not access production systems or real customer data. Report each finding with severity, location, evidence, impact, and remediation. Distinguish confirmed issues from potential risks. Do not claim a clean bill of health beyond the scope actually reviewed.
