## 🔢 Leverage Window Functions for Advanced Ranking
Window functions like `ROW_NUMBER()`, `RANK()`, and `NTILE()` let you compute rankings and moving aggregates without subqueries. Use `PARTITION BY` to segment your data and `ORDER BY` to define the window frame.

```sql
SELECT
  user_id,
  purchase_amount,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY purchase_date DESC) AS recent_order_rank
FROM orders;
```

This query assigns a descending rank of each order per user, enabling you to filter or analyze top‐N results per partition.
