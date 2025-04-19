## 🔹 Use Symbols as Hash Keys for Performance
Symbols are immutable and reusable objects, making them more memory-efficient than strings when used as hash keys. This is especially helpful in Rails params or configuration hashes.

```ruby
# Using string keys
user = { "name" => "Alice", "age" => 30 }
puts user["name"]  # => "Alice"

# Using symbol keys
user = { name: "Alice", age: 30 }
puts user[:name]   # => "Alice"
```

By switching to symbol keys (`:name` instead of `"name"`), Ruby reuses the same object in memory each time, improving lookup speed and reducing garbage collection overhead.