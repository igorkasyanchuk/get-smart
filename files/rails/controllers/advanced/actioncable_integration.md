## 🌐 Integrate WebSockets with ActionCable in Controllers
Trigger broadcasts from controller actions to update clients in real-time. Use `ActionCable.server.broadcast` in your create/update/destroy actions.

```ruby
class CommentsController < ApplicationController
  def create
    @comment = Comment.create!(comment_params)
    ActionCable.server.broadcast(
      "comments_#{@comment.post_id}",
      render_to_string(partial: 'comments/comment', locals: { comment: @comment })
    )
    head :ok
  end
end
```

On the client-side, subscribe to the channel and append new comments dynamically.