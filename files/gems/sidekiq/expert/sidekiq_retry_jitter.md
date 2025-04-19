## ⚡️ Exponential Backoff with Jitter for Retries

By default Sidekiq uses a linear retry interval. For high-throughput systems you can implement an exponential backoff with jitter to reduce retry storms. Create a custom retry middleware that computes `sleep` time using a power function plus a random jitter.

```ruby
# config/initializers/sidekiq_retry_jitter.rb
module Sidekiq
  module Middleware
    module Server
      class ExponentialRetry
        def call(worker, msg, queue)
          yield
        rescue => e
          retry_count = msg['retry_count'] || 0
          # exponential base (2^n) plus random jitter up to 5s
          backoff = (2**retry_count) + rand(0..5)
          Sidekiq.logger.info("Retrying \\#{msg['jid']} in \\\#{backoff}s (count: \\\#{retry_count})")
          msg['retry'] = true
          msg['retry_count'] = retry_count + 1
          Sidekiq::Client.enqueue_to(queue, worker.class, *msg['args'])
          sleep backoff
        end
      end
    end
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware.add Sidekiq::Middleware::Server::ExponentialRetry
end
```