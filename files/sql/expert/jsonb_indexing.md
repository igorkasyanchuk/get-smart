## 🔍 GIN Index on JSONB for Semi-Structured Data
Accelerate queries against JSONB columns by creating GIN indexes on keys or path expressions.

```sql
CREATE INDEX idx_users_preferences_theme
  ON users
  USING GIN ((preferences ->> 'theme'))
  WHERE preferences ? 'theme';

SELECT id, preferences->>'theme'
FROM users
WHERE preferences ->> 'theme' = 'dark';
```

The partial index on the JSON path dramatically speeds up lookups of users with a specific theme. Use `jsonb_path_ops` for containment queries.