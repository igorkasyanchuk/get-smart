## 🤝 LATERAL Joins for Per-Row Subqueries
Use `LATERAL` joins to run subqueries that depend on each row of the main table without repeating the logic in application code.

```sql
SELECT u.id, u.name, o.latest_order_date
FROM users u
LEFT JOIN LATERAL (
  SELECT MAX(order_date) AS latest_order_date
  FROM orders o
  WHERE o.user_id = u.id
) o ON TRUE;
```

LATERAL allows you to reference `u.id` inside the subquery. This is more efficient than correlated subqueries when retrieving multiple computed values.