## ⏭️ Efficient Pagination with LIMIT and OFFSET
`LIMIT offset, count` helps paginate results but large offsets can be slow. For deep pagination, use keyset pagination by filtering on the last seen value. This avoids scanning skipped rows and improves performance on large datasets.

```sql
-- Offset pagination
SELECT * FROM posts ORDER BY created_at DESC LIMIT 1000, 20;

-- Keyset pagination
SELECT * FROM posts
WHERE created_at < '2023-06-01'
ORDER BY created_at DESC
LIMIT 20;
```
