## 🎯 Basic Usage: Auto-Updating Counters

With Counter Culture configured, any creation or deletion of a `Comment` will automatically update the `comments_count` on its associated `Post`. No manual callbacks needed!

```ruby
# creates a post with zero comments
post = Post.create!(title: 'Hello Counter')

# create a comment and auto-increment post.comments_count
comment = post.comments.create!(body: 'Great post!')
puts post.reload.comments_count  # => 1

# deleting the comment auto-decrements the counter
comment.destroy
puts post.reload.comments_count  # => 0
```

You can also handle multiple associations or custom column names by passing options:

```ruby
class Reply < ApplicationRecord
  belongs_to :comment
  counter_culture :comment, column_name: 'replies_count'
end
```