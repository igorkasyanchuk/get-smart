## 🔧 Default Parameter Values
You can provide default values for parameters, so callers can omit them. This simplifies method calls and provides sensible fallbacks.

```ruby
def greet(name = "Guest")
  "Welcome, #{name}!"
end

puts greet         # => "Welcome, Guest!"
puts greet("Bob") # => "Welcome, Bob!"
```