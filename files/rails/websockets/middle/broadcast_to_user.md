## 🎯 Targeted Broadcasting to a Specific User

To send personalized updates, use `stream_for` in your channel and `broadcast_to` in your server-side code. This method isolates messages to a single user rather than broadcasting globally.

```ruby
# app/channels/notification_channel.rb
class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
  end
end

# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  def create
    @notification = Notification.create!(user: current_user, message: params[:message])
    NotificationChannel.broadcast_to(current_user, {
      message: @notification.message
    })
    head :ok
  end
end
```