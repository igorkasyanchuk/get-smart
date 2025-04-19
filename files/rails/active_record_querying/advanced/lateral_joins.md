## 🔗 Perform LATERAL Joins for Dependent Subqueries
LATERAL joins execute a subquery for each row of the main query, useful for fetching related summary or top-N data. Combine `.joins` with raw SQL or Arel to integrate LATERAL into ActiveRecord relations cleanly.

```ruby
# Fetch each author with their latest post title
authors = Author
  .joins("LEFT JOIN LATERAL (
    SELECT title FROM posts WHERE posts.author_id = authors.id ORDER BY created_at DESC LIMIT 1
  ) AS latest ON true")
  .select('authors.*', 'latest.title AS latest_post')
```
