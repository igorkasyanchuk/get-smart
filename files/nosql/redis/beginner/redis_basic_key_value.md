## 💾 Basic Key-Value Operations

Use Redis as a fast in-memory store by setting, retrieving, and deleting simple string keys. This is perfect for caching small pieces of data or user session info.

```ruby
# Set a key
redis.set("user:1:name", "Alice")

# Get the key's value
puts redis.get("user:1:name")  # => "Alice"

# Remove the key when done
redis.del("user:1:name")
```