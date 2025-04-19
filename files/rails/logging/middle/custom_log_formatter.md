## 🎨 Implement a Custom Log Formatter
Customizing your log format can help you include JSON output, timestamps, or specific fields. Create a class that responds to `#call` and set it as the logger’s formatter.

```ruby
# lib/json_log_formatter.rb
class JsonLogFormatter < Logger::Formatter
  def call(severity, time, progname, msg)
    { severity: severity,
      time: time.utc.iso8601,
      progname: progname,
      message: String === msg ? msg : msg.inspect
    }.to_json + "\n"
  end
end

# config/environments/production.rb
graph = ActiveSupport::Logger.new(STDOUT)
graph.formatter = JsonLogFormatter.new
config.logger = ActiveSupport::TaggedLogging.new(graph)
```

This produces structured JSON logs that are easy to index and query in external log management systems.