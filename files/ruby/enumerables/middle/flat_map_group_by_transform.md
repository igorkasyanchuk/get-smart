## 🔀 Combine flat_map, group_by, and transform_values

To aggregate items from nested collections, chain `flat_map` to flatten, then `group_by` to categorize, and finally `transform_values` to compute per-group metrics. This avoids manual loops and intermediate variables.

```ruby
orders = [
  { id: 1, items: ['apple', 'banana'] },
  { id: 2, items: ['banana', 'cherry'] }
]
# Count each fruit across all orders
tally = orders
  .flat_map { |o| o[:items] }
  .group_by(&:itself)
  .transform_values(&:count)
# => {"apple"=>1, "banana"=>2, "cherry"=>1}
```