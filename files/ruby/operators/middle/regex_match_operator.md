## 🔍 Regex Match Operator
The `=~` operator returns the index of the first match or `nil`. It also populates the global `Regexp.last_match`, making it a powerful tool for pattern matching.

```ruby
text = "Order number: 12345"
if text =~ /(\d+)/
  puts "Found number: #{Regexp.last_match(1)}"
end
# => "Found number: 12345"
```