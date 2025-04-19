## 🔄 Perform Union, Intersection, and Difference
Ruby Sets come with operators for common mathematical operations: `|` (union), `&` (intersection), and `-` (difference). These let you merge collections, find common elements, or subtract one set from another with minimal code.

```ruby
require 'set'

a = Set.new([1, 2, 3])
b = Set.new([3, 4, 5])

union        = a | b   # combine unique elements
intersection = a & b   # elements in both
difference   = a - b   # elements in a not in b

puts union.inspect        # => #<Set: {1, 2, 3, 4, 5}>
puts intersection.inspect # => #<Set: {3}>
puts difference.inspect   # => #<Set: {1, 2}>
```