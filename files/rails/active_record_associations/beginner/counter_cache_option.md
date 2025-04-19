## 🔢 Use `counter_cache` for Fast Counts

Enable `counter_cache` to keep track of the number of associated records without running a COUNT query every time.

```ruby
# migration to add count
add_column :posts, :comments_count, :integer, default: 0

# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end
```

Now `post.comments_count` is automatically updated when comments are created or destroyed, giving instant counts.
