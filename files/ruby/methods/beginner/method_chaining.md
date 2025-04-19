## ⚙️ Method Chaining
When methods return objects, you can chain calls for concise, readable code. Each method operates on the result of the previous one.

```ruby
message = " hello world "
formatted = message.strip.capitalize.gsub(" ", "_")
puts formatted # => "Hello_world"
```