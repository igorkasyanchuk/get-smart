## ⚙️ Numbered Parameters in Blocks and Lambdas

Clean up one-off blocks with numbered parameters (`_1`, `_2`, etc.) to eliminate boilerplate. This works seamlessly with `map`, `select`, and multi-argument lambdas without explicit block arguments.

```ruby
# Single argument mapping
squares = [1,2,3].map{ _1 ** 2 }
# => [1, 4, 9]

# Multi-argument sort
pairs = [[1,2],[3,1],[2,2]]
sorted = pairs.sort{ _1.last <=> _2.last }
# => [[3,1], [2,2], [1,2]]

# Shorthand lambda
increment = ->(x){ x + 1 }
p increment.(5) # => 6
```