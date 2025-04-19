## 🔢 Limiting Number of Records with `limit`

`limit` restricts the number of records returned by your query. This is useful for pagination or fetching only top results. Combine with `order` for consistent subsets of data.

```ruby
# Get the first 5 users
top_users = User.order(created_at: :desc).limit(5)
```