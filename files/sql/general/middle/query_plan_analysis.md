## 🔎 Analyze Query Plans with EXPLAIN ANALYZE
Before optimizing, inspect how PostgreSQL executes your query. `EXPLAIN ANALYZE` provides actual execution times and row counts, revealing bottlenecks like sequential scans or inefficient joins.

```sql
EXPLAIN ANALYZE
SELECT *
FROM customers c
JOIN orders o ON o.customer_id = c.id
WHERE c.country = 'CA';
```