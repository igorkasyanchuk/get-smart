## ❓ Ternary Operator

The ternary operator `?:` is a compact `if-else` expression: `condition ? if_true : if_false`. It’s handy for simple, inline decisions.

```ruby
age = 18
status = age >= 18 ? "Adult" : "Minor"
puts status   # "Adult"

# Inline usage in string
puts "You are #{age >= 18 ? 'allowed' : 'not allowed'} to enter."
```