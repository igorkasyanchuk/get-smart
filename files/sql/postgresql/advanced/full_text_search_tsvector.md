## 🗣️ Full-Text Search with Custom Dictionaries and Rankings
Implement full-text search by adding a `tsvector` column and indexing it with a GIN index. Use custom text search configurations or dictionaries for multilingual support. Combine `ts_rank` and `plainto_tsquery` (or `websearch_to_tsquery`) for relevance-ranked search results.

```sql
ALTER TABLE articles ADD COLUMN search_vector tsvector;
UPDATE articles
SET search_vector = to_tsvector('english', coalesce(title, '') || ' ' || coalesce(body, ''));
CREATE INDEX idx_articles_search ON articles USING GIN(search_vector);

-- Query with ranking
SELECT id, title, ts_rank(search_vector, q) AS rank
FROM articles, to_tsquery('english', 'postgres & performance') q
WHERE search_vector @@ q
ORDER BY rank DESC;
```