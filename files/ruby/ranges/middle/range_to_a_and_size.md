## 📊 Converting Ranges to Arrays and Calculating Size

Often you need to know how many discrete steps a range contains or manipulate its elements. Use `to_a` to materialize values into an array and `size` (or `count`) to find the length. Beware that converting very large ranges can be memory-intensive.

```ruby
small_range = (1..10)
array = small_range.to_a       # => [1,2,3,4,5,6,7,8,9,10]
puts array.size               # => 10

# For large ranges, use size without to_a
big_range = (1..1_000_000)
puts big_range.size           # => 1000000
```