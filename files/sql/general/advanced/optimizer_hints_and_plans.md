## 🛠️ Guide the Planner with Hints and Analyze Plans
When the optimizer misestimates, hints or plan guides can force desired execution paths. In SQL Server use `OPTION (FORCE ORDER)`, or in Oracle use `/*+ INDEX(table idx_name) */`. Always validate with `EXPLAIN`.

```sql
-- SQL Server hint example
SELECT *
FROM orders o
JOIN customers c ON o.customer_id = c.id
OPTION (HASH JOIN, MAXDOP 1);

-- PostgreSQL plan analysis:
EXPLAIN (ANALYZE, VERBOSE)
SELECT * FROM orders WHERE status = 'pending';
```