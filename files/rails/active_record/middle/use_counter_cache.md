## 🔢 Optimize Counters with `counter_cache`

Enable `counter_cache` on your associations to keep track of related record counts without running a separate `COUNT` query every time.

```ruby
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end

# In posts table, add a column:
# t.integer :comments_count, default: 0, null: false

# Usage:
post = Post.find(1)
post.comments_count  # returns the cached count
```