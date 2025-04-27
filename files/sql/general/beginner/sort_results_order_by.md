## 🔢 Sort Results with ORDER BY

Use `ORDER BY` to sort query results by one or more columns. You can specify ascending (`ASC`) or descending (`DESC`) order for each column.

```sql
SELECT id, created_at
FROM posts
ORDER BY created_at DESC;
```

This fetches posts ordered from newest to oldest based on `created_at`.