## 🔒 Capture and Rebind Block Context
Rebinding a block’s `self` to another context lets you inject behavior into foreign objects. By turning a `Proc` into an `UnboundMethod`, you can bind it to any receiver dynamically.

```ruby
module BlockRebinding
  refine Proc do
    def rebind(context)
      holder = Module.new { define_method(:dynamic, &self) }
      method = holder.instance_method(:dynamic)
      method.bind(context).call
    end
  end
end

using BlockRebinding

greet = -> { "Hello from #{self.class}" }
puts greet.rebind("string".freeze) # => "Hello from String"
```