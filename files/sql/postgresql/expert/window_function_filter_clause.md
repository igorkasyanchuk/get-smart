## 🚀 Optimize Windowed Aggregates with FILTER Clause

When dealing with sliding window calculations that require conditional aggregation, use the `FILTER` clause inside window functions rather than verbose `CASE` expressions. This reduces branching in the planner and produces cleaner SQL. You can also combine with custom framing for precise control.

```sql
SELECT
  user_id,
  SUM(amount) FILTER (WHERE status = 'success') OVER (PARTITION BY user_id ORDER BY created_at ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) AS rolling_success_sum,
  COUNT(*) FILTER (WHERE status = 'error') OVER (PARTITION BY user_id ORDER BY created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_errors
FROM transactions;
```
