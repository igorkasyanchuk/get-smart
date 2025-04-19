## 🔄 Perform Set Algebra Operations

Sets support classic algebraic operations—union, intersection, difference, and symmetric difference—both non-destructively and in-place. Use these to merge or compare collections cleanly.

```ruby
require 'set'

a = Set.new([1, 2, 3])
b = Set.new([3, 4, 5])

# Non-mutating
a_union         = a | b   # => #<Set: {1, 2, 3, 4, 5}>
a_intersection  = a & b   # => #<Set: {3}>
a_difference    = a - b   # => #<Set: {1, 2}>
a_sym_diff      = a ^ b   # => #<Set: {1, 2, 4, 5}>

# Mutating (in-place)
a.merge(b)        # a becomes union
b.subtract([3])   # b removes 3
```