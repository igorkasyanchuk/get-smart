## 🚦 Using Regex Options
Regex options like `i` (case-insensitive) or `m` (multiline) modify matching behavior. Append them after the closing slash or pass flags to `Regexp.new`.

```ruby
# Case-insensitive match
text = "Hello Ruby"
puts text.match?(/ruby/i)  # => true

# Multiline flag
pattern = Regexp.new('^foo', Regexp::MULTILINE)
```