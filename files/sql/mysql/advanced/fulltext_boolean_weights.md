## 🔎 Boost Full-Text Search Precision with Boolean Mode and Weighting
Boolean full-text searches let you include/exclude terms and use wildcards. You can also assign custom weights by indexing critical columns separately and combining MATCH() scores. This yields relevance ranking tailored to your business needs.

```sql
ALTER TABLE articles ADD FULLTEXT INDEX ft_title_content (title, content);

SELECT
  id,
  MATCH(title, content) AGAINST('+database -NoSQL' IN BOOLEAN MODE) AS score
FROM articles
WHERE MATCH(title, content) AGAINST('+database -NoSQL' IN BOOLEAN MODE)
ORDER BY score DESC;
```