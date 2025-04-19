## 📝 Organize Complex Patterns with x Mode
Free-spacing mode (`/x`) lets you spread regex across multiple lines, add comments, and ignore whitespace, making intricate patterns maintainable and self-documenting.

```ruby
pattern = /\n  \A          # start of string\n  (?<user>    # capture username\n    [a-z0-9_]+ # lowercase and underscores\n  )\n  @           # literal @\n  (?<domain>  # capture domain\n    [a-z.]+   # letters and dots\n  )\n  \z          # end of string\n/x

md = pattern.match('alice123@example.com')
md.named_captures #=> {"user"=>"alice123", "domain"=>"example.com"}
```