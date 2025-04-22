## 🔗 LATERAL Joins for Per-Row Subqueries
Use `LATERAL` joins to execute a subquery for each row of the main query, enabling dynamic, correlated operations like array unnesting or top-N per group. This is especially useful when you need to fetch related or computed data that depends on each row’s values.

```sql
SELECT u.id, u.name, recent_orders.orders
FROM users u
LEFT JOIN LATERAL (
  SELECT json_agg(o) AS orders
  FROM orders o
  WHERE o.user_id = u.id
  ORDER BY o.order_date DESC
  LIMIT 5
) AS recent_orders ON true;
```