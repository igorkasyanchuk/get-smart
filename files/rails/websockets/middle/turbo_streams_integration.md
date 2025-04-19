## 🔧 Using Turbo Streams with Action Cable

Leverage Turbo Streams for declarative real-time updates without manual JavaScript wiring. Rails can automatically broadcast updates from models by using built‑in helpers.

```ruby
# app/models/comment.rb
class Comment < ApplicationRecord
  belongs_to :post
  after_create_commit -> {
    broadcast_append_to post, target: "comments_list"
  }
end

# app/views/posts/show.html.erb
<div id="comments_list">
  <%= render @post.comments %>
</div>
```