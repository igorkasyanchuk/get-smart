## 📏 Limiting the Number of Rows

Use `LIMIT` to restrict how many rows are returned. This is useful for pagination or when testing queries.

```sql
-- Get only the first 5 users
SELECT * FROM users LIMIT 5;

-- Skip first 10 rows and get the next 5
SELECT * FROM users LIMIT 5 OFFSET 10;
```
