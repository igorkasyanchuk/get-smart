## 🖋️ Customize Logger::Formatter for Rich Output

By subclassing `Logger::Formatter`, you can inject additional metadata (like PID, thread ID, or service name) into every log entry. This ensures consistency across services without repeating code.

```ruby
class CustomFormatter < Logger::Formatter
  def call(severity, time, progname, msg)
    pid = Process.pid
    thread = Thread.current.object_id
    "[#{time.utc.iso8601}] PID=#{pid} TID=#{thread} #{severity} #{progname}: #{msg}\n"
  end
end

logger = Logger.new('log/production.log')
logger.formatter = CustomFormatter.new
logger.progname = "MyApp"
logger.warn("Cache miss for key user_#{current_user.id}")
```

This grants you full control over the log layout and content, making cross-referencing logs in distributed systems much easier.