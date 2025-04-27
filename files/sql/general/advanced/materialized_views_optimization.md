## 🗄️ Speed Up Complex Joins with Materialized Views
Materialized views precompute expensive joins and aggregates, refreshing on demand or schedule. Use `REFRESH MATERIALIZED VIEW CONCURRENTLY` in PostgreSQL for minimal locking.

```sql
CREATE MATERIALIZED VIEW mv_monthly_sales AS
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(total_amount)    AS revenue
FROM orders
GROUP BY 1;

-- Refresh daily
REFRESH MATERIALIZED VIEW CONCURRENTLY mv_monthly_sales;
```

Queries against `mv_monthly_sales` run in milliseconds, ideal for dashboards.