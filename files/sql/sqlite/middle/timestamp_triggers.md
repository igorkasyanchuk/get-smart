## ⏱️ Automatically Maintaining Timestamps with Triggers

Use triggers to auto-update `created_at` and `updated_at` columns without repetition in application code. Define `BEFORE INSERT` and `BEFORE UPDATE` triggers on your tables.

```sql
CREATE TABLE posts (
  id INTEGER PRIMARY KEY,
  title TEXT,
  content TEXT,
  created_at TEXT,
  updated_at TEXT
);

CREATE TRIGGER set_post_timestamps
BEFORE INSERT ON posts
FOR EACH ROW
BEGIN
  SELECT
    CASE
      WHEN NEW.created_at IS NULL THEN NEW.created_at = datetime('now') END,
    NEW.updated_at = datetime('now');
END;

CREATE TRIGGER update_post_timestamp
BEFORE UPDATE ON posts
FOR EACH ROW
BEGIN
  SELECT NEW.updated_at = datetime('now');
END;
```