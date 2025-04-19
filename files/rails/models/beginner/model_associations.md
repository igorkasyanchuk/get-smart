## 🤝 Defining Associations

Associations let you connect models and easily query related data. Use macros like `has_many` and `belongs_to` to declare relationships.

```ruby
class Post < ApplicationRecord
  # Each post belongs to a single author (User)
  belongs_to :user
  # A post can have many comments
  has_many :comments, dependent: :destroy
end

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
```

The `dependent: :destroy` option ensures comments are removed when the post is deleted.