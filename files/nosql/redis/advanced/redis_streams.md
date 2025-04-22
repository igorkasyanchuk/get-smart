## 🌊 Leverage Redis Streams for Event Sourcing
Redis Streams provide an append-only log data structure perfect for building event-driven architectures or message queues. Using consumer groups, you can distribute workload among multiple workers and guarantee at-least-once delivery. Streams also support trimming policies (`XTRIM`) to cap memory usage while retaining recent history.

```ruby
require 'redis'
redis = Redis.new

event = { user: 'alice', action: 'login', time: Time.now.to_i }
# Append an event to the stream
id = redis.xadd('user:events', '*', event)
puts "Event appended with ID: #{id}"

# Create a consumer group (idempotent)
begin
  redis.xgroup('CREATE', 'user:events', 'analytics', '$', mkstream: true)
rescue Redis::CommandError => e
  raise unless e.message.include?('BUSYGROUP')
end

# Read from the group as a consumer
messages = redis.xreadgroup('GROUP', 'analytics', 'worker-1', 'BLOCK', 2000, 'COUNT', 10, 'STREAMS', 'user:events', '>' )
messages.each do |stream, entries|
  entries.each do |msg_id, fields|
    puts "Processing #{msg_id}: #{fields}"  
    # Acknowledge after processing
    redis.xack('user:events', 'analytics', msg_id)
  end
end