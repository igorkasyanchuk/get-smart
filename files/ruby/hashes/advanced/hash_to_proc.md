## 🔗 Converting a Hash to a Proc for Flexible Calls

Ruby 2.6+ lets you use `Hash#to_proc` to expand key/value pairs into method arguments. This is great for injecting defaults or constructing keyword args dynamically.

```ruby
def greet(name:, greeting:)
  "#{greeting}, #{name}!"
end

options = { name: 'Sam', greeting: 'Hello' }

# Expand options via to_proc
[options].map(&Hash.to_proc(:greet))
# => ["Hello, Sam!"]

# Or with kwargs directly
greet(**options)
# => "Hello, Sam!"
```