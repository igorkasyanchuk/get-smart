## ⚙️ Build Dynamic Patterns with Regexp.union
`Regexp.union` safely joins multiple strings or regexes into one giant pattern, escaping as needed and or-ing alternatives. Ideal for dynamic lists.

```ruby
keywords = ['if','else','while','for']
pattern = Regexp.union(keywords)
'if (condition)'.scan(pattern)  # => ["if"]

# Works with regexes too
dates = [/
```
