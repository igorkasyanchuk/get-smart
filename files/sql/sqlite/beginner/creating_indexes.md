## ⚙️ Creating Indexes for Performance

Indexes speed up lookups on large tables. Create an index on columns you query frequently. Keep in mind indexes take additional space.

```sql
-- Create an index on the email column
CREATE INDEX idx_users_email ON users(email);

-- Drop the index if it's no longer needed
DROP INDEX idx_users_email;
```
