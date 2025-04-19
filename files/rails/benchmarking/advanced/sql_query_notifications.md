## ⚡️ Capture SQL Queries with ActiveSupport::Notifications
Leverage `ActiveSupport::Notifications` to subscribe to `sql.active_record` events and measure both count and duration of SQL calls inside a block. This helps pinpoint N+1 queries and slow joins within a single benchmark.

```ruby
require 'benchmark'

subscriber = ActiveSupport::Notifications.subscribe('sql.active_record') do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  puts "SQL (#{event.duration.round(1)}ms): #{event.payload[:sql]}"
end

time = Benchmark.measure do
  User.includes(:posts).each { |u| u.posts.size }
end

ActiveSupport::Notifications.unsubscribe(subscriber)
puts "Total Time: #{time.real.round(2)}s"
```
