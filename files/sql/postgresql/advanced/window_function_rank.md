## 📊 Window Functions for Advanced Ranking and Aggregation
Use window functions like `ROW_NUMBER()`, `RANK()`, and moving averages to perform calculations across sets of rows related to the current query row. These functions enable analytics directly in SQL without subqueries or temp tables. Partition results by one or more columns and define frame specifications for moving sums, averages, or percentiles.

```sql
SELECT
  user_id,
  order_date,
  amount,
  SUM(amount) OVER (PARTITION BY user_id ORDER BY order_date
                    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_weekly_total,
  RANK() OVER (PARTITION BY user_id ORDER BY amount DESC) AS rank_desc
FROM orders;
```