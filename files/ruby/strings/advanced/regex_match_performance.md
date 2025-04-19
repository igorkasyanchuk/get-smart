## 🔍 Use String#match? for Fast Regex Checks

Avoid the overhead of creating a MatchData object when you only need to test for a pattern. `String#match?` returns a boolean and skips expensive backreferences handling internally, making it up to 2x faster for simple existence checks.

```ruby
text = "The quick brown fox jumps over the lazy dog"
# slower: allocates MatchData
exists = !!(text =~ /fox/)   #=> true
# faster: no allocation
exists = text.match?(/fox/)  #=> true
```
