## ⏰ Schedule Jobs with perform_in and perform_at
Sidekiq's built-in scheduling API lets you defer execution without needing a separate cron system. Use `perform_in` for relative delays or `perform_at` for specific timestamps to keep time-based logic inside your app.

```ruby
# Schedule a job to run 5 minutes from now
timestamp = 5.minutes
HardWorker.perform_in(timestamp, user_id: 42)

# Schedule at a specific time (e.g., tomorrow at noon)
HardWorker.perform_at(1.day.from_now.change(hour: 12), user_id: 42)
```
