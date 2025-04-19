## 🔗 Merge Scopes with `merge`

Combine separate `ActiveRecord::Relation` objects using `merge` to compose queries defined in different scopes or methods.

```ruby
class User < ApplicationRecord
  scope :active, -> { where(active: true) }
  scope :with_role, ->(role) { where(role: role) }
end

users = User.active.merge(User.with_role('admin'))
```