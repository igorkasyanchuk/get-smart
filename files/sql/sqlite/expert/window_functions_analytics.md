## 📊 Window Functions for Advanced Analytics
Leverage window functions in SQLite (version ≥3.25) to compute running totals, moving averages, and percentiles without client‑side post‑processing. Partition, frame, and order your data inline for efficient analytical queries.

```sql
SELECT
  date,
  sales,
  AVG(sales) OVER (
    PARTITION BY region
    ORDER BY date
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS weekly_avg
FROM sales_data;
```
