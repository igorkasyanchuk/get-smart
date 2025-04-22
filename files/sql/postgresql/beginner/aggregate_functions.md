## ∑ Use Aggregate Functions
Aggregate functions let you summarize data. Common ones include `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`:

```sql
-- Count total users
SELECT COUNT(*) FROM users;

-- Average user ID
SELECT AVG(id) FROM users;
```