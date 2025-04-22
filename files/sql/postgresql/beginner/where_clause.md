## ❓ Filter Results with WHERE
The `WHERE` clause filters rows based on conditions. Combine conditions using `AND`, `OR`, and comparison operators:

```sql
-- Single condition
SELECT * FROM users
WHERE email LIKE '%@example.com';

-- Multiple conditions
SELECT * FROM users
WHERE name = 'Alice' AND id > 5;
```