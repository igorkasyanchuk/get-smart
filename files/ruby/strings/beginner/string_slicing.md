## ✂️ Extracting Substrings with Ranges

Use `string[start, length]` or `string[range]` to slice parts of a string. This returns a new string without modifying the original.

```ruby
s = "Hello, World!"
puts s[7,5]    # => "World"
puts s[0..4]   # => "Hello"
puts s[7..-2]  # => "World"
```