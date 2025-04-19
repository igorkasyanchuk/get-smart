## 🎯 Leverage Hash Default Values vs Default Procs

By default, a hash returns `nil` for missing keys. You can provide a static default or a dynamic one via a proc—but beware of mutable defaults.

```ruby
# Static default value (shared object!)
h = Hash.new([])
h[:a] << 1
puts h[:b]          # => [1]
puts h[:a].object_id == h[:b].object_id  # => true

# Dynamic default via proc (avoids sharing)
h = Hash.new { |hash, key| hash[key] = [] }
h[:a] << 1
h[:b] << 2
puts h              # => {:a=>[1], :b=>[2]}
```

Use the proc form when you need separate mutable defaults per key, and the static form for simple immutable defaults.