## 🏗️ Build Associated Records in Memory

Use the `build_*` methods to instantiate child records linked to the parent without saving to the database immediately.

```ruby
# In controller or console
post = Post.new(title: "Hello")
comment = post.comments.build(body: "First!")
# post and comment are not saved yet
post.save
```

Calling `post.save` persists both `post` and its built `comment` in one go.
