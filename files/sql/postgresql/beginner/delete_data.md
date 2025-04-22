## 🗑️ Delete Records Safely
Use `DELETE` to remove rows. Combining it with `WHERE` ensures you delete only what you mean to:

```sql
-- Delete a user by ID
DELETE FROM users
WHERE id = 2;

-- Delete all users with no email
DELETE FROM users
WHERE email IS NULL;
```