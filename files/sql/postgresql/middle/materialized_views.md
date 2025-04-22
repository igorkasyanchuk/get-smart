## 📥 Materialized Views for Expensive Queries

Materialized views store the result of a complex query, improving read performance. Use `REFRESH MATERIALIZED VIEW CONCURRENTLY` to minimize lock impact and keep data up-to-date.

```sql
-- Create the materialized view
CREATE MATERIALIZED VIEW monthly_sales_summary AS
SELECT date_trunc('month', order_date) AS month,
       SUM(amount) AS total_sales
FROM sales
GROUP BY month;

-- Refresh without blocking selects
REFRESH MATERIALIZED VIEW CONCURRENTLY monthly_sales_summary;
```
