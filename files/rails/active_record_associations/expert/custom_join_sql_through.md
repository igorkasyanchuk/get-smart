## 🗄️ Through Association with Custom JOIN SQL

For utmost control, define a custom SQL join in a `has_many :through` association. This technique is useful when the join logic cannot be represented by ActiveRecord alone.

```ruby
class User < ApplicationRecord
  has_many :project_memberships
  has_many :projects, -> {
    joins("INNER JOIN project_memberships pm ON pm.project_id = projects.id AND pm.active = true")
  }, through: :project_memberships
end
```
