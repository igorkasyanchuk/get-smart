## 🎯 Use Nested Interpolation for Dynamic Values
Nested interpolation lets you embed method calls or complex expressions directly into strings for clarity and conciseness. This approach avoids manual concatenation and ensures values are evaluated at runtime. It’s especially handy when you need formatted dates, upcased names, or computed values inline.

```ruby
name = "Alice"
greeting = "Hello, #{name.upcase}! Today is #{Time.now.strftime('%A')}"
puts greeting
# => "Hello, ALICE! Today is Monday"
```