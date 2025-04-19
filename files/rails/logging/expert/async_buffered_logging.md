## 🚀 Apply Asynchronous Buffered Logging to Prevent I/O Bottlenecks
Use a background thread or a gem like `logging-rails` with a buffer to batch and flush log events, reducing sync I/O overhead. Configure thresholds (size or time) and fallback to sync mode on errors.

```ruby
# Gemfile
gem 'concurrent-ruby'

# config/initializers/async_logger.rb
buffer = Concurrent::Array.new
thread = Thread.new do
  loop do
    if buffer.size >= 50
      Rails.logger.info(buffer.shift(50))
    end
    sleep 1
  end
end

module AsyncLog
  def info(message, **meta)
    buffer << { message: message, meta: meta, level: :info }
  end
end

Rails.logger.extend(AsyncLog)
```

```ruby
# anywhere in the app
def notify_service
  Rails.logger.info('external_service.notify', payload: params)
end
```