## 🧩 Dynamic Parameterized Scopes

You can build flexible reusable scopes by accepting dynamic parameters and lambdas. This allows you to compose queries at runtime without repeating logic, ensuring DRY code.

```ruby
class Order < ApplicationRecord
  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :placed_between, ->(start_date, end_date) {
    where(created_at: start_date..end_date) if start_date && end_date
  }
end

# Usage:
orders = Order.by_status("completed").placed_between(1.week.ago, Time.current)
```