## 🛠️ Preserve Method Signature with UnboundMethod

When wrapping existing methods, you often lose arity and metadata. By using `Module#instance_method` and `UnboundMethod#bind` you can capture the original method, then redefine it with `define_method` while forwarding arguments correctly. This approach maintains the original behavior, label, and argument validation.

```ruby
class MyService
  def calculate(a, b=10)
    a * b
  end
end

orig = MyService.instance_method(:calculate)
MyService.send(:define_method, :calculate) do |*args, **kwargs, &block|
  puts "Calling calculate with #{args}, #{kwargs}"
  orig.bind(self).call(*args, **kwargs, &block)
end

service = MyService.new
service.calculate(5)
# Output: Calling calculate with [5], {}
# => 50
```