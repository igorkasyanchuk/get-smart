## 🛠 Dynamic Operator Overloading via `method_missing`

You can intercept calls to any operator method and define them on the fly using `method_missing`. This is useful for building dynamic DSLs or proxies that handle arbitrary binary operations without predefining every operator.

```ruby
class OperatorProxy
  def initialize(&handler)
    @handler = handler
  end

  def method_missing(op, *args)
    if args.size == 2
      @handler.call(op, *args)
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    true
  end
end

proxy = OperatorProxy.new do |op, a, b|
  puts "Invoked operator #{op} with ": #{a.inspect}, #{b.inspect}"
  a.send(op, b)
end

result = proxy.+(5, 3)   # prints "Invoked operator + with : 5, 3" and returns 8
```