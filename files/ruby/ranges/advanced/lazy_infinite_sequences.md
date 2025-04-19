## 🔄 Lazy Infinite Sequences Using Endless Ranges
Pair endless ranges with `Enumerator::Lazy` to generate infinite streams without memory blow‑ups. You can filter, map, and then take only what you need.

```ruby
# First 5 multiples of 3
infinite = (1..).lazy
                .select { |n| n % 3 == 0 }
                .map    { |n| n ** 2 }
                .first(5)

p infinite  # => [9, 36, 81, 144, 225]
```