## 🛠️ Build Efficient DSLs with Symbols and define_method

Leverage symbols for performant DSLs by dynamically defining methods via `define_method` and caching symbol lookups. Instead of `send`, use `public_send` with symbols, and prepare method names upfront to avoid repeated string allocations.

```ruby
class EventHandler
  EVENT_NAMES = %i[start stop pause resume]

  EVENT_NAMES.each do |evt|
    define_method("on_#{evt}".to_sym) do |&block|
      (@handlers ||= {})[evt] = block
    end
  end

  def trigger(event, *args)
    handler = @handlers[event]
    handler&.call(*args)
  end
end

# Usage
e = EventHandler.new
e.on_start { puts "Started" }
e.trigger(:start)
```

By defining methods once with symbols and reusing them, you cut down on string-to-symbol conversions at runtime and gain faster dispatch. Combine with `Module#prepend` for advanced hook injection.