## 📌 Implement Full-Text Search with tsvector and tsquery
For efficient text searching, convert text columns to `tsvector` and query them with `to_tsquery`. Use a GIN index on the `tsvector` column for fast lookups.

```sql
-- Add tsvector column and index
ALTER TABLE articles
  ADD COLUMN content_tsv tsvector;
UPDATE articles
  SET content_tsv = to_tsvector('english', body);
CREATE INDEX idx_articles_tsv ON articles USING GIN (content_tsv);

-- Search query
SELECT id, title
FROM articles
WHERE content_tsv @@ to_tsquery('ruby & rails');
```