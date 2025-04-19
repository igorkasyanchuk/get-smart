## 🔍 Transparent Proxy Forwarding with method_missing
Create a transparent proxy to wrap objects and intercept or augment calls without breaking polymorphism. Use `method_missing` to forward unknown messages and `respond_to_missing?` to accurately report capabilities. This pattern is useful for logging, access control, or lazy-loading delegates.

```ruby
class LoggingProxy
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &block)
    puts "Calling #{name} with #{args.inspect}"  # pre-hook
    result = @target.public_send(name, *args, &block)
    puts "Returned #{result.inspect}"            # post-hook
    result
  end

  def respond_to_missing?(name, include_private = false)
    @target.respond_to?(name, include_private) || super
  end
end

array = [1,2,3]
proxy = LoggingProxy.new(array)
proxy.push(4)    # logs call and result; proxy behaves like Array
```