## 🚀 Getting Started with Lambdas

Lambdas are a special kind of Proc that enforce argument counts and behave more like methods. They’re defined with `->` or the `lambda` keyword. Use lambdas when you need stricter control over parameters and return behavior.

```ruby
# Define a lambda
greet = ->(name) { puts "Hi, #{name}!" }
# Call the lambda
greet.call("Bob")  # => Hi, Bob!
```