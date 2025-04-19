## ⚡️ Throttling Jobs with Custom Rate-Limiting Middleware

Introduce a Sidekiq server middleware to throttle job execution by namespace or user, controlling throughput and respecting external API rate limits.

```ruby
# lib/sidekiq/middleware/server/rate_limiter.rb
module Sidekiq
  module Middleware
    module Server
      class RateLimiter
        def call(worker, job, queue)
          key = "rate:#{worker.class.name}"
          if Redis.current.incr(key) > 100
            # re‑enqueue after delay when limit exceeded
            worker.class.perform_in(1.minute, *job['args'])
          else
            yield
          end
        ensure
          Redis.current.expire(key, 60)
        end
      end
    end
  end
end

# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Middleware::Server::RateLimiter
  end
end
```

This code enforces a maximum of 100 jobs per minute per worker class.