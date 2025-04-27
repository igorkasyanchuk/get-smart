## 📝➖ Update and Delete Records

Use `UPDATE` to modify existing rows and `DELETE` to remove them. Always include a `WHERE` clause to avoid unintentional changes.

```sql
-- Update example
UPDATE products
SET price = price * 1.10
WHERE category = 'Electronics';

-- Delete example
DELETE FROM sessions
WHERE last_active < '2023-01-01';
```

The first query increases electronics prices by 10%, and the second removes old sessions before 2023-01-01.