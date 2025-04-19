## 🚀 Dynamic Method DSL via define_method

Leverage `Module#define_method` and metaprogramming to craft internal DSLs that auto-generate methods based on configuration data. This approach reduces boilerplate and opens the door to expressive domain-specific APIs.

```ruby
class EventHandler
  EVENTS = %i[create update destroy]

  EVENTS.each do |evt|
    define_method("on_#{evt}") do |&block|
      (@handlers ||= {})[evt] = block
    end
  end

  def trigger(event, *args)
    @handlers[event]&.call(*args)
  end
end

handler = EventHandler.new
handler.on_create { |data| puts "Created: #{data}" }
handler.trigger(:create, "User1")
```