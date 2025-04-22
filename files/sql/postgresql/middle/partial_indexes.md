## 🔎 Partial Indexes for Conditional Indexing

Partial indexes index only a subset of rows that meet a condition, reducing index size and improving write performance. They’re ideal when queries often filter by a specific criteria.

```sql
-- Only index active users
CREATE INDEX idx_active_users ON users (last_login)
WHERE status = 'active';

-- This query will use the partial index
SELECT * FROM users
WHERE status = 'active'
  AND last_login > NOW() - INTERVAL '30 days';
```
