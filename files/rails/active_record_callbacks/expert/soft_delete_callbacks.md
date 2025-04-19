## 🔗 Implementing Soft Delete with Callbacks and Scopes
Use `before_destroy` to mark records as deleted and override default scope. Avoid actual deletes and retain historical data, while ensuring dependent associations are handled gracefully.

```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  default_scope { where(deleted_at: nil) }
end

class Post < ApplicationRecord
  before_destroy :soft_delete

  private

  def soft_delete
    update_column(:deleted_at, Time.current)
    throw(:abort)
  end
end
```

Queries automatically exclude soft-deleted records. Use `unscoped` to fetch all entries. This technique ensures data retention without complex SQL overrides.