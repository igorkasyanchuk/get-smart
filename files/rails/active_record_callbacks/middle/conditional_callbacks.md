## ⚙️ Use Conditional Callbacks with `if`/`unless`
Make callbacks run only under specific conditions by using the `if` and `unless` options. This avoids unnecessary method calls and keeps callbacks focused.

```ruby
class Invoice < ApplicationRecord
  before_save :apply_discount, if: :eligible_for_discount?

  private

  def eligible_for_discount?
    total_amount > 1000
  end

  def apply_discount
    self.total_amount *= 0.9
  end
end
```

Here, `apply_discount` runs only when `eligible_for_discount?` returns true, preventing unwanted modifications.