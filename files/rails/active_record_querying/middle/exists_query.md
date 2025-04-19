## 🚀 Checking Existence with `exists?`

`exists?` returns a boolean indicating whether any records match the given conditions. It's optimized to use `LIMIT 1`, making it faster than fetching records.

```ruby
# Check if a user with a given email exists
User.exists?(email: 'user@example.com')
```