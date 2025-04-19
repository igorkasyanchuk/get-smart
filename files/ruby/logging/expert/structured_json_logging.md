## 🔧 Structured JSON Logging with Custom Formatter

By implementing a custom JSON formatter you can output structured logs that are easier to query in ELK or Splunk. This tip shows how to subclass Ruby's Logger and inject dynamic metadata into every log record for full context in high‑volume distributed systems.

```ruby
require 'logger'
require 'json'

class JsonFormatter < Logger::Formatter
  def call(severity, timestamp, progname, msg)
    log = {
      timestamp: timestamp.utc.iso8601,
      severity: severity,
      progname: progname,
      message: msg.is_a?(String) ? msg : msg.inspect
    }
    # Inject dynamic context if available
    if Thread.current[:log_context]
      log.merge!(Thread.current[:log_context])
    end
    JSON.generate(log) + "\n"
  end
end

logger = Logger.new(STDOUT)
logger.formatter = JsonFormatter.new

# Usage with dynamic context
def process_order(order_id)
  Thread.current[:log_context] = { order_id: order_id, service: 'payment' }
  logger.info("Order processing started")
end
```