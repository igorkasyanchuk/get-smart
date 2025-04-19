## 🎯 Using Character Classes
Character classes let you match any one of several characters. Use `[abc]` to match `a`, `b`, or `c`, or ranges like `[0-9]` for digits.

```ruby
# Match any lowercase vowel
text = "ruby rocks"
vowels = text.scan(/[aeiou]/)
puts vowels.inspect  # => ["u", "o", "o"]
```