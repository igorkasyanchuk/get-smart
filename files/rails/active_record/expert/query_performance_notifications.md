## 📊 Monitoring Query Performance with ActiveSupport::Notifications
Subscribe to `sql.active_record` events to log, aggregate, or alert on slow queries in real-time. This is invaluable for production performance tuning.

```ruby
ActiveSupport::Notifications.subscribe('sql.active_record') do |_, started, finished, _, data|
  duration = (finished - started) * 1000
  if duration > 200 # ms threshold
    Rails.logger.warn("Slow Query (#{duration.round}ms): #{data[:sql]}")
  end
end
```