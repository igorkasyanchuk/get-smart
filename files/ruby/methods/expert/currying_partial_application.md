## 🎛️ Currying and Partial Application with Method#curry
Convert methods to curried `Proc` objects for flexible partial application and pipeline-style composition of operations. This is useful for building higher-order functions and reusable processing chains.

```ruby
def multiply(a, b, c)
  a * b * c
end

curried = method(:multiply).curry
partial = curried.call(2, 3)
puts partial.call(4)  # => 24
```

```ruby
adder = ->(x, y) { x + y }.curry
add_five = adder.call(5)
puts add_five.call(10)  # => 15
```