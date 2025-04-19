## 🔄 Overriding Callback Order with `prepend: true`
By default, subclasses append callbacks after parent callbacks. Use `prepend: true` to ensure your callback runs before inherited ones. This is crucial when you need to enforce preconditions before any parent logic executes.

```ruby
class BaseRecord < ApplicationRecord
  before_save :log_save, prepend: true

  private

  def log_save
    Rails.logger.info("BaseRecord saving: #{self.id}")
  end
end

class SpecialRecord < BaseRecord
  before_save :validate_special, prepend: true

  private

  def validate_special
    throw(:abort) unless special_flag?
  end
end
```

Here, `validate_special` runs before `log_save`, even though `log_save` is declared in the parent. This helps you compose complex callback stacks predictably.