## 🎛️ Rate Limiting and Concurrency Controls

Prevent API throttling or DB overload by applying rate limits or concurrency constraints using the `sidekiq-throttled` gem. You can set custom limits per worker, ensuring jobs adhere to external service quotas.

```ruby
# Gemfile
gem 'sidekiq-throttled'

# app/workers/email_worker.rb
class EmailWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  # Allow 50 emails per minute, max 5 at a time
  sidekiq_throttle(
    concurrency: { limit: 5 },
    threshold:   { limit: 50, period: 1.minute }
  )

  def perform(user_id)
    user = User.find(user_id)
    EmailService.send_newsletter(user.email)
  end
end
```