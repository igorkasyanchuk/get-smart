## 📶 WebSocket-Powered Turbo Streams via ActionCable
Combine Turbo Streams with ActionCable for full-duplex real-time UIs. Broadcast server-side partial renders as Turbo Stream messages, and let the client automatically update the DOM with zero custom JavaScript.

```ruby
# app/channels/posts_channel.rb
class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end
end

# app/controllers/posts_controller.rb
def create
  @post = Post.create!(post_params)
  PostsChannel.broadcast_to(
    current_user,
    turbo_stream: render_to_string(
      partial: 'posts/post',
      locals: { post: @post }
    )
  )
end
```
