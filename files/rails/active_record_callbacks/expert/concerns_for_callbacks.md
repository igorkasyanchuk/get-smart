## 🛠 Extracting Callback Logic into Concerns
When callbacks accumulate, extract them into an `ActiveSupport::Concern` for reuse and testability. Encapsulate the callback declaration and implementation in a module, then include it where needed.

```ruby
# app/models/concerns/audit_trail.rb
module AuditTrail
  extend ActiveSupport::Concern

  included do
    after_update :record_change
  end

  def record_change
    AuditLog.create!(record: self, changes: saved_changes)
  end
end

# app/models/user.rb
class User < ApplicationRecord
  include AuditTrail
end
```

This approach keeps models lean and promotes shared behavior across different models.