## ⚙️ Use custom SQL in scopes for performance-critical queries

Scopes can contain raw SQL for optimized queries:

```ruby
class Order < ApplicationRecord
  scope :recent_and_high_value, -> {
    where('created_at > ? AND total_amount > ?', 1.week.ago, 1000)
  }
end
```

Call it like:

```ruby
Order.recent_and_high_value
```

This improves readability and reuse of complex queries.