## 📋 Leverage Window Functions for Complex Aggregations
SQLite supports window functions like `ROW_NUMBER()`, `RANK()`, and `SUM() OVER()`, enabling analytics without subqueries. Window functions let you compute running totals, ranks, and moving averages in a single pass. This simplifies reporting queries and improves maintainability.

```sql
-- Get running total of sales per salesperson
SELECT 
  salesperson_id,
  sale_date,
  amount,
  SUM(amount) OVER(
    PARTITION BY salesperson_id
    ORDER BY sale_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM sales;
```