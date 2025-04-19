## 🚀 Leverage Named Captures for Structured Data

Use named capture groups to extract meaningful data directly into a hash. This approach makes regex matches self-documenting and avoids magic index references. You can even transform matches in one go by iterating through the named groups.

```ruby
pattern = /^(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})$/
if date_str = "2024-06-15".match(pattern)
  result = date_str.named_captures.transform_keys(&:to_sym)
  # => { year: "2024", month: "06", day: "15" }
end
```

You can further convert types:

```ruby
result.transform_values! { |v| v.to_i }
# => { year: 2024, month: 6, day: 15 }
```