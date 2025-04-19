## 📤 Broadcast Logs to Multiple Destinations
Rails lets you broadcast log output to several destinations (e.g., STDOUT and a file) using `ActiveSupport::Logger.broadcast`. This is handy for combining real-time console output with persistent log files.

```ruby
# config/environments/production.rb
file_logger = ActiveSupport::Logger.new("log/production_archive.log")
console_logger = ActiveSupport::Logger.new(STDOUT)
broadcast_logger = ActiveSupport::Logger.new(console_logger)
broadcast_logger.extend(ActiveSupport::Logger.broadcast(file_logger))

config.logger = ActiveSupport::TaggedLogging.new(broadcast_logger)
config.log_level = :info
```

Now each log line goes both to STDOUT and your archive file.