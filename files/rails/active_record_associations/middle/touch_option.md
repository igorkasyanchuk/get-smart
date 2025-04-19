## 🛡️ Keeping Timestamps Fresh with `touch: true`

The `touch: true` option on a `belongs_to` association updates the parent’s `updated_at` when the child changes. This helps cache invalidation and external services tracking modification times. Use it to signal that the parent’s data has been indirectly altered.

```ruby
class Comment < ApplicationRecord
  belongs_to :post, touch: true
end

class Post < ApplicationRecord
  # When a comment is created/updated/destroyed, post.updated_at will be refreshed.
end
```