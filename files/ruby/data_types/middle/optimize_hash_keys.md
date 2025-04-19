## 🔑 Optimize Hash Keys with Symbols

Symbols are immutable and memory‑efficient, making them perfect for hash keys compared to strings. When you use strings as keys, Ruby allocates a new object on each assignment; symbols avoid that overhead.

```ruby
# Using strings as hash keys allocates new String objects:
h1 = { "user" => "Alice" }
h2 = { "user" => "Bob" }
puts h1.keys.first.object_id == h2.keys.first.object_id  # => false

# Using symbols reuses the same Symbol object:
h3 = { user: "Alice" }
h4 = { user: "Bob" }
puts h3.keys.first.object_id == h4.keys.first.object_id  # => true
```

Whenever possible, define static keys as symbols. If you need to convert dynamic string keys to symbols, use `to_sym` or `intern` carefully to avoid symbol table bloat.