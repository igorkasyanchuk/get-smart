## 🎭 Using Enums for Finite States

Enums let you map integer columns to human-readable symbols. They add query helpers and scopes for each state.

```ruby
class Payment < ApplicationRecord
  enum status: { pending: 0, completed: 1, failed: 2 }
end

# Usage:
payment = Payment.new
payment.pending!      # sets status to 0 (pending)
payment.completed?    # => false
Payment.failed        # returns scope for failed payments
```