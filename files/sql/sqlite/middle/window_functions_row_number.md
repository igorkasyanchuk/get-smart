## 📊 Ranking Rows with Window Functions

SQLite supports window functions like `ROW_NUMBER()`, `RANK()`, and aggregates over partitions. Use `OVER` with optional `PARTITION BY` and `ORDER BY` to compute sequential metrics.

```sql
SELECT
  order_id,
  customer_id,
  total_amount,
  ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY total_amount DESC
  ) AS rank_per_customer
FROM orders;
```