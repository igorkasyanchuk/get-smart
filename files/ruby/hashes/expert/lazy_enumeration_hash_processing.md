## 🏃‍♂️ Lazy Enumeration for Large Hashes

When processing massive hashes, converting to arrays eagerly can blow up memory. Ruby’s `Enumerator::Lazy` lets you pipeline `map`/`select` without immediate materialization:

```ruby
big_hash = (1..1_000_000).map { |i| [i, i * 2] }.to_h

result = big_hash.lazy
  .select { |k, v| v % 4 == 0 }
  .map    { |k, v| [k, v / 2] }
  .first(5)

p result
#=> [[2, 2], [4, 4], [6, 6], [8, 8], [10, 10]]
```

This approach only computes as many elements as needed, making filtering and transformation of huge hashes efficient in both time and space.