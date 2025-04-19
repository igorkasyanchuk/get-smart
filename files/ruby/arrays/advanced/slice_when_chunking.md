## 🪓 Efficient Custom Chunking with `slice_when`

Use `slice_when` to divide an array into chunks based on a custom predicate. It yields an Enumerator of subarrays, splitting whenever the block returns true for a pair of consecutive elements. This is ideal for grouping ranges or segments without precomputing indices.

```ruby
arr = [1, 2, 3, 5, 6, 10]
chunks = arr.slice_when { |prev, curr| curr != prev + 1 }.to_a
# => [[1, 2, 3], [5, 6], [10]]
```