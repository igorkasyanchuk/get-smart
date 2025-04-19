## ⚙️ Group Based on Dynamic Conditions with chunk_while

`chunk_while` groups consecutive elements as long as the block returns true. This is ideal for splitting a sequence based on comparisons with the next element, such as contiguous runs or custom thresholds.

```ruby
numbers = [1, 2, 3, 5, 6, 8, 9, 10]
groups = numbers.chunk_while { |i, j| j - i == 1 }.to_a
# => [[1, 2, 3], [5, 6], [8, 9, 10]]
```