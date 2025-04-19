## 🧬 Crafting Custom Class Macros via `included` and `class_eval`
Combine `included` with `class_eval` to define custom DSL methods on host classes. This approach powers frameworks that provide declarative APIs like `validates` or `has_many`.

```ruby
module ActsAsSortable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_sortable(field)
      class_eval do
        scope :sorted, -> { order(field => :asc) }
      end
    end
  end
end

class Item < ApplicationRecord
  include ActsAsSortable
  acts_as_sortable :position
end
```

This pattern cleanly injects scopes or methods based on macro arguments.