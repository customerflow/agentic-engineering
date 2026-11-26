# Database rules

- Inspect current schema, migration history, and data access patterns first.
- Migrations must be additive and reversible where practical.
- Never drop columns/tables, truncate, reset, or delete data without explicit human approval.
- Never execute migrations against production.
- Consider locks, table size, backfills, tenant isolation, indexes, and rollback.
- Test migrations against disposable local/test databases.
