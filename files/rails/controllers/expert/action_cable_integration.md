## 🔗 Broadcasting from Controllers to Action Cable Channels

Trigger real-time updates by broadcasting messages from controller actions. This decouples business logic from channels and allows fine-grained control over who sees what when mutating server-side state.

```ruby
class CommentsController < ApplicationController
  def create
    comment = Comment.create!(comment_params)
    ActionCable.server.broadcast(
      "comments_#{comment.post_id}",
      id: comment.id,
      body: comment.body,
      user: comment.user.name
    )
    head :created
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
```