## 🛠️ Dynamic Method Definitions Using Blocks
Combine `define_method` with blocks to generate methods at runtime, each capturing its own closure and metadata. This technique keeps class definitions DRY and adaptable to configuration or plugin data.

```ruby
class EventHandler
  [:create, :update, :delete].each do |event|
    define_method("on_#{event}") do |&callback|
      @callbacks ||= {}
      @callbacks[event] = callback
    end
  end

  def trigger(event, *args)
    @callbacks[event]&.call(*args)
  end
end

handler = EventHandler.new
handler.on_create { |data| puts "Created: #{data}" }
handler.trigger(:create, 'Record1')
```