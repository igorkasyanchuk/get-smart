## 🔀 Dynamic Counters with Conditional Logic

When you need to increment counters only for records meeting certain conditions, use a `Proc` for `column_name`. This allows skipping updates or targeting different cache columns based on record state. After defining, run `counter_culture_fix_counts` to backfill existing data.

```ruby
# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post

  # Only count comments that are not marked as spam
  counter_culture :post,
    column_name: ->(comment) { comment.spam? ? nil : 'comments_count' }
end

# Backfill existing counts
Comment.counter_culture_fix_counts
```

In this setup, any comment where `spam?` returns `true` will be skipped (no nil counter), ensuring your `posts.comments_count` only reflects legitimate comments.