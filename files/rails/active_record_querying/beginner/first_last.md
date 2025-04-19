## 🥇 Fetching First and Last Records

Use `first` and `last` to quickly retrieve the first or last record based on the default or specified order. These methods hit the database immediately and return a single model instance or `nil` if none exists.

```ruby
# First user by id
first_user = User.order(:id).first

# Last post by created_at
latest_post = Post.order(:created_at).last
```