## 🔧 Slicing with Ranges and Negative Indices
Ruby’s `Array#slice` and range syntax let you extract subarrays without mutating the original, and negative indices count from the end. This is handy for grabbing chunks or trimming elements without boilerplate loops.

```ruby
arr = %w[a b c d e f]
# Positive range
sub = arr[1..3]      # => ["b", "c", "d"]
# Exclusive range
sub_ex = arr[1...3]  # => ["b", "c"]
# Negative indices
last_two = arr[-2, 2] # => ["e", "f"]
```
