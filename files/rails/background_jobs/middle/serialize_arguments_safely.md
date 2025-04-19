## 📝 Serialize Active Record Models Safely

Passing whole Active Record objects to jobs can lead to stale data or serialization errors. Instead, pass record IDs or Global IDs and reload them inside the job to ensure you operate on fresh data.

```ruby
# Enqueue with id
UserNotificationJob.perform_later(current_user.id)
```

```ruby
# app/jobs/user_notification_job.rb
class UserNotificationJob < ApplicationJob
  queue_as :notifications

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user
    user.send_welcome_email
  end
end
```