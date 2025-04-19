## 📦 Selective Depth Flattening with `flat_map` and `flatten`

Use `flat_map` to map and flatten one level in a single pass, then call `flatten(depth)` for deeper levels. This two-step approach avoids unnecessary deep flattening and keeps your intentions clear. Ideal for nested list processing where only certain levels need merging.

```ruby
data = [[1, [2, 3]], [4, [5, [6]]]]
# Flatten one level after mapping:
step1 = data.flat_map { |a, b| [a, b] }
# => [1, [2,3], 4, [5,[6]]]

# Then flatten just one more level:
result = step1.flatten(1)
# => [1, 2, 3, 4, 5, [6]]
```