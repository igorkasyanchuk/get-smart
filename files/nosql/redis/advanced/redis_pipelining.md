## 🚀 Use Pipelining for Batch Commands
Pipelining allows you to send multiple commands to Redis without waiting for each response, drastically reducing network round trips and improving throughput. This is particularly useful when you need to execute large numbers of similar operations, such as warming up a cache or bulk-reading data. Remember that pipelined commands are still executed serially on the server, so this optimizes network latency rather than CPU usage.

```ruby
require 'redis'
redis = Redis.new

# Batch set 1_000 keys using pipelining
global_start = Time.now
redis.pipelined do
  1.upto(1000) do |i|
    redis.set("key:#{i}", "value_#{i}")
  end
end
puts "Pipelined set of 1000 keys took: #{Time.now - global_start}s"

# Batch get those keys
global_start = Time.now
values = redis.pipelined do
  1.upto(1000) do |i|
    redis.get("key:#{i}")
  end
end
puts "Pipelined get of 1000 keys took: #{Time.now - global_start}s"
```