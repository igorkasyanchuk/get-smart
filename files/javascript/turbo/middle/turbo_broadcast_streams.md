## 📡 Broadcast Turbo Stream Responses

On the Rails backend, broadcast Turbo Stream templates over Action Cable to push real-time updates. Use `broadcast_append_to`, `broadcast_update_to`, or `broadcast_remove_to` in your models or controllers to stream changes.

```ruby
# app/models/message.rb
after_create_commit do
  broadcast_append_to(
    "chat_#{chat_id}",
    target: 'messages',
    partial: 'messages/message',
    locals: { message: self }
  )
end
```
