## 🎯 Lazy Chains for Efficient Processing

Large collections can create many intermediate arrays when using methods like `select` and `map`. By calling `lazy` on an enumerable, you defer computation until needed, improving memory usage and performance. Use `take` (or `first`) and `to_a` to force evaluation only on the elements you actually need.

```ruby
# Process an infinite sequence, but only take the first 5 even doubles
even_doubles = (1..Float::INFINITY)
  .lazy
  .select(&:even?)
  .map { |n| n * 2 }
  .take(5)
  .to_a
# => [4, 8, 12, 16, 20]
```