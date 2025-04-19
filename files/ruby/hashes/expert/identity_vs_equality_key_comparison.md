## 🆔 Identity vs. Equality in Hash Keys

By default, hashes compare keys with `eql?` and `hash`. Use `compare_by_identity` to switch to object‐identity (`equal?`), which can be helpful for caching or memoization:

```ruby
cache = {}.compare_by_identity
obj1 = "foo".freeze
obj2 = "foo".freeze

cache[obj1] = :from_obj1
puts cache[obj2]  #=> nil, because obj2 is a different object
puts cache[obj1]  #=> :from_obj1
```

Switching comparison strategy can prevent accidental collisions when you need to treat even `eql?` objects as distinct keys.