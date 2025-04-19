## 🔀 Conditional Validation with Lambdas

Use lambdas for `if` and `unless` to conditionally apply validations based on dynamic model state. This is particularly useful when validations depend on other attributes or external services.

```ruby
class Order < ApplicationRecord
  validates :shipping_address, presence: true, if: ->(order) { order.shipped? }
  validates :tracking_number, presence: true, unless: ->(order) { order.expedited? }
end

# Usage
order = Order.new(shipped: true)
order.valid? # triggers shipping_address presence check
```
