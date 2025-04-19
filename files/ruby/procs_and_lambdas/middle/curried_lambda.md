## 🔗 Use Curried Lambdas for Partial Application
Currying transforms a multi-argument lambda into a sequence of single-argument lambdas. This technique makes your code more modular and reusable by fixing some parameters ahead of time. Call `curry` on a lambda and apply arguments step by step.

```ruby
multiply = ->(x, y, z) { x * y * z }.curry
by_two   = multiply.call(2)
by_two_and_three = by_two.call(3)

puts by_two_and_three.call(4)  # 2 * 3 * 4 = 24
```