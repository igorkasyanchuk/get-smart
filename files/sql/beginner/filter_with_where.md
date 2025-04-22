## 🔎 Filter Rows Using WHERE

The `WHERE` clause lets you narrow down records based on conditions. Combine comparison operators (`=`, `<`, `>`) to fetch exactly the rows you want.

```sql
SELECT *
FROM orders
WHERE status = 'shipped' AND total > 100;
```

This query returns all shipped orders with a total greater than 100.