## ⚡️ Partial & Expression Indexes for Targeted Performance
Create partial or expression indexes to speed up frequent queries on subsets or computed columns without inflating storage. SQLite will use these indexes automatically when the WHERE clause or expressions match.

```sql
-- Partial index for active users only
CREATE INDEX idx_users_active ON users(id)
  WHERE status = 'active';

-- Expression index for lowercased email lookups
CREATE INDEX idx_users_email_lower ON users(LOWER(email));
```
