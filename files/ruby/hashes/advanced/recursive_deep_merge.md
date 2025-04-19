## 🌀 Recursive Deep Merge

When combining nested Hashes, Ruby’s `merge` only merges top‐level keys. For deep structures, implement a recursive deep merge that resolves conflicts via a block. This keeps nested data intact and allows custom conflict resolution.

```ruby
class ::Hash
  def deep_merge(other_hash, &conflict_resolver)
    merger = proc do |key, old_val, new_val|
      if old_val.is_a?(Hash) && new_val.is_a?(Hash)
        old_val.merge(new_val, &merger)
      else
        conflict_resolver ? conflict_resolver.call(key, old_val, new_val) : new_val
      end
    end
    merge(other_hash, &merger)
  end
end

h1 = {a: {x: 1, y: 2}, b: 3}
h2 = {a: {y: 20, z: 30}, c: 4}

# Use default behavior (new_val)
deep = h1.deep_merge(h2)
#=> {:a=>{:x=>1, :y=>20, :z=>30}, :b=>3, :c=>4}

# Custom conflict: sum values
sum = h1.deep_merge(h2) { |key, oldv, newv| oldv + newv }
#=> {:a=>{:x=>1, :y=>22, :z=>30}, :b=>3, :c=>4}
```