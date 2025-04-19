## 💬 Manually Broadcast from Controllers

Sometimes you need to push custom data or triggers. Use `ActionCable.server.broadcast` inside controllers or service objects to push arbitrary payloads to a channel.

```ruby
# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @message = Message.create!(message_params)
    ActionCable.server.broadcast(
      "chat_room_#{@message.room_id}_notifications",
      content: render_to_string(partial: 'messages/notification', locals: { message: @message })
    )
    head :ok
  end
end
```

On the client side, listen for the same stream and insert the rendered HTML:

```js
// app/javascript/channels/chat_room_notifications_channel.js
consumer.subscriptions.create(
  { channel: 'ChatRoomChannel', room_id: ROOM_ID },
  {
    received(data) {
      document.getElementById('notifications').insertAdjacentHTML('beforeend', data.content);
    }
  }
);
```