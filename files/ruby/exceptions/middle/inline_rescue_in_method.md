## ⚙️ Using `rescue` in Method Definitions

You can append a `rescue` clause directly to a method definition to handle errors gracefully and keep your code concise. This is ideal for simple fallback logic.

```ruby
def parse_integer(str)
  Integer(str)
rescue ArgumentError
  nil  # return nil if parsing fails
end

# Usage:
puts parse_integer("123")  # => 123
puts parse_integer("abc")  # => nil
```

This pattern keeps the happy path clear and isolates error handling in one place.