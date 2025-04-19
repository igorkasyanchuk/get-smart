## 📚 Use `has_many` for One-to-Many Relations

Declare `has_many` on the parent model to relate it to multiple children. It provides collection methods like `build`, `create`, and enumeration helpers.

```ruby
# app/models/post.rb
class Post < ApplicationRecord
  has_many :comments
end
```

Now you can call `post.comments`, `post.comments.build(body: "Nice!")`, or `post.comments.create(body: "Great!")` to manage comment records.
