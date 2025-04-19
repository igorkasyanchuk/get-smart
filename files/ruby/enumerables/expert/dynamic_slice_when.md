## ✂️ Dynamic Grouping with Enumerable#slice_when for On-the-Fly Segmentation

Use `slice_when` to split a sequence whenever a custom predicate between consecutive elements is true. This technique shines for log segmentation, time‐series bursts, or record boundary detection without buffering entire arrays.

```ruby
data = [1,1,2,2,2,3,4,4,5]
groups = data.slice_when { |prev, curr| prev != curr }.to_a
# => [[1,1],[2,2,2],[3],[4,4],[5]]

# Example: group timestamps by >5s gap
timestamps = [0,1,2,10,11,20,21]
groups = timestamps.slice_when { |a,b| b - a > 5 }.to_a
# => [[0,1,2],[10,11],[20,21]]
```