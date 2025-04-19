## ✂️ Slice Strings Using Ranges and Negative Indices
Ruby’s Range-based slicing lets you extract substrings succinctly by specifying start and end indices or lengths. You can even use negative indices to count from the end, which avoids manual `length` calculations. This makes your code cleaner and more intention-revealing.

```ruby
text = "Hello, World!"
# From index 7 to 11 (inclusive)
puts text[7..11]       # => "World"
# First five characters
puts text[0,5]         # => "Hello"
# Last six characters
puts text[-6,6]        # => "World!"
```