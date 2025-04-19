## 🔀 Dynamic Channel Streaming

Leverage `stream_for` to create dynamic, model-specific channels and broadcast simultaneously to multiple subscribers. This pattern simplifies broadcasting to individual records or groups by name-spacing streams under model instances.

```ruby
# app/channels/notifications_channel.rb
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # Start streaming for this user and for all their projects
    stream_for current_user
    current_user.projects.each { |p| stream_for p }
  end
end
```

```ruby
# anywhere in your application (e.g., a background job)
NotificationsChannel.broadcast_to(user, title: "New alert!", body: "You have 3 unread messages.")
Project.find(42).tap do |project|
  NotificationsChannel.broadcast_to(project, status: "completed")
end
```