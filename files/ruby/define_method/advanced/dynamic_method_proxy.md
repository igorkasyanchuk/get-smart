## 🔄 Dynamic Method Proxying with define_method

Create lightweight proxies by dynamically defining forwarding methods. This pattern avoids boilerplate and adapts automatically when the target object’s interface changes.

```ruby
class ProxyBuilder
  def initialize(target)
    @target = target
  end

  # Dynamically proxy all public methods except initialize
  target.public_methods(false).each do |m|
    define_method(m) do |*args, &blk|
      puts "Calling #{m} with "+args.inspect
      @target.public_send(m, *args, &blk)
    end
  end
end

backend = String.new("hello")
proxy = ProxyBuilder.new(backend)
proxy.upcase        # Logs: Calling upcase with []
# => "HELLO"
```