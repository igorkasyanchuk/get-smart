## 📈 Implement Event Sourcing with Redis Streams
Redis Streams provide an append‑only log ideal for event sourcing, offering instant fan‑out and consumer groups for guaranteed, scalable processing. By modeling state changes as discrete events, you can rebuild application state at any point and handle back‑pressure gracefully. Use `XADD` to log events, `XREADGROUP` for consumers, and `XACK` to mark successes.

```ruby
# publisher.rb
event = {id: SecureRandom.uuid, type: 'OrderCreated', payload: {order_id: 42, total: 99.99}}
$redis.xadd('orders:stream', '*', event)

# consumer.rb
group = 'order_processors'
stream = 'orders:stream'
begin
  $redis.xgroup('CREATE', stream, group, '$', mkstream: true)
rescue Redis::CommandError; end

loop do
  entries = $redis.xreadgroup(group, 'consumer-1', {stream => '>'}, count: 10, block: 5_000)
  next unless entries

  entries.each do |_, msgs|
    msgs.each do |id, data|
      process_order(data)
      $redis.xack(stream, group, id)
    end
  end
end
```