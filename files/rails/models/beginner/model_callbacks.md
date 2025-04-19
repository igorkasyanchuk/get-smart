## 🏃‍♂️ Using Model Callbacks

Callbacks let you hook into the lifecycle of an ActiveRecord object (e.g., before save). Use them to modify data or trigger side effects.

```ruby
class Order < ApplicationRecord
  before_validation :set_default_status
  after_create :send_confirmation_email

  private

  def set_default_status
    self.status ||= 'pending'
  end

  def send_confirmation_email
    OrderMailer.confirmation(self).deliver_later
  end
end
```

Avoid complex logic in callbacks to keep models maintainable; consider service objects for heavy operations.