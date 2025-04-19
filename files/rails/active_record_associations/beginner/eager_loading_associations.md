## ⚡ Eager Load Associations with `includes`

Use `includes` in queries to avoid N+1 queries when loading associations. It fetches related records in bulk.

```ruby
# In controller or scope
posts = Post.includes(:comments).where(published: true)
posts.each do |post|
  puts post.comments.count
end
```

This performs two queries—one for posts and one for comments—instead of one per post for its comments.
