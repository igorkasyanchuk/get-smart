## ✏️ Basic CRUD Operations

Learn how to create tables and insert, read, update, and delete rows. This is the foundation of using any SQL database.

```sql
-- Create a table
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT,
  email TEXT
);

-- Insert a row
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');

-- Read rows
SELECT * FROM users;

-- Update a row
UPDATE users SET email = 'alice@newdomain.com' WHERE name = 'Alice';

-- Delete a row
DELETE FROM users WHERE id = 1;
```
