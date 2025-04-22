## 🔄 Update Existing Records
Modify rows using `UPDATE`. Always use a `WHERE` clause to avoid unintended bulk changes:

```sql
-- Update a single user's email
UPDATE users
SET email = 'alice@newdomain.com'
WHERE id = 1;

-- Update multiple records
UPDATE users
SET name = 'Unknown'
WHERE name IS NULL;
```