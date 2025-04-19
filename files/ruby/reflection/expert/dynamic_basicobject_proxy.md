## 🌀 Proxying Objects via BasicObject for Method Interception
By subclassing BasicObject, you can build a transparent proxy that intercepts all messages, giving you full control over delegation and metadata collection. This is ideal for auditing, lazy loading, or context injection.

```ruby
class InspectorProxy < BasicObject
  def initialize(target)
    @target = target
  end
  def method_missing(name, *args, &blk)
    ::Kernel.puts "[INSPECT] Calling #{name} with #{args.inspect}"
    result = @target.__send__(name, *args, &blk)
    ::Kernel.puts "[INSPECT] Result: #{result.inspect}"
    result
  end
  def respond_to?(sym, include_private=false)
    @target.respond_to?(sym, include_private)
  end
end

# Usage
target = [1, 2, 3]
proxy = InspectorProxy.new(target)
proxy.push(4)    # Logs call and result
p proxy.sum     # => Logs and returns 10
```

This approach uses no built‑in classes beyond BasicObject, ensuring every method goes through your interceptor before reaching the real object.