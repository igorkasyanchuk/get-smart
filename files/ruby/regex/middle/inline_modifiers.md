## 🔧 Configure Regex Flags Inline
Inline modifiers `(?i)`, `(?m)`, and `(?x)` let you switch options on or off for specific parts of your pattern. This keeps flags local and your global settings untouched.

```ruby
# Case-insensitive for only the 'foo' part
txt = 'Foo Bar'
puts txt.match?(/(?i:foo) bar/)  # => true

# Multiline within a group
doc = "line1
line2"
puts doc.match?(/(?m:^line2$)/)  # => true
```

Use inline modifiers to avoid side effects on the rest of your pattern.