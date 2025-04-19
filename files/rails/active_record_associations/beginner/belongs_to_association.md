## 🔗 Use `belongs_to` to Set Parent Relationships

When a model holds the foreign key, use `belongs_to` to declare its parent. This sets up methods to access and manipulate the associated parent record.

```ruby
# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post
end
```

Here, `comment.post` returns the associated `Post` object, and `comment.post = new_post` updates the foreign key accordingly.
