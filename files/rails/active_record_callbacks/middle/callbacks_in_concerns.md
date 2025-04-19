## 📂 Extract Callbacks into Concerns
Keep models clean by moving related callbacks into a module concern, promoting reuse and better organization across multiple models.

```ruby
# app/models/concerns/trackable.rb
module Trackable
  extend ActiveSupport::Concern

  included do
    before_update :track_changes
  end

  private

  def track_changes
    AuditLog.create!(record: self, changes: saved_changes)
  end
end

# app/models/post.rb
class Post < ApplicationRecord
  include Trackable
end
```

This way, any model including `Trackable` will automatically get its update operations audited.