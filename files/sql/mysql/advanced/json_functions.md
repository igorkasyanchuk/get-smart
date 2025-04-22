## 🗄️ Efficiently Query JSON Data with JSON_EXTRACT and JSON_OVERLAPS
MySQL’s JSON functions let you store semi-structured data while still indexing key paths via generated columns. Use JSON_EXTRACT to pull nested values, and JSON_OVERLAPS to filter arrays efficiently. Combine them with indexes on generated columns to keep performance predictable.

```sql
SELECT
  id,
  JSON_EXTRACT(metadata, '$.preferences.theme') AS theme
FROM users
WHERE JSON_OVERLAPS(tags, JSON_ARRAY('premium','beta_tester'));
```