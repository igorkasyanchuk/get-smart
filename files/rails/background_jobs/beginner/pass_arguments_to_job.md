## 📦 Pass Arguments to Your Job

Jobs can accept arguments which are serialized to JSON. This lets you pass simple data like IDs or strings safely.

```ruby
# app/jobs/send_notification_job.rb
class SendNotificationJob < ApplicationJob
  queue_as :mailers

  def perform(user_id, message)
    user = User.find(user_id)
    UserMailer.alert(user, message).deliver_now
  end
end
```

```ruby
# enqueue with multiple params
SendNotificationJob.perform_later(7, "Your report is ready!")
```