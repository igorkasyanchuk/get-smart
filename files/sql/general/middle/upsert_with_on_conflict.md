## 🛠️ Handle Conflicts Gracefully with ON CONFLICT DO UPDATE
Use the `ON CONFLICT` clause to perform upserts (insert or update) in a single statement, avoiding separate existence checks and race conditions.

```sql
INSERT INTO users (email, name, login_count)
VALUES ('jane@example.com', 'Jane', 1)
ON CONFLICT (email)
DO UPDATE SET
  name = EXCLUDED.name,
  login_count = users.login_count + 1;
```