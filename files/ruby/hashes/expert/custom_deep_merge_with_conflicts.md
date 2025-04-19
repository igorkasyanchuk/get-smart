## 🔄 Custom Deep Merge with Conflict Resolution

Built‐in `Hash#merge` is shallow by default. For deeply nested hashes, implement a custom deep‐merge method with a block to resolve conflicts on a per‐key basis.

```ruby
class ::Hash
  def deep_merge(other, &conflict)
    merger = proc do |key, v1, v2|
      if v1.is_a?(Hash) && v2.is_a?(Hash)
        v1.merge(v2, &merger)
      else
        conflict ? conflict.call(key, v1, v2) : v2
      end
    end
    merge(other, &merger)
  end
end

h1 = { a: { x: 1 }, c: 3 }
h2 = { a: { x: 2, y: 5 }, b: 4 }

merged = h1.deep_merge(h2) do |key, oldv, newv|
  # prefer greater numeric values
  [oldv, newv].max
end
# => { a: { x: 2, y: 5 }, c: 3, b: 4 }
```

This pattern allows full control over how nested collisions are handled, making merging predictable in complex configurations.