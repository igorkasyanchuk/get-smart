## 🛠 Trim & Profile Rack Middleware Stack

Every middleware adds latency. Use `rack-mini-profiler` or simple timestamp logs to measure their individual costs, then remove or reorder non‑critical ones.

```ruby
# config/initializers/middleware_profiler.rb
Rails.application.middleware.each do |m|
  start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  m.call(->(env) { [200, {}, []] }).tap do |_|
    duration = (Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000
    Rails.logger.info "Middleware #{m.name} took #{duration.round(2)}ms"
  end
end
```

```ruby
# In config/application.rb
config.middleware.delete Rack::Lock
config.middleware.insert_before Rack::ConditionalGet, Rack::Deflater
```

Eliminate or reposition middleware until the average request path is as lean as possible.