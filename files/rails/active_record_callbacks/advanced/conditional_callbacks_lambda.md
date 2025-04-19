## 🔀 Tip: Conditional Callbacks with Lambda

You can control callback execution using `if:` and `unless:` with lambdas to defer evaluation until runtime. This allows fine‐grained logic per record without polluting the model namespace.

```ruby
class Order < ApplicationRecord
  before_save :set_discount, if: -> { promotional_period? }
  after_create :notify_customer, unless: -> { skip_notifications }

  private

  def promotional_period?
    Date.today.between?(start_date, end_date)
  end

  def skip_notifications
    ENV['SKIP_NOTIFICATIONS'] == 'true'
  end
end
```

This ensures your callbacks only run under precise conditions, improving performance and readability.