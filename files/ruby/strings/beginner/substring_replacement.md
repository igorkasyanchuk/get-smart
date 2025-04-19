## 🔄 Replacing Substrings with `gsub`

`gsub` returns a new string where all occurrences of the pattern are replaced, while `sub` only replaces the first one. Use regular expressions or plain strings to match.

```ruby
text = "I like cats and cats are cute."
new_text = text.gsub("cats", "dogs")
puts new_text  # => "I like dogs and dogs are cute."
```