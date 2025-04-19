## 🔪 Slice Using Custom Break Conditions via slice_when

`slice_when` creates new slices at points where the block returns true, making it perfect for partitioning based on any transition condition.

```ruby
data = [1, 2, 4, 7, 11, 16]
slices = data.slice_when { |i, j| (j - i) > 2 }.to_a
# => [[1, 2, 4], [7], [11], [16]]
```