## ⚡ Asynchronous Logger with Concurrent::Async

Logging can become a bottleneck under high load. Offload I/O by wrapping your logger calls in a background thread or using `Concurrent::Async` to achieve non-blocking log writes.

```ruby
# Gemfile
gem 'concurrent-ruby'

# config/initializers/async_logger.rb
require 'concurrent'

class AsyncLogger
  include Concurrent::Async

  def initialize(logger)
    @logger = logger
  end

  def info(*args)
    async do
      @logger.info(*args)
    end
  end

  # Delegate other severity methods similarly...
end

Rails.application.configure do
  config.logger = AsyncLogger.new(Rails.logger)
end
```