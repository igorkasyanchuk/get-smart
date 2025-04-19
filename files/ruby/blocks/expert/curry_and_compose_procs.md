## 🔗 Currying and Composing Procs
Currying transforms a multi-argument `Proc` into a chain of functions, enabling partial application. Combine this with simple composition helpers to build powerful data pipelines at runtime.

```ruby
# Currying example
adder = ->(x, y, z) { x + y + z }.curry
add5and = adder.call(2, 3)   # Proc expecting one argument
puts add5and.call(4)         # => 9

# Composition helper
class Proc
  def compose(other)
    ->(*args) { self.call(other.call(*args)) }
  end
end

double = ->(x) { x * 2 }
square = ->(x) { x**2 }
square_then_double = double.compose(square)
puts square_then_double.call(3) # => 18
```