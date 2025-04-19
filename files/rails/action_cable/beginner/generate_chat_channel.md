## 🆕 Generate and Define a Channel

Channels in Action Cable act like controllers for real-time WebSocket connections. Use the Rails generator to create a new channel and then define subscription and cleanup logic.

```bash
# Generate a ChatChannel
rails generate channel Chat
```

```ruby
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    # Start streaming from a named channel
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
```

Now you have a `ChatChannel` that streams messages to all subscribers.