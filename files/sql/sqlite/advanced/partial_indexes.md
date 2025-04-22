## 🛠 Create Partial Indexes to Optimize Query Performance
Partial indexes only index rows matching a `WHERE` clause, reducing index size and improving write performance. Use them when you frequently filter by a specific condition, such as active users or recent records. Smaller indexes boost lookup speed and lower storage overhead.

```sql
-- Index only active users
CREATE INDEX idx_active_users ON users(id)
WHERE status = 'active';

-- Query will use the partial index
SELECT id, name
FROM users
WHERE status = 'active'
ORDER BY id;
```