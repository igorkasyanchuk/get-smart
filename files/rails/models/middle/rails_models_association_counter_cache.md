## 🔢 Leverage Counter Cache for Performance

Counter caches keep track of the number of associated records, reducing the need for expensive `COUNT` queries. Add a column like `comments_count` on the parent table and enable `counter_cache` on the association. Rails will automatically update the counter when children are added or removed.

```ruby
# migration:
add_column :posts, :comments_count, :integer, default: 0, null: false

# models:
class Post < ApplicationRecord
  has_many :comments
end

class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end
```