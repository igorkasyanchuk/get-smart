## 📥 Setting and Getting Keys

Redis stores data in key-value pairs. You can set new keys or retrieve existing values with simple commands.

```ruby
# Set a value
redis.set("my_key", "Hello, Redis!")

# Get a value
value = redis.get("my_key")
puts value # => "Hello, Redis!"
```
