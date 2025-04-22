## 🏷️ Creating Partial Indexes for Faster Lookups

Partial indexes cover only rows matching a condition, reducing index size and speeding up targeted queries. Ideal for columns with many NULLs or infrequent values.

```sql
CREATE INDEX idx_active_users
ON users(email)
WHERE status = 'active';

-- Query that benefits:
SELECT * FROM users WHERE status = 'active' AND email LIKE '%@example.com';
```