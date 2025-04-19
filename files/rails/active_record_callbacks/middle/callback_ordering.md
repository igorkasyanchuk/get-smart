## 🔢 Control Callback Order with `prepend`
By default, callbacks run in the order they’re defined. Use `prepend: true` to run critical callbacks earlier than inherited ones.

```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_save :log_save, prepend: true

  private

  def log_save
    Rails.logger.info "Saving #{self.class.name}..."
  end
end

class Account < ApplicationRecord
  before_save :encrypt_password
end
```

Here, `log_save` runs before `encrypt_password`, even though it's defined in the parent class.