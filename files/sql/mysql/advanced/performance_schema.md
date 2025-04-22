## 📈 Profile Slow Queries Using performance_schema
The performance_schema lets you collect fine-grained metrics on statements, stages, and waits. Enable the desired consumers and instruments, then query summary tables for the top offenders. Use these insights to rewrite or index slow queries.

```sql
-- Enable statement instrumentation
UPDATE performance_schema.setup_consumers
SET ENABLED = 'YES'
WHERE NAME = 'statements_digest';

SELECT *
FROM performance_schema.events_statements_summary_by_digest
ORDER BY SUM_TIMER_WAIT DESC
LIMIT 10;
```