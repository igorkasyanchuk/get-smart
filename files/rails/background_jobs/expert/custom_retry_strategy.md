## 🔧 Custom Retry Strategies & Exponential Backoff in Sidekiq

Override Sidekiq’s default retry logic by defining `sidekiq_options` and using middleware or `sidekiq_retries_exhausted` hooks. This allows you to implement exponential backoff, route exhausted messages to a DLQ, or notify engineers automatically.

```ruby
class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: 7, backtrace: true

  sidekiq_retry_in do |count|
    # exponential backoff: 10s, 60s, 300s, …
    (10**count) + rand(30)
  end

  sidekiq_retries_exhausted do |msg, ex|
    DeadLetterJob.perform_async(msg['class'], msg['args'], ex.message)
  end

  def perform(*args)
    # potentially flaky logic
    do_something_risky!
  end
end
```
