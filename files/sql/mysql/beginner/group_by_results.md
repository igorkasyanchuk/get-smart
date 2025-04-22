## 📊 Grouping Results with GROUP BY
`GROUP BY` groups rows sharing a property so you can apply aggregate functions like `SUM`, `AVG`, or `COUNT` per group.

```sql
-- Total sales per month
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(total) AS monthly_sales
FROM orders
GROUP BY month;
```