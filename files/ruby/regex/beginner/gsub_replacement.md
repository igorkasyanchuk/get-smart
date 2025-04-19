## 🔄 Replacing Text with gsub
`String#gsub` replaces all occurrences of a pattern. You can use regex captures in the replacement with `\1`, `\2`, etc.

```ruby
address = "123 main st."
# Capitalize street abbreviation
new_address = address.gsub(/\b(st)\./i, '\1reet')
puts new_address  # => "123 main street"
```