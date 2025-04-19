## ➕ Concatenation with `+`

You can combine two or more strings using the `+` operator. This returns a new string without modifying the originals, so it’s safe but may allocate extra memory if overused in loops.

```ruby
greeting = "Hello, "
name = "Bob"
full = greeting + name + "!"
puts full  # => Hello, Bob!
```