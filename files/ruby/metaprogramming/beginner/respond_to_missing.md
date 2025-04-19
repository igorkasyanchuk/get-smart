## ✅ Support Introspection with `respond_to_missing?`

After implementing `method_missing`, override `respond_to_missing?` so `respond_to?` works as expected. This maintains compatibility with libraries and tools that check method presence.

```ruby
class Proxy
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &blk)
    @target.send(name, *args, &blk)
  end

  def respond_to_missing?(name, include_private = false)
    @target.respond_to?(name, include_private)
  end
end

arr = Proxy.new([1,2,3])
puts arr.respond_to?(:push)  # => true
arr.push(4)
puts arr.inspect             # => [1,2,3,4]
```