## 🐎 Eager Load Associations
Using `includes` prevents N+1 query issues by loading associated records in a single query. This reduces database trips and speeds up view rendering when accessing related data.

```ruby
# Without eager loading (N+1 problem)
@posts = Post.all
@posts.each do |post|
  puts post.comments.count
end

# With eager loading
@posts = Post.includes(:comments).all
@posts.each do |post|
  puts post.comments.count
end
```