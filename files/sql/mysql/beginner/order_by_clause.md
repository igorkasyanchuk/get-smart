## 📑 Ordering Results with ORDER BY
`ORDER BY` sorts query results by one or more columns. Use `ASC` for ascending or `DESC` for descending order.

```sql
-- Sort users by creation date descending
SELECT id, name, created_at
FROM users
ORDER BY created_at DESC;

-- Sort products by price ascending, then name
SELECT *
FROM products
ORDER BY price ASC, name ASC;
```