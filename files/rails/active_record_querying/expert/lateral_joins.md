## 🚀 Use LATERAL Joins for Row-by-Row Subqueries
PostgreSQL’s LATERAL joins let you execute a subquery per row in the outer query, returning dynamic columns. ActiveRecord 6+ supports `joins` with Arel for lateral queries, enabling you to rank or compute per-record aggregates inline without multiple queries.

```ruby
lateral = Arel.sql("LATERAL (
  SELECT MAX(score) AS top_score
  FROM ratings
  WHERE ratings.item_id = items.id
) AS top_rating")
Item.joins(lateral)
    .select('items.*', 'top_rating.top_score')
```

This technique is invaluable for leaderboards, per-user stats, or any scenario requiring tailored computed values in a single query.