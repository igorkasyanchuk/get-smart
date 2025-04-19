## 🎯 Fast Lookup with `bsearch` on Sorted Arrays
`Array#bsearch` performs binary search on a sorted array, yielding O(log n) lookup time. Use a block that returns `true` for the target condition—ideal for range-based or predicate-based searches.

```ruby
arr = [1, 3, 5, 7, 9]
# Find first element >= 6
result = arr.bsearch { |x| x >= 6 }
# => 7
```
