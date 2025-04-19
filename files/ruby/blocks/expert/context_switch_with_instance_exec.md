## ⚙️ Context Switching with instance_exec
`instance_exec` runs a block under a given object’s context, granting access to private methods and internal state. This is invaluable for metaprogramming, test doubles, and injecting behavior into sealed classes.

```ruby
class DynamicContext
  def initialize(value)
    @value = value
  end

  private

  def compute
    @value * 3
  end
end

block = -> { compute + @value }
context = DynamicContext.new(5)
result = context.instance_exec(&block) # => 20
puts result
```