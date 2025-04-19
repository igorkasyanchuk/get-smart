## 🔍 Fallback Handling with method_missing

Implement `method_missing` to catch undefined messages and handle them gracefully. This is useful for delegating calls, building dynamic proxies, or offering more informative errors. Remember to also override `respond_to_missing?` to ensure compatibility.

```ruby
class Proxy
  def initialize(target)
    @target = target
  end

  def method_missing(name, *args, &block)
    if @target.respond_to?(name)
      @target.public_send(name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    @target.respond_to?(name) || super
  end
end

proxy = Proxy.new([1, 2, 3])
proxy.map(&:to_s)  # => ["1", "2", "3"]
```