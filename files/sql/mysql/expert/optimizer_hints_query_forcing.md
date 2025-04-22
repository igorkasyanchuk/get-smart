## 💡 Force Join Order and Access with Optimizer Hints

When the optimizer picks a suboptimal plan, use hints like `STRAIGHT_JOIN`, `USE INDEX`, or `FORCE INDEX` to override defaults. Hints should be your last resort and guarded by feature flags or comments.

```sql
SELECT /*+ NO_RANGE_OPTIMIZATION(t1) */
  t1.id, t2.details
FROM table1 AS t1
STRAIGHT_JOIN table2 AS t2
  USE INDEX (idx_details)
  ON t1.ref = t2.id
WHERE t2.status = 'active';
```
