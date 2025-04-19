## 🏷️ Dual Grouping with `each_with_object`

When you need multiple groupings in one pass, use `each_with_object` to build a hash of arrays or counters. This avoids multiple iterations and keeps the logic in a single traversal for better performance on large datasets.

```ruby
items = %w[apple banana apricot berry avocado]
groups = items.each_with_object({ starts_with_a: [], starts_with_b: [] }) do |item, h|
  key = item.start_with?('a') ? :starts_with_a : :starts_with_b
  h[key] << item
end
# => {starts_with_a: ["apple","apricot","avocado"], starts_with_b: ["banana","berry"]}
```