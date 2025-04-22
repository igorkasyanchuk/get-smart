## ⚡ Tune Parallel Queries for Heavy Aggregations

For CPU-intensive queries over large tables, enabling and tuning parallel workers can yield substantial speedups. Adjust `max_parallel_workers_per_gather` and monitor actual gather nodes in the plan to ensure effective usage.

```sql
-- Increase parallel workers per gather
SET max_parallel_workers_per_gather = 4;

EXPLAIN (ANALYZE, VERBOSE)
SELECT region, SUM(sales)
FROM orders
WHERE order_date > now() - INTERVAL '30 days'
GROUP BY region;
```