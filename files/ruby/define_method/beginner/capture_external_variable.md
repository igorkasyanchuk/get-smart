## 🧠 Capture External Variables in Your Defined Methods

Blocks passed to `define_method` form a closure, so they capture local variables from the surrounding scope. This is handy for customizing behavior based on variables defined outside.

```ruby
class Multiplier
  def initialize(factor)
    @factor = factor
  end

  define_method(:multiply) do |x|
    x * @factor
  end
end

m2 = Multiplier.new(2)
puts m2.multiply(5)   # => 10

m10 = Multiplier.new(10)
puts m10.multiply(3)  # => 30
```