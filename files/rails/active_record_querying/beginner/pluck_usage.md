## 📌 Using `pluck` to Select Values

`pluck` retrieves specific column values directly from the database as an array, without loading full model instances. It's more efficient when you only need raw data instead of ActiveRecord objects. Use it to speed up simple queries.

```ruby
# Get all user emails as an array of strings
emails = User.pluck(:email)

# Get titles and IDs from posts
post_data = Post.pluck(:id, :title)
```