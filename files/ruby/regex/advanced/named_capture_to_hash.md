## 🔖 Map Named Captures to Hash
Harness Ruby’s named capture groups to directly map matched data into a hash for cleaner extraction. Use `(?<name>...)` in your pattern, then call `MatchData#named_captures` to get a `Hash` keyed by your group names. This reduces manual index lookups and improves readability.

```ruby
pattern = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/
md = pattern.match('Date: 2023-07-15')
md.named_captures #=> {"year"=>"2023", "month"=>"07", "day"=>"15"}
```