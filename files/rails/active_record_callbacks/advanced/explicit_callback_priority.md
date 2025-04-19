## 🎯 Tip: Explicit Callback Execution Order

Rails executes callbacks in definition order by default. You can enforce priority by specifying `prepend: true` or grouping callbacks around core logic.

```ruby
class Payment < ApplicationRecord
  before_validation :normalize_amount, prepend: true
  before_validation :round_amount

  private

  def normalize_amount
    self.amount = amount.to_f
  end

  def round_amount
    self.amount = amount.round(2)
  end
end
```

Using `prepend: true` guarantees your critical normalization runs before all other validations.