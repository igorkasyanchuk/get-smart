## 🔢 Ordering Query Results

Use `order` to sort your query by one or more columns. You can specify `:asc` or `:desc` for ascending or descending order. Chaining multiple `order` calls will override previous ones unless you use hashes.

```ruby
# Get users ordered by created_at descending
sorted_users = User.order(created_at: :desc)

# Order posts by title ascending then id descending
posts = Post.order(title: :asc, id: :desc)
```