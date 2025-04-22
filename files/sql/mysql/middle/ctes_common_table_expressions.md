## 🧩 Simplifying Complex Queries with CTEs (WITH)
Common Table Expressions (`WITH`) improve readability by breaking down complex queries into named subqueries. They can be recursive for hierarchical data retrieval. Each CTE can be referenced multiple times within the main query.

```sql
WITH recent_orders AS (
  SELECT * FROM orders WHERE created_at > '2023-01-01'
),
total_per_customer AS (
  SELECT customer_id, COUNT(*) AS cnt FROM recent_orders GROUP BY customer_id
)
SELECT c.name, t.cnt
FROM total_per_customer t
JOIN customers c ON c.id = t.customer_id;
```
