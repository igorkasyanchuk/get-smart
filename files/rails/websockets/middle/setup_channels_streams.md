## 🚀 Organizing Channels and Streams

When working with WebSockets in Rails, you can structure your channels to mirror your resources, keeping real-time logic clean. Define subscription behavior in `subscribed` and manage your streams via `stream_from` or `stream_for` to ensure clients only receive relevant updates.

```ruby
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    # Stream for a specific chat room
    stream_from "chat_room_#{params[:room]}"
  end

  def unsubscribed
    # Cleanup logic if needed
  end
end

# app/javascript/channels/chat_channel.js
import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatChannel", room: "general" }, {
  received(data) {
    console.log("New message:", data)
  }
})
```