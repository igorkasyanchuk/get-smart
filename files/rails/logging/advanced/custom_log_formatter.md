## 🛠️ Custom Log Formatter

Rails uses `ActiveSupport::Logger::SimpleFormatter` by default, but you can implement a custom formatter to include timestamps, request IDs, or custom metadata. Define a subclass of `Logger::Formatter` and hook it into your Rails middleware stack to gain full control over log output.

```ruby
# config/initializers/custom_logger.rb
class CustomLoggerFormatter < Logger::Formatter
  def call(severity, timestamp, progname, msg)
    request_id = Thread.current[:request_id] || "-"
    formatted_time = timestamp.utc.strftime("%Y-%m-%dT%H:%M:%S.%6NZ")
    "[#{formatted_time}] #{severity} (#{progname}) [RequestID:#{request_id}] : #{String === msg ? msg : msg.inspect}\n"
  end
end

Rails.application.configure do
  config.log_formatter = CustomLoggerFormatter.new
end
```