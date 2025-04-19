## 🎭 Proxy Pattern using BasicObject

Implement a transparent proxy by subclassing `BasicObject`, which has minimal methods, and forward calls using `method_missing`. This gives you full control over delegation while avoiding name clashes.

```ruby
class SimpleProxy < BasicObject
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &blk)
    ::Kernel.puts("Proxying #{name}")
    @target.__send__(name, *args, &blk)
  end

  def respond_to_missing?(name, _include_private = false)
    @target.respond_to?(name)
  end
end

real = 'hello'.freeze
proxy = SimpleProxy.new(real)
proxy.upcase   # Logs "Proxying upcase" then returns "HELLO"
```