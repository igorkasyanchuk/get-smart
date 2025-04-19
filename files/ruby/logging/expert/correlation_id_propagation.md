## 🔗 Propagate Correlation IDs Across Threads & Processes

Maintaining a consistent correlation ID across threads and forked processes is crucial for end‑to‑end tracing in microservices. This pattern demonstrates how to use `ActiveSupport::TaggedLogging` with thread‑local storage and forking hooks to preserve and propagate a request‑scoped ID.

```ruby
require 'active_support/tagged_logging'
require 'securerandom'

base_logger = Logger.new(STDOUT)
logger = ActiveSupport::TaggedLogging.new(base_logger)

# Middleware to assign correlation ID
class CorrelationIdMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    corr_id = env['HTTP_X_CORRELATION_ID'] || SecureRandom.uuid
    Thread.current[:correlation_id] = corr_id
    logger.tagged("corr_id:#{corr_id}") { @app.call(env) }
  ensure
    Thread.current[:correlation_id] = nil
  end
end

# Propagate into new threads
Thread.new do
  logger.info("Log in thread context")
end

# Ensure forking preserves context in Passenger
if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    Thread.current[:correlation_id] = SecureRandom.uuid if forked
  end
end
```