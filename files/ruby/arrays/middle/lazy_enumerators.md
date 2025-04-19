## 🌐 Leveraging Lazy Enumerators to Improve Performance
For large arrays or infinite sequences, `lazy` transforms an enumerator into a lazy one, performing operations only as needed. This is ideal for chaining heavy transformations without loading everything into memory.

```ruby
result = (1..Float::INFINITY)
  .lazy
  .select { |n| n.even? }
  .map { |n| n * 2 }
  .first(5)
# => [4, 8, 12, 16, 20]
```
