## ⏰ Schedule a Job in the Future

You can delay execution of any job using `perform_in`. This is great for reminders or follow‑ups that should run after a specific period.

```ruby
# app/jobs/reminder_job.rb
class ReminderJob < SolidQueue::Job
  def perform(user_id)
    UserMailer.reminder(user_id).deliver_now
  end
end
```

```ruby
# Schedule the job to run in 1 hour (3600 seconds)
ReminderJob.perform_in(3600, 42)
```