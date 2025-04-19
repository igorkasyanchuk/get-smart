## 🔀 Merge Nested Hashes with Hash#deep_merge

When combining hashes with nested structures, `deep_merge` ensures sub-hash values are merged rather than overwritten. This avoids manual merging loops.

```ruby
h1 = { a: { x: 1, y: 2 }, b: 3 }
h2 = { a: { y: 20, z: 30 }, c: 4 }
merged = h1.deep_merge(h2)
# => { a: { x: 1, y: 20, z: 30 }, b: 3, c: 4 }
```
