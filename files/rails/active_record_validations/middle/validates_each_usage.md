## ⚙️ Custom Loops with `validates_each`
Use `validates_each` to apply validation logic across one or more attributes in a single block. This is great for transforming or checking multiple fields in concert.

```ruby
class Invoice < ApplicationRecord
  validates_each :due_date, :paid_date do |record, attr, value|
    next if value.blank? || value > Date.current
    record.errors.add(attr, "must be in the future")
  end
end
```
