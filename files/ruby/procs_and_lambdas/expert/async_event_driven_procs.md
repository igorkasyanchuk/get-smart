## 🚀 Building Event-Driven Architectures with Procs
Use procs as event handlers in a publish/subscribe system to decouple producers from consumers. Maintain an event registry mapping symbols to arrays of lambdas, enabling dynamic subscription and real-time event processing.

```ruby
class EventBus
  def initialize
    @handlers = Hash.new { |h, k| h[k] = [] }
  end

  def subscribe(event, &handler)
    @handlers[event] << handler
  end

  def publish(event, payload)
    @handlers[event].each { |h| h.call(payload) }
  end
end

bus = EventBus.new
bus.subscribe(:order_created) { |order| puts "Processing order ##{order[:id]}" }
bus.publish(:order_created, id: 42)
```

Scale this by wrapping handler registration in modules, using `Module#prepend` to intercept events, or integrate with a thread pool.