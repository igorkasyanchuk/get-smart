## 🏷️ Partial and Expression Indexes for Targeted Performance
Create partial or expression-based indexes to optimize queries that filter on specific values or computed expressions. Partial indexes index only rows matching a condition, reducing index size and maintenance cost. Expression indexes let you index the result of a function call, such as `LOWER(email)`, for case-insensitive searches.

```sql
-- Index active users only
CREATE INDEX idx_users_active ON users (created_at)
WHERE status = 'active';

-- Index lowercase email for ILIKE searches
CREATE INDEX idx_users_email_lower ON users ((LOWER(email)));
```