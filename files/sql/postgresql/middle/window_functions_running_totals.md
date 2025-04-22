## 📊 Window Functions for Running Totals

Window functions let you perform calculations across sets of rows related to the current row. A common use case is computing running totals or moving averages without subqueries or self-joins.

```sql
SELECT
  order_date,
  amount,
  SUM(amount) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM sales
ORDER BY order_date;
```
