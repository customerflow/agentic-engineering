# Deployment policy

- Agents may prepare deployment plans and release notes.
- Agents must not deploy to production or staging without explicit approval for that deployment.
- Production credentials must not be available to local agent sessions.
- Human verifies target environment, backup, migration, rollback, and monitoring.
- Record deployed commit, operator, timestamp, and verification outcome.
