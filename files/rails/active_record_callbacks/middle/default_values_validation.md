## 🎯 Set Default Values with before_validation
Leverage `before_validation` to assign default values or auto-populate fields before validation runs. This prevents validation failures for missing attributes and centralizes default logic.

```ruby
class Order < ApplicationRecord
  before_validation :set_default_status, on: :create

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
```

By providing defaults in `before_validation`, you ensure `status` is always present, simplifying both validations and form handling.