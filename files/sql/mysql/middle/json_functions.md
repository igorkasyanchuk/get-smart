## 📦 Querying and Modifying JSON Columns
MySQL’s JSON data type stores semi-structured data; use functions like `JSON_EXTRACT`, `JSON_SET`, and `JSON_CONTAINS` to read or update nested values. Index JSON paths with generated columns for faster lookups.

```sql
-- Extract nested value
SELECT JSON_EXTRACT(meta, '$.preferences.theme') AS theme
FROM users;

-- Update JSON field
UPDATE users
SET meta = JSON_SET(meta, '$.preferences.theme', 'dark');
```
