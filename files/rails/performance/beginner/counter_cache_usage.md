## 📊 Leverage counter_cache
Counting associated records repeatedly is inefficient. Use Rails’ `counter_cache` to maintain a count column on the parent model, avoiding `COUNT(*)` queries.

```ruby
# Migration to add comments_count to posts
add_column :posts, :comments_count, :integer, default: 0, null: false

# Comment model
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end

# Now you can display post.comments_count directly
<%= @post.comments_count %> comments
```