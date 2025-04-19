## 🔒 Constraining Numbers with Numeric#clamp and Range Guards
Numeric#clamp lets you enforce lower and upper bounds on any comparable numeric value. It simplifies validations and defaulting logic without conditionals. Works seamlessly with Integer, Float, and custom numeric types.

```ruby
# Basic usage
x = 42
puts x.clamp(0, 100)    # => 42
puts (-10).clamp(0, 100) # => 0

# Using a Range for bounds
range = 1..5
x = 7
puts x.clamp(range.begin, range.end)  # => 5

# Floating-point constraints
f = 1.234
puts f.clamp(0.0, 1.0)   # => 1.0
```
