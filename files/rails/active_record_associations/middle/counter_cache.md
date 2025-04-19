## 📈 Speeding Up Counts with `counter_cache`

The `counter_cache` option maintains a numeric column on the parent to track the size of an association, avoiding expensive `COUNT(*)` SQL calls. Add an integer column named `#{child_name}_count` and enable `counter_cache: true` on the `belongs_to` side.

```ruby
# migration
def change
  add_column :posts, :comments_count, :integer, default: 0, null: false
end

class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end
```
