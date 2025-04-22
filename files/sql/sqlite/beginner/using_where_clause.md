## 🔍 Filtering with WHERE Clause

Use `WHERE` to filter rows based on conditions. You can combine conditions with `AND`, `OR`, and use comparison operators like `=`, `>`, `<`, etc.

```sql
-- Get users with id greater than 10
SELECT * FROM users WHERE id > 10;

-- Get users named 'Bob'
SELECT * FROM users WHERE name = 'Bob';

-- Combine conditions
SELECT * FROM users WHERE name = 'Bob' OR email LIKE '%@example.com';
```
