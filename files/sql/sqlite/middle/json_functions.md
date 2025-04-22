## 🛠️ Querying JSON Data with JSON1 Extension

SQLite’s JSON1 extension provides functions like `json_extract`, `json_each`, and `json_group_array`. Use these to store and query semi-structured data directly in SQL.

```sql
CREATE TABLE settings (
  id INTEGER PRIMARY KEY,
  data JSON
);

INSERT INTO settings(data) VALUES (
  '{"theme": "dark", "notifications": {"email": true}}'
);

SELECT
  json_extract(data, '$.theme') AS theme,
  json_extract(data, '$.notifications.email') AS email_notifs
FROM settings;
```