## 📊 Calculate Running Totals with Window Functions
Window functions let you compute cumulative aggregates without self-joins or variables. For instance, you can get a running total of sales per user by partitioning by user_id and ordering by date. This approach is both concise and performant in MySQL 8+.

```sql
SELECT
  order_id,
  order_date,
  SUM(amount) OVER (PARTITION BY user_id ORDER BY order_date) AS running_total
FROM orders;
```