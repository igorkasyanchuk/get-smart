## ⚙️ Custom Server Middleware for Instrumentation

Integrate a custom server middleware to capture metrics or enforce idempotency across all your Sidekiq workers. This allows you to measure job execution times, count failures, and centralize logging without modifying individual worker classes.

```ruby
# app/middleware/instrumentation_middleware.rb
class InstrumentationMiddleware
  def call(worker, msg, queue)
    start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    yield
    duration = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time
    StatsD.measure("sidekiq.job.duration", duration, tags: ["worker:#{worker.class.name}"])
  rescue => e
    StatsD.increment("sidekiq.job.failure", tags: ["worker:#{worker.class.name}"])
    raise
  end
end

# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add InstrumentationMiddleware
  end
end
```