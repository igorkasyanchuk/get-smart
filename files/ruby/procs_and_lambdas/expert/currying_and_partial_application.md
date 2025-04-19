## 🧩 Leveraging Currying for Partial Application
Currying transforms a multi-argument `Proc` or `lambda` into a chain of single-argument functions, enabling advanced reuse and composition. Use `#curry` on a lambda to create partially applied functions at runtime, saving boilerplate when binding frequently used parameters.

```ruby
sum = ->(a, b, c) { a + b + c }
curried_sum = sum.curry
add_five = curried_sum.call(5)
add_five_and_three = add_five.call(3)
puts add_five_and_three.call(2) # => 10
```

You can also use this pattern in higher-order functions or middleware stacks to inject common context without rewriting logic.