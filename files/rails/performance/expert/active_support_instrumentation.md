## 📊 Custom Instrumentation with ActiveSupport::Notifications

Gain granular insights into your most expensive queries by subscribing to `sql.active_record` and assembling a heat map of slow SQL calls. This helps pinpoint repeated anti‑patterns or unexpected joins.

```ruby
# config/initializers/sql_profiler.rb
require 'redis'
redis = Redis.new

ActiveSupport::Notifications.subscribe('sql.active_record') do |name, start, finish, id, payload|
  duration = (finish - start) * 1000.0 # ms
  next if payload[:name] == 'SCHEMA'

  key = "sql:#{payload[:sql].gsub(/\s+/, ' ').strip[0..50]}"
  redis.zincrby('slow_queries', duration, key)
end
```

Later, run:

```bash
redis-cli ZREVRANGE slow_queries 0 10 WITHSCORES
```

to see your top 10 slowest SQL snippets and tune indexes or rewrite the query accordingly.