## 🚀 Stream Model Events with broadcast_append_to

Use Rails built-in streaming helpers to broadcast model events automatically. By adding `after_create_commit` or similar callbacks in your model, you can push new records to subscribed clients without writing manual broadcasts.

```ruby
# app/models/message.rb
typically class Message < ApplicationRecord
  after_create_commit -> { broadcast_append_to "chat_room_#{room_id}_messages" }
end
```

In your channel, subscribe to the same stream identifier:

```ruby
# app/channels/chat_room_channel.rb
class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:room_id]}_messages"
  end
end
```

This setup ensures any new `Message` record is automatically appended to all clients in that chat room.