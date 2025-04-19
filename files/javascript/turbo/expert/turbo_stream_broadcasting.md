## 🚀 Advanced Turbo Stream Broadcasting
Leverage Turbo Streams to broadcast real-time updates from the server to multiple clients using ActionCable and custom streams. This approach decouples your front-end JavaScript from specific DOM updates, allowing you to push partials or raw HTML over named channels.

```ruby
# app/channels/notifications_channel.rb
type StimulusReflex::Channel

def subscribed
  stream_for current_user
end
```

```erb
<!-- app/views/notifications/_notification.html.erb -->
<turbo-stream action="append" target="notifications">
  <template>
    <div class="notification"><%= notification.message %></div>
  </template>
</turbo-stream>
```

```ruby
# Trigger broadcast in your model or job
NotificationsChannel.broadcast_to(
  user,
  render_to_string(partial: "notifications/notification", locals: { notification: new_notification })
)
```