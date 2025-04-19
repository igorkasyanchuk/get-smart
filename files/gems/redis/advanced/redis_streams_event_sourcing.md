## 🚂 Implement Event Sourcing with Redis Streams

Leverage Redis Streams to build an append-only event log in Rails, capturing every domain change in a scalable, fault‑tolerant way. By pushing events to a named stream, you can replay, audit, or project state into read models.

```ruby
# app/models/order_event.rb
class OrderEvent
  STREAM_KEY = "orders:events"

  def self.publish(event_type, payload)
    Redis.current.xadd(
      STREAM_KEY,
      { type: event_type, data: payload.to_json, timestamp: Time.now.to_f }
    )
  end
end

# Usage in controller or service
OrderEvent.publish('order_created', { id: order.id, total: order.total })

# Consumer example
Redis.current.xread({ Stream: OrderEvent::STREAM_KEY, count: 100, block: 1_000 }) do |stream, events|
  events.each do |id, fields|
    data = JSON.parse(fields['data'])
    # project into read model or handle side effect
  end
end
```