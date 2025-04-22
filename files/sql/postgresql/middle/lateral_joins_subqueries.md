## ↔️ LATERAL JOIN to Expand Subqueries

A LATERAL join allows each row from the main table to be passed into a subquery, making it powerful for per-row computations without multiple queries. Use it to fetch top-N related records efficiently.

```sql
SELECT c.id, c.name, t.total
FROM customers c
JOIN LATERAL (
  SELECT COUNT(*) AS total
  FROM orders o
  WHERE o.customer_id = c.id
) t ON true;
```
