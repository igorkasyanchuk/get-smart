## 📝 Filtering with WHERE
The `WHERE` clause lets you return only rows that meet specified conditions. Combine operators (`=`, `<`, `>`, `LIKE`) to narrow results.

```sql
SELECT id, name, email
FROM users
WHERE active = 1;

-- Using LIKE for pattern matching
SELECT *
FROM products
WHERE name LIKE 'Apple%';
```