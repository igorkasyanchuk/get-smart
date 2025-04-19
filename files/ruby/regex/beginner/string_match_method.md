## 🤝 Using String#match
`String#match` returns a `MatchData` object when a pattern matches, giving you details about captures. If there’s no match, it returns `nil`, allowing you to chain methods or inspect groups.

```ruby
result = "user@example.com".match(/(\w+)@(\w+\.\w+)/)
if result
  puts "Username: #{result[1]}"
  puts "Domain: #{result[2]}"
else
  puts "Invalid email format"
end
```