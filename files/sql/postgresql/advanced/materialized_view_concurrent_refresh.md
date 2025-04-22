## 🛠️ Materialized Views with Concurrent Refresh
Use materialized views to cache the results of expensive queries and refresh them periodically. The `CONCURRENTLY` option allows you to refresh without locking out readers, ensuring continuous availability. Remember that `CONCURRENTLY` requires a unique index on the view.

```sql
CREATE MATERIALIZED VIEW mv_sales_summary AS
SELECT date_trunc('day', sale_time) AS day, sum(amount) AS total
FROM sales
GROUP BY day;
CREATE UNIQUE INDEX idx_mv_sales_summary_day ON mv_sales_summary(day);

-- Refresh without blocking reads
REFRESH MATERIALIZED VIEW CONCURRENTLY mv_sales_summary;
```