## 🐘 Profile SQL Queries with Custom Log Subscribers

Raw application timings often hide slow SQL operations. By subscribing to `sql.active_record` events, you can log each query’s duration and payload, then filter or aggregate them for hotspot analysis.

```ruby
# config/initializers/sql_benchmarking.rb
ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  payload = event.payload

  # Skip schema queries
  next if payload[:name] == 'SCHEMA'

  Rails.logger.info(
    "[SQL BENCH] #{payload[:name]} (#{event.duration.round(1)}ms): #{payload[:sql].squeeze(' ')}"
  )
end
```