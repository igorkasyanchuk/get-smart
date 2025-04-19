## 🧹 Clean Up with the `dependent` Option

To automatically remove children when a parent is deleted, use the `dependent` option. Common choices are `:destroy` or `:delete_all`.

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
end
```

Deleting `post.destroy` will call `comment.destroy` on each comment, triggering callbacks. Use `:delete_all` to bypass callbacks for speed.
