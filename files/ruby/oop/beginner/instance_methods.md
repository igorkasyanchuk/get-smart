## 🔄 Define Instance Methods
Instance methods define behaviors for each object. You call them on an instance, not on the class itself.

```ruby
class Calculator
  def add(a, b)
    a + b
  end

  def multiply(a, b)
    a * b
  end
end

calc = Calculator.new
puts calc.add(2, 3)      # => 5
puts calc.multiply(4, 5) # => 20
```