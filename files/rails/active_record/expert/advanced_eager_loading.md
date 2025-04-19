## 📥 Advanced Eager Loading Strategies
Use `preload`, `eager_load`, and `includes` in combination with `where` on associations to craft the optimal query plan. Inspect `EXPLAIN ANALYZE` for each variation.

```ruby
# Eager load users with only published posts and their recent comments
users = User
  .includes(posts: :comments)
  .where(posts: { status: 'published' })
  .references(:posts)
  .where(comments: { created_at: 1.week.ago.. })

puts User.connection.execute("EXPLAIN ANALYZE #{users.to_sql}")
```