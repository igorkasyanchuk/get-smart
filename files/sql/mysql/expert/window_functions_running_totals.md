## 🧮 Leverage Window Functions for Running Totals

Window functions in MySQL 8.0+ let you compute running totals, moving averages, and differences without self-joins or subqueries. They’re optimized in C and can dramatically simplify complex analytics queries. Use `OVER` with ordering and frame clauses to control the window.

```sql
SELECT
  order_date,
  order_amount,
  SUM(order_amount) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM orders
WHERE order_date >= '2023-01-01';
```
