## 🗂 Implement Full-Text Search with FTS5
FTS5 allows blazing-fast full-text search over large text fields by creating a virtual table with its own tokenizer. Use `MATCH` queries and rank results with BM25. It's ideal for search boxes, log analysis, and content indexing.

```sql
-- Create an FTS5 virtual table
CREATE VIRTUAL TABLE articles_idx USING fts5(
  title, content, tokenize = 'porter'
);

-- Index existing data
INSERT INTO articles_idx(rowid, title, content)
SELECT id, title, content FROM articles;

-- Perform a full-text search
SELECT rowid, title,
  bm25(articles_idx) AS rank
FROM articles_idx
WHERE articles_idx MATCH 'SQLite optimization'
ORDER BY rank;
```