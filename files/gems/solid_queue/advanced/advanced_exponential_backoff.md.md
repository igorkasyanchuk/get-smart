## ⚡ Implementing Exponential Backoff for Retries

SolidQueue lets you define custom retry intervals to handle transient failures with exponential backoff. You can configure a global retry strategy or override it per-worker by passing a lambda that calculates delay based on the attempt count.

```ruby
# config/initializers/solid_queue.rb
SolidQueue.configure do |config|
  # Global backoff: 2^attempt * 1_000 milliseconds
  config.retry_delay = ->(attempt) { (2**attempt) * 1_000 }
end
```

```ruby
# app/workers/my_worker.rb
class MyWorker
  include SolidQueue::Worker

  # Override per-worker: cubic backoff in ms
  retries 5
  retry_delay ->(attempt) { (attempt**3) * 2_000 }

  def perform(args)
    # your job logic that may raise transient errors
  end
end
```