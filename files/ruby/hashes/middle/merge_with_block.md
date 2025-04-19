## 🔄 Merging Hashes with a Block

`Hash#merge` can accept a block that determines how to combine values for duplicate keys. This is useful for summing counters, concatenating arrays, or applying custom logic when two hashes collide.

```ruby
h1 = { apples: 3, oranges: 2 }
h2 = { apples: 1, bananas: 4 }
# Sum counts for duplicate keys
combined = h1.merge(h2) { |key, old_val, new_val| old_val + new_val }
# => { apples: 4, oranges: 2, bananas: 4 }
```

You can also merge nested structures:

```ruby
h1 = { data: [1, 2] }
h2 = { data: [3, 4] }
merged = h1.merge(h2) { |_, a, b| a + b }
# => { data: [1, 2, 3, 4] }
```