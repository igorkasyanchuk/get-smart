## 🔀 Use INSERT ... ON CONFLICT for Upserts
SQLite’s `INSERT ... ON CONFLICT` clause allows you to insert rows or update them if a uniqueness constraint violation occurs. This approach reduces round trips by combining insert and update logic into one atomic statement. Use it to simplify upsert patterns and ensure data integrity under high-concurrency workloads.

```sql
-- Create table with unique constraint
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  email TEXT UNIQUE,
  name TEXT
);

-- Insert or update if email already exists
INSERT INTO users (email, name)
VALUES ('alice@example.com', 'Alice')
ON CONFLICT(email) DO UPDATE SET
  name = excluded.name;
```