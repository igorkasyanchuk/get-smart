## 🛠️ Custom Validation Methods
When built‑in validators aren’t enough, define your own validation logic in a private method. Use the `validate` macro to call custom methods and add errors on specific attributes.

```ruby
class Order < ApplicationRecord
  validate :expiration_date_cannot_be_in_the_past

  private

  def expiration_date_cannot_be_in_the_past
    return if expiration_date.blank? || expiration_date > Time.current
    errors.add(:expiration_date, "can't be in the past")
  end
end
```
