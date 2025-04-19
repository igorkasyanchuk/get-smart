## 🔢 Accessing Characters by Index

Strings in Ruby behave like arrays of bytes (in modern Ruby, of characters). You can use square brackets to get a character at a given index (starting from 0) or negative indexes from the end.

```ruby
s = "Ruby"
puts s[0]    # => "R"
puts s[2]    # => "b"
puts s[-1]   # => "y"
```