## 🔄 UPSERT with INSERT ... ON CONFLICT

Use `ON CONFLICT` to handle insert-or-update logic in one statement, eliminating race conditions and extra queries. Specify the constraint and the `DO UPDATE` action for atomic UPSERT behavior.

```sql
INSERT INTO users (email, name, last_login) VALUES
  ('alice@example.com', 'Alice', NOW())
ON CONFLICT (email) DO UPDATE
  SET name = EXCLUDED.name,
      last_login = EXCLUDED.last_login;
```
