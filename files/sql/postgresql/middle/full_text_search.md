## 🔤 Full-Text Search with tsvector and tsquery

PostgreSQL’s full-text search lets you search unstructured text efficiently. Convert text to `tsvector`, index it, and use `to_tsquery` or `plainto_tsquery` for queries.

```sql
-- Add a tsvector column and index it
ALTER TABLE articles ADD COLUMN document tsvector;
UPDATE articles SET document = to_tsvector('english', title || ' ' || body);
CREATE INDEX idx_articles_document ON articles USING GIN (document);

-- Search for 'postgres tips'
SELECT id, title
FROM articles
WHERE document @@ plainto_tsquery('english', 'postgres tips');
```
