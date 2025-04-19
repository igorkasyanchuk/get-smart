## 🔍 Pattern Matching for Nested Hashes

Ruby 3 introduced powerful pattern matching that lets you destructure complex hashes directly in a `case` statement or right‐hand side of an assignment. This approach makes it easy to extract deeply nested values with guards and defaults.

```ruby
payload = { user: { id: 42, profile: { name: "Alice" } } }

# Using case/in pattern matching
case payload
in { user: { id:, profile: { name: } } }
  puts "User ##{id} is named #{name}"
else
  puts "No match"
end

# Using right‐hand side pattern matching with pin operator
{ user: { profile: { name: } } } = payload
puts name  #=> "Alice"
```

You can combine array patterns, pin variables, and guards (`in { key: value if value > 10 }`) for sophisticated data extraction without manual conditionals.