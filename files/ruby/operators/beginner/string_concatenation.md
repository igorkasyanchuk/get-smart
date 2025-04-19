## 🆙 String Concatenation

You can join strings using the `+` operator or the shovel operator `<<`. `+` creates a new string, while `<<` appends to the existing string (mutating it).

```ruby
# Using + (non-mutating)
greeting = "Hello, " + "Ruby!"
puts greeting  # "Hello, Ruby!"

# Using << (mutating)
message = "Good"
message << " Morning"
puts message   # "Good Morning"
```