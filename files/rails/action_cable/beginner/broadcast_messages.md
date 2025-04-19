## 📲 Broadcasting Messages from Rails

To send data from the server to all subscribed clients, use `ActionCable.server.broadcast`. You can broadcast from controllers, models, or background jobs to push JSON payloads over WebSockets.

```ruby
# app/controllers/messages_controller.rb
def create
  @message = Message.create!(message_params)

  # Broadcast to the "chat_channel"
  ActionCable.server.broadcast(
    "chat_channel",
    content: @message.content,
    user: @message.user.name
  )
end
```

Clients subscribed to `ChatChannel` will receive this payload in their `received` callback.