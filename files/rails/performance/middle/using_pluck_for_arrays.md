## 📌 Use `pluck` Instead of `map`

When you only need a single attribute array, `pluck` fetches directly from the database, skipping ActiveRecord object instantiation and improving memory usage.

```ruby
# Fetch all active user IDs without loading full models
active_user_ids = User.where(active: true).pluck(:id)
```
