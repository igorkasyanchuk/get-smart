## 🔍 Extract Data with Named Regex Captures
Named captures (`?<name>pattern`) let you extract and reference matched groups by name, improving readability and reducing index-guessing. After matching, access captures via `MatchData#[]` with symbols or through named methods on `MatchData`.

```ruby
log = "2024-06-01 ERROR User failed authentication"
if md = log.match(/(?<date>\d{4}-\d{2}-\d{2})\s(?<level>\w+)\s(?<msg>.+)/)
  puts "Date: #{md[:date]}, Level: #{md[:level]}, Message: #{md[:msg]}"
end
# => "Date: 2024-06-01, Level: ERROR, Message: User failed authentication"
```