## 🎲 Handle JSON Data with SQLite's JSON1 Extension
SQLite’s JSON1 extension provides functions like `json_extract()`, `json_set()`, and `json_each()` to store and query JSON documents. This enables schemaless data storage alongside relational tables. Use JSON functions for flexible attributes while maintaining relational integrity.

```sql
-- Store settings in a JSON column
CREATE TABLE app_config (
  id INTEGER PRIMARY KEY,
  config JSON
);

-- Update a nested JSON key
UPDATE app_config
SET config = json_set(config, '$.theme.color', 'dark');

-- Query nested values
SELECT json_extract(config, '$.theme.color') AS theme_color
FROM app_config;
```