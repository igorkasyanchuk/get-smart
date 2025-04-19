## 🔢 Applying Quantifiers
Quantifiers control how many times a pattern should repeat. `*` means zero or more, `+` means one or more, and `?` means zero or one.

```ruby
# Find words with repeated letters
text = "balloon bookkeeper"
matches = text.scan(/\w+o+\w*/)
puts matches.inspect  # => ["balloon", "bookkeeper"]
```