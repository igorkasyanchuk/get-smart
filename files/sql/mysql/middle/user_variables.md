## 🎯 Using User-Defined Variables for Row-by-Row Computations
User variables let you store values and carry state across rows in a single query. They’re helpful for running totals or custom ranking before window functions were available. Initialize them in the SELECT or a subquery.

```sql
SET @running_total = 0;

SELECT
  order_date,
  amount,
  (@running_total := @running_total + amount) AS cumulative_amount
FROM orders
ORDER BY order_date;
```
