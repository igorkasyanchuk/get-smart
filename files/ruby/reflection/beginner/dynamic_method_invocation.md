## ⚙️ Dynamically Invoke Methods with `send`
Ruby’s `send` (or `public_send`) lets you call a method by name at runtime, enabling flexible and dynamic behavior. This is particularly useful when the exact method to call isn’t known until execution.

```ruby
method_name = :upcase
text = "hello"
result = text.send(method_name)
puts result  #=> "HELLO"

# public_send respects method visibility (won’t call private methods)
text.public_send(:upcase)
```

Use `public_send` for safer reflective calls that respect method visibility constraints.