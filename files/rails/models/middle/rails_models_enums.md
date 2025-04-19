## 🔢 Define Enums for Finite States

Enums map integer columns to meaningful Ruby symbols, improving readability and maintainability. Declare your enum in the model, and Rails adds helper methods for querying and assignment. You can also scope by enum values automatically.

```ruby
class Order < ApplicationRecord
  enum status: { pending: 0, paid: 1, shipped: 2, cancelled: 3 }
end

# Usage:
Order.paid
order.shipped!
```