## 🪄 Extract Data with MatchData Object
The `MatchData` object provides rich information about a match: captures, positions, and named groups. Use `MatchData#captures`, `#to_s`, and `#pre_match`/`#post_match` for full context.

```ruby
md = /User:(\w+),(\d+)/.match('User:alice,30')
md[1]           # => "alice"
md.captures     # => ["alice","30"]
md.pre_match    # => ""
md.post_match   # => ""
```

Inspecting `MatchData` helps debug complex patterns and extract exactly what you need.