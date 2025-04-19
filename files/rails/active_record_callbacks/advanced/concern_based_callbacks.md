## 📚 Tip: Organizing Callbacks with Concerns

Extract common callback logic into `ActiveSupport::Concern` to keep your models DRY and modular. This is invaluable when multiple models share behavior.

```ruby
# app/models/concerns/auditable.rb
to do:
module Auditable
  extend ActiveSupport::Concern

  included do
    after_create :record_creation
    after_update :record_change
  end

  private

  def record_creation
    AuditLog.create!(action: 'create', record: self)
  end

  def record_change
    AuditLog.create!(action: 'update', record: self)
  end
end

# app/models/user.rb
class User < ApplicationRecord
  include Auditable
end
```

Concerns promote separation of concerns and ease testing of callback logic in isolation.