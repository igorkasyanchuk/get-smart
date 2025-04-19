## 📏 Count grapheme clusters with \X in regex

Ruby’s Oniguruma engine supports `\X` for extended grapheme clusters, ensuring you treat composed characters (emojis, accented letters) as single user‑perceived units. This is essential for accurate UI metrics, slicing, and validation in internationalized applications.

```ruby
s = "🇺🇸é"
puts s.length              # => 4 (4 codepoints)
puts s.scan(/\X/).size    # => 2 ("🇺🇸" and "é")
# You can also safely slice by cluster index:
clusters = s.scan(/\X/)
puts clusters[1]           # => "é"
```