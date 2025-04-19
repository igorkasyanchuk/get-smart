## 🔄 Deep Clone Objects
Deep cloning with `Marshal` lets you duplicate complex Ruby objects (including nested arrays and hashes) without retaining references to the originals. This approach is significantly faster than manual deep-copy implementations for large data structures. Use `Marshal.dump` and `Marshal.load` back-to-back to produce an independent copy.

```ruby
original = { users: [{ name: "Alice" }, { name: "Bob" }], settings: { theme: "dark" } }
clone = Marshal.load(Marshal.dump(original))

# Modifying the clone doesn't affect the original
clone[:users][0][:name] = "Carol"
puts original[:users][0][:name]  # => "Alice"
```