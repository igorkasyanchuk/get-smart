## 🔗 Multi-Attribute Validation with `validate`

When validation logic spans multiple attributes, use a custom `validate` method. You can inspect or compare fields and add errors to specific attributes or `:base` for global errors.

```ruby
class Subscription < ApplicationRecord
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after start date")
      errors.add(:base, "Subscription period is invalid")
    end
  end
end
```
