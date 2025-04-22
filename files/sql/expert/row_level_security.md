## 🔐 Row-Level Security Policies
Enforce fine-grained access controls directly in the database using Row-Level Security (RLS) policies.

```sql
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;

CREATE POLICY owner_only
  ON documents
  FOR ALL
  USING (owner_id = current_setting('app.current_user')::INT);

-- In your app session:
SET app.current_user = '42';
SELECT * FROM documents; -- returns only docs owned by user 42
```

RLS moves auth logic into the database, reducing injection risk and ensuring consistent enforcement across all clients.