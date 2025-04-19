## 🔎 Query Records with `where`

The `where` method is your go‑to for filtering records by conditions. It returns an `ActiveRecord::Relation`, so you can chain additional scopes like `order` or `limit`. Use hashes for simple equality checks or SQL fragments for complex queries.

```ruby
# Simple equality
todos = Todo.where(done: false)

# Complex conditions
recent_posts = Post.where('created_at > ?', 1.week.ago)
```  
