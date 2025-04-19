## 📜 Event-Driven Architecture with Redis Streams

Use Redis Streams as a lightweight event store to build CQRS/event-driven Rails services. Streams offer persistence, consumer groups, and message acknowledgment, making them ideal for resilient message processing.

```ruby
# app/stream_processors/order_processor.rb
class OrderProcessor
  STREAM = 'orders:stream'
  GROUP = 'order_consumers'
  CONSUMER = "worker-#{Socket.gethostname}"

  def initialize
    begin
      REDIS.xgroup('CREATE', STREAM, GROUP, '$', mkstream: true)
    rescue Redis::CommandError; end
  end

  def run
    loop do
      entries = REDIS.xreadgroup(GROUP, CONSUMER, { STREAM => '>' }, count: 10, block: 1_000)
      next unless entries

      entries.each do |_, msgs|
        msgs.each do |id, fields|
          process_event(id, fields)
          REDIS.xack(STREAM, GROUP, id)
        end
      end
    end
  end

  private

  def process_event(id, fields)
    OrderEventHandler.new(fields).call
  end
end
```
