## 📝 Aliasing Methods and Wrapping Behavior

With `alias_method`, you can rename an existing method and wrap its behavior in a new method, while preserving the original. This is useful to inject logging, caching, or other cross-cutting concerns.

```ruby
class Calculator
  def calculate(x, y)
    x + y
  end
  # Alias original method
  alias_method :calculate_without_logging, :calculate

  # Redefine and wrap
  def calculate(x, y)
    puts "Calculating #{x} + #{y}"
    result = calculate_without_logging(x, y)
    puts "Result: #{result}"
    result
  end
end

calc = Calculator.new
calc.calculate(2,3)
# Output:
# Calculating 2 + 3
# Result: 5
```