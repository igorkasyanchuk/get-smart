## ❌ Deleting Records with DELETE
`DELETE` removes rows from a table. Use `WHERE` to limit deletions or combine with `LIMIT` for cautious cleanup.

```sql
-- Delete a single order by its ID
DELETE FROM orders
WHERE id = 1001;

-- Delete up to 10 old logs
DELETE FROM logs
WHERE created_at < '2022-01-01'
LIMIT 10;
```