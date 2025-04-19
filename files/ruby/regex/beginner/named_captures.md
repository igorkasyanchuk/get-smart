## 🏷️ Named Captures
Named captures let you label groups for more readable code. Use `(?<name>...)` and access via `MatchData#named_captures` or `result[:name]`.

```ruby
text = "Order #12345 placed"
result = text.match(/Order #(?<id>\d+)/)
if result
  puts "Order ID is #{result[:id]}"
end
```