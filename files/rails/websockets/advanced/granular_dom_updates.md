## ✨ Granular DOM Updates with CableReady

Use CableReady for fine‐grained DOM mutations over WebSockets. It batches operations and minimizes client‑side diffing overhead.

```ruby
# app/channels/posts_channel.rb
class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end

  def update(data)
    post = Post.find(data["id"])
    post.update!(content: data["content"])
    broadcast_replace(post)
  end

  private

  def broadcast_replace(post)
    CableReady["posts"].inner_html(
      selector: "#post_#{post.id}",
      html: ApplicationController.render(
        partial: "posts/post",
        locals: { post: post }
      )
    )
    CableReady.broadcast
  end
end
```

```javascript
// app/javascript/channels/posts_subscriber.js
import CableReady from "cable_ready"
import consumer from "./consumer"

consumer.subscriptions.create("PostsChannel", {
  received(data) {
    if (data.cableReady) CableReady.perform(data.operations)
  }
})
```