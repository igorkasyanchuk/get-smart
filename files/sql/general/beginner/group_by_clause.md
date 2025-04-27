## 📑 Group Data with GROUP BY

Use `GROUP BY` to aggregate rows based on one or more columns. Combine with aggregate functions like `SUM()` or `AVG()`.

```sql
SELECT category, COUNT(*) AS item_count
FROM products
GROUP BY category;
```

This groups products by category and shows how many items each category contains.