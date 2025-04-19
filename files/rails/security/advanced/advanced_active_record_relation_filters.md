## 🔒 Advanced ActiveRecord::Relation Filters

Chain relations instead of interpolating values to build dynamic queries securely. Avoid string interpolation and rely on `where` queries with hashes or arrays.

```ruby
scope :recent_signups, ->(days_ago) do
  where("created_at >= ?", Time.current - days_ago.days)
end

# Usage:
User.recent_signups(params[:days].to_i)
```

This pattern keeps queries safe and composable, letting ActiveRecord handle sanitization.