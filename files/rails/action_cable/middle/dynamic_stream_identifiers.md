## 🔀 Use Dynamic Stream Identifiers

Leverage dynamic identifiers to scope streams per user, model, or group. This prevents clients from receiving irrelevant broadcasts and improves security.

```ruby
# app/channels/notifications_channel.rb
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{current_user.id}_notifications"
  end
end
```

Broadcast only to a specific user:

```ruby
# anywhere in your app
action = { type: 'new_alert', text: 'You have a new message.' }
ActionCable.server.broadcast("user_#{user.id}_notifications", action)
```