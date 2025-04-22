## 🔍 Implementing Full-Text Search with FTS5

FTS5 virtual tables provide fast tokenized search over text columns. Create an FTS5 table and query using `MATCH` for efficient relevance-based lookups.

```sql
CREATE VIRTUAL TABLE documents USING fts5(title, body);

INSERT INTO documents(title, body) VALUES
  ('SQLite Tips', 'Learn CTEs, window functions, and more.'),
  ('JSON in SQLite', 'Store and query JSON data easily');

SELECT title, rank
FROM documents,
     fts5_rank(documents) AS rank
WHERE documents MATCH 'JSON'
ORDER BY rank;
```