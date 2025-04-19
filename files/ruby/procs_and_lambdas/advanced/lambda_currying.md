## 🧩 Currying Lambdas for Partial Application
Currying lets you break down a multi-argument lambda into a chain of single-argument lambdas, enabling elegant partial application. This is ideal when you want to pre-configure certain parameters and pass the resulting lambda around for later use.

```ruby
# Define a three-arg lambda and curry it
sum = ->(a, b, c) { a + b + c }.curry

# Partially apply the first two args
add_five = sum.call(2, 3)

# Later, apply the final arg
puts add_five.call(10)  # => 15
```