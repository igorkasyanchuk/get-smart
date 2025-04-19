## 🔢 Use `counter_cache` for Associated Counts

Maintain a real-time count of associated records without hitting the database every time. Add a `_count` column and enable `counter_cache` on the association.

```ruby
# migration
generate migration AddCommentsCountToPosts comments_count:integer default: 0

# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
end
```
