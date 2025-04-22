## ✂️ Limit the Number of Rows

When you only need a subset of results, use `LIMIT`. This is useful for pagination or quick previews.

```sql
SELECT *
FROM products
ORDER BY price ASC
LIMIT 5;
```

This returns the 5 cheapest products by ordering first and then limiting the output.