## 🔍 Chain Dynamic Filter Scopes
Combine multiple optional filters in a single database hit by chaining scopes that accept `nil` gracefully. This pattern prevents conditional logic in controllers and keeps queries composable.

```ruby
class Order < ApplicationRecord
  scope :by_status, ->(s) { where(status: s) if s.present? }
  scope :min_total, ->(amt) { where("total >= ?", amt) if amt.present? }
end

# Controller
orders = Order.all.by_status(params[:status]).min_total(params[:min_total])
```
