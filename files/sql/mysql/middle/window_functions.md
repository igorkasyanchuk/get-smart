## 🪟 Leveraging Window Functions for Advanced Aggregation
Window functions let you compute totals, ranks, and moving averages without grouping your result set. They maintain row-level details while adding aggregated columns. Use `OVER()` with `PARTITION BY` and `ORDER BY` to scope calculations.

```sql
SELECT
  user_id,
  order_date,
  SUM(amount) OVER (PARTITION BY user_id ORDER BY order_date ROWS BETWEEN 4 PRECEDING AND CURRENT ROW) AS rolling_sum
FROM orders;
```
