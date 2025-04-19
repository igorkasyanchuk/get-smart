## ✨ Define Class Methods
Class methods belong to the class itself, not instances. Prefix the method name with `self.` inside the class definition.

```ruby
class Calculator
  def self.pi
    3.14159
  end
end

puts Calculator.pi  # => 3.14159
```