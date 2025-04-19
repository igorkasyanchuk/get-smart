## 📦 Capturing Groups
Use parentheses `()` to extract subparts of a match. Each group is accessible by index on the `MatchData` or special global variables like `$1`.

```ruby
date = "2023-07-15"
if date =~ /(\d{4})-(\d{2})-(\d{2})/
  puts "Year: #{$1}, Month: #{$2}, Day: #{$3}"
end
```