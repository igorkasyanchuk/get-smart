## 🏷️ Create Class Methods

Class methods perform actions related to the class itself instead of individual instances. Prefix the method name with `self.` inside the class definition. You can call class methods directly on the class.

```ruby
class Calculator
  def self.add(a, b)
    a + b
  end
end

result = Calculator.add(5, 3)  # => 8
```