## 🪄 Leverage Window Functions for Ranking and Running Totals
ActiveRecord supports window functions via raw SQL or Arel to compute row numbers, ranks, or cumulative sums without loading all records into memory. This approach pushes calculations to the database for efficiency and scalability. Use `Arel.sql` or `select` with `OVER` clauses to integrate window functions seamlessly in your relation.

```ruby
# Rank users by score within each country
users = User
  .select(
    :id,
    :name,
    Arel.sql("ROW_NUMBER() OVER (PARTITION BY country ORDER BY score DESC) AS country_rank")
  )
  .where(country: 'US')
```
