## 🌳 Recursive Self-referential Tree Associations

Model hierarchical data using self-referential associations for trees and graphs. By coupling `has_many` and `belongs_to` with a `closure_tree` approach, you can query descendants and ancestors efficiently.

```ruby
class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', optional: true

  # get all descendants recursively
  def descendants
    children + children.flat_map(&:descendants)
  end
end
```
