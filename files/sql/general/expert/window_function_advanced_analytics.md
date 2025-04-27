## 📊 Advanced Window Function Optimization
Use window functions with frame clauses to compute running totals or sliding aggregates efficiently without subqueries or temp tables.

```sql
SELECT
  order_date,
  customer_id,
  amount,
  SUM(amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
    RANGE BETWEEN INTERVAL '7 days' PRECEDING AND CURRENT ROW
  ) AS rolling_weekly_sales
FROM sales
WHERE order_date >= CURRENT_DATE - INTERVAL '1 month';
```

This query computes a 7-day rolling sum per customer by using a RANGE frame, which is more efficient than self-joins for large datasets.