## 🚀 Dynamic Method Invocation with `send`

Ruby’s `send` method allows you to call any method by name (symbol or string) at runtime. It’s helpful for delegating or mapping user input to internal methods safely. Use `public_send` to respect visibility rules if you want to avoid invoking private methods.

```ruby
class Calculator
  def add(a, b); a + b; end
  def multiply(a, b); a * b; end
end

calc = Calculator.new
operation = :add
puts calc.send(operation, 2, 3)         # => 5
# Or safer:
puts calc.public_send(:multiply, 4, 5)   # => 20
```