## 🖇️ Define Singleton Methods with `define_singleton_method`

`define_singleton_method` adds a method to a single object, not the whole class. This is useful for per-object custom behavior without polluting the class.

```ruby
user = Object.new
user.define_singleton_method(:greet) do |name|
  "Hello, #{name}! This is a special user."
end

puts user.greet("Dave")   # => "Hello, Dave! This is a special user."
```