## 🔄 Use Parallel Assignment and the Splat Operator

Parallel assignment lets you assign multiple variables in one line, and the splat operator (`*`) handles remaining values or collects arguments. This makes your code more concise and expressive when working with arrays or method parameters.

```ruby
# Parallel assignment
first, second, third = ["Alice", "Bob", "Charlie"]
puts first   # => "Alice"
puts second  # => "Bob"
puts third   # => "Charlie"

# Using splat to grab the rest
head, *tail = [1, 2, 3, 4]
puts head    # => 1
puts tail    # => [2, 3, 4]

# Swapping variables without a temp
a, b = b, a
```