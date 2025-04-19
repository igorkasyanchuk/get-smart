## ✂️ Split Sequences with slice_before and chunk_while

Ruby’s `slice_before` and `chunk_while` let you partition arrays by patterns without manual index tracking. Use `slice_before` when a single element signals a new group, or `chunk_while` for relations between consecutive elements.

```ruby
events = [1, 2, 100, 101, 5, 6]
# Start a new slice whenever the number > 50
slices = events.slice_before { |n| n > 50 }.to_a
# => [[1, 2], [100, 101], [5, 6]]

# Chunk while values are consecutive
chunks = events.chunk_while { |i, j| j == i + 1 }.to_a
# => [[1, 2], [100, 101], [5, 6]]
```