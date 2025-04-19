## 🚀 Creating Parameterized Scopes for Reusable Queries

Define scopes with lambdas to accept parameters and allow chaining for complex filters. This keeps queries DRY and lets you compose flexible query chains.

```ruby
class Order < ApplicationRecord
  scope :by_status, ->(status) { where(status: status) }
  scope :placed_between, ->(start_date, end_date) { where(created_at: start_date..end_date) }
end

# Usage
recent_shipped = Order.by_status('shipped').placed_between(1.week.ago, Time.current)
```
