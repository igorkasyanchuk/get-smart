## 🎁 Using Marshal for Simple Object Serialization

Ruby’s built-in `Marshal` module provides a fast way to convert Ruby objects into a byte stream and back. This is ideal for caching complex objects or storing them in files for quick reloads.

```ruby
# Serialize an object to a byte string
data = { name: "Alice", age: 30 }
serialized = Marshal.dump(data)

# Deserialize the byte string back to a Ruby object
original = Marshal.load(serialized)
puts original[:name]  # => "Alice"
```