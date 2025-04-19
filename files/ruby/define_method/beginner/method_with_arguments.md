## 🎯 Define Methods That Accept Arguments

You can define methods that take arguments by specifying block parameters just like in a normal `def`. This lets you build dynamic methods that remain flexible.

```ruby
class Calculator
  operations = {
    add: ->(a, b) { a + b },
    sub: ->(a, b) { a - b },
    mul: ->(a, b) { a * b },
    div: ->(a, b) { a / b.to_f }
  }

  operations.each do |name, func|
    define_method(name) do |x, y|
      func.call(x, y)
    end
  end
end

calc = Calculator.new
puts calc.add(4, 2)   # => 6
puts calc.div(5, 2)   # => 2.5