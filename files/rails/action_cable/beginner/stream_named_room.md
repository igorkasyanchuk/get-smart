## 🔗 Streaming from Named Streams

For chat rooms or scoped streams, use `stream_for` to isolate data per resource. Pass parameters when subscribing and broadcast directly to that instance.

```ruby
# app/channels/chat_channel.rb
class ChatChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:room_id])
    # Stream only from this specific room
    stream_for room
  end
end
```

```ruby
# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :room
  after_create_commit do
    # Broadcast this message to subscribers of the room
    ChatChannel.broadcast_to(room, content: content, user: user.name)
  end
end
```

Clients must subscribe with `{ room_id: 42 }` to receive messages for that room.