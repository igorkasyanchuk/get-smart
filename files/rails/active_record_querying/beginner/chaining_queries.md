## 🔗 Chaining Queries Together

You can chain ActiveRecord query methods to build complex queries step by step. Each method returns a new relation without hitting the database until you call a retrieval method like `to_a`, `first`, or `each`. This promotes readability and reusability.

```ruby
recent_active = User.where(active: true)
                   .order(updated_at: :desc)
                   .limit(10)
recent_active.each { |u| puts u.email }
```