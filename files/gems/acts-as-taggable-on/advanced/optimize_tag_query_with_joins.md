## 🚀 Optimizing Tag Queries with Custom Joins and Eager Loading
Complex tag-based queries can become slow on large datasets. You can speed them up by crafting custom `JOIN` clauses, adding selected columns, and eager loading related records to reduce N+1 queries.

Example: Fetching published Articles tagged with both `ruby` and `rails`:

```ruby
Article.joins(
  "INNER JOIN taggings t1 ON t1.taggable_id = articles.id AND t1.taggable_type = 'Article'",
  "INNER JOIN tags tag1 ON tag1.id = t1.tag_id AND tag1.name = 'ruby'",
  "INNER JOIN taggings t2 ON t2.taggable_id = articles.id AND t2.taggable_type = 'Article'",
  "INNER JOIN tags tag2 ON tag2.id = t2.tag_id AND tag2.name = 'rails'"
)
.where(published: true)
.select('articles.*, COUNT(*) OVER() AS total_count')
.includes(:taggings, :tags)
.limit(20)
```

This approach:

1. Uses raw SQL joins for precise control.
2. Leverages window functions (`COUNT(*) OVER()`) to paginate without extra queries.
3. Eager loads `:taggings` and `:tags` to avoid N+1.
