## 🌀 Utilize LATERAL Joins for Row‐Wise Subqueries
`LATERAL` lets each row feed into a subquery, enabling dynamic lookups and top‐N fetches per row without correlated subqueries.

```sql
SELECT u.id, u.name, recent_orders.order_id, recent_orders.order_date
FROM users u
CROSS JOIN LATERAL (
  SELECT id AS order_id, order_date
  FROM orders
  WHERE user_id = u.id
  ORDER BY order_date DESC
  LIMIT 1
) AS recent_orders;
```

This retrieves each user’s most recent order in a single pass, improving performance over repeated joins.