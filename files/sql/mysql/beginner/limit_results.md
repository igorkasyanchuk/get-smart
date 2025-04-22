## 🎯 Using LIMIT to Restrict Rows
`LIMIT` restricts the number of rows returned by a query. It's useful for pagination or previewing data.

```sql
-- Return only the first 5 users
SELECT id, name
FROM users
LIMIT 5;

-- Skip the first 10 and return the next 5
SELECT *
FROM orders
LIMIT 10, 5;
```