## 🧩 Building a Forwarding Proxy
Use method_missing to create a transparent proxy that intercepts method calls, adding behavior before/after forwarding. This pattern is handy for caching, security checks, or instrumentation around an object.

```ruby
class Proxy
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &block)
    puts "Calling #{name} with \\#{args.inspect}"
    result = @target.public_send(name, *args, &block)
    puts "Result: \\#{result.inspect}"
    result
  end

  def respond_to_missing?(name, include_private = false)
    @target.respond_to?(name, include_private) || super
  end
end

arr = Proxy.new([1,2,3])
arr.push(4)
# Output:
# Calling push with [4]
# Result: [1, 2, 3, 4]
```