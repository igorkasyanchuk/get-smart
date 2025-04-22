## ⚡ Parallel Query Execution and Tuning
Enable and tune parallel query execution to leverage multiple CPU cores for large scans and aggregations. Adjust `max_parallel_workers_per_gather` and analyze the plan with `EXPLAIN (ANALYZE, VERBOSE)` to ensure that the planner chooses parallel plans. Monitor settings like `work_mem` to avoid memory bottlenecks.

```sql
-- Enable parallel workers for the session
SET max_parallel_workers_per_gather = 4;

EXPLAIN (ANALYZE, VERBOSE)
SELECT date_trunc('month', sale_time), count(*)
FROM sales
GROUP BY 1;
```