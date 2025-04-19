## 🆕 Creating a Hash with Literals
Defining a hash with literal notation is the most straightforward way to start working with key-value pairs in Ruby. You can use the curly braces `{}` along with symbol or string keys to map them to values.

```ruby
# Using symbol keys
person = { name: "Alice", age: 30, city: "London" }
puts person[:name]  # => "Alice"

# Using string keys
settings = { "theme" => "dark", "notifications" => true }
puts settings["theme"]  # => "dark"
```