## 🧱 Basic Dump and Load

Marshal.dump and Marshal.load let you serialize and deserialize Ruby objects in memory. Use `Marshal.dump(object)` to convert an object into a byte string and store it in a variable. Then call `Marshal.load(string)` to reconstruct the original object with the same state.

```ruby
# Serialize an object to a string
data = {name: "Alice", age: 30}
byte_string = Marshal.dump(data)

# Deserialize the string back into an object
restored_data = Marshal.load(byte_string)
puts restored_data[:name]  # => "Alice"
```