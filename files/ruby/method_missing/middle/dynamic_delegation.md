## 🎯 Dynamic Delegation to an Internal Object
Method_missing can route unknown methods to a delegate object, reducing boilerplate delegator code. This is useful when wrapping or decorating an API and you want unimplemented methods forwarded automatically.

```ruby
class Decorator
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
    @target.respond_to?(name, include_private) || super
  end
end

wrapped = Decorator.new("Hello World")
puts wrapped.upcase  # => "HELLO WORLD"
```