## 🏷️ Leverage Named Capture Groups
Named captures (`(?<name>…)`) make your regex more readable and your matches easier to refer to by name instead of index. Access them via `MatchData#[]` or the returned hash.

```ruby
pattern = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/
md = pattern.match('2023-07-15')
md[:year]   # => "2023"
md['month'] # => "07"
```

Use named groups when you need clarity on which part of the string you captured.