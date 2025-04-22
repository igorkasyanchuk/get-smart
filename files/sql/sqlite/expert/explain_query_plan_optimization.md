## 🔎 EXPLAIN QUERY PLAN Deep Dive
Use `EXPLAIN QUERY PLAN` to inspect how SQLite will execute your SQL and why it chooses certain indexes. Combine with `ANALYZE` to gather statistics for better plans.

```sql
-- Analyze tables to collect stats
ANALYZE;

-- View the plan for a complex join
EXPLAIN QUERY PLAN
SELECT u.name, o.total
  FROM users AS u
  JOIN orders AS o ON o.user_id = u.id
 WHERE u.status = 'active';
```
