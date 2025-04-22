## 🧩 Using Common Table Expressions (CTE) for Cleaner Queries

Common Table Expressions let you break down complex queries into readable building blocks. Define temporary result sets with `WITH` and reference them within your main query, improving maintainability.

```sql
WITH recent_orders AS (
  SELECT id, customer_id, total_amount
  FROM orders
  WHERE order_date >= date('now','-30 days')
),
top_customers AS (
  SELECT customer_id, SUM(total_amount) AS month_total
  FROM recent_orders
  GROUP BY customer_id
)
SELECT c.name, tc.month_total
FROM top_customers tc
JOIN customers c ON c.id = tc.customer_id
ORDER BY tc.month_total DESC;
```