## 🛠️ Dynamic Methods with define_method and Closures

Leverage `define_method` to generate multiple methods at runtime, each capturing its surrounding context in a closure. This is ideal for DRYing up repetitive logic while maintaining encapsulated state. Use `define_method` inside loops or iteration blocks to bind parameters elegantly.

```ruby
class EventHandler
enabled_events = %w[start stop restart]
enabled_events.each do |event|
  define_method("on_#{event}") do |&block|
    @handlers ||= {}
    @handlers[event.to_sym] = block
  end
end

def dispatch(event)
  @handlers[event.to_sym]&.call
end
end

handler = EventHandler.new
handler.on_start { puts 'Started!' }
handler.dispatch('start')  # => "Started!"
```