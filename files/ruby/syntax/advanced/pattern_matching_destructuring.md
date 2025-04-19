## 🧩 Destructure with Pattern Matching
Ruby 2.7+ introduces built-in pattern matching to concisely extract nested values from arrays and hashes. This allows you to match on a shape and bind local variables in one expression, dramatically reducing manual index/key lookups.

```ruby
data = { user: { id: 42, profile: { name: "Alice", roles: [ :admin, :editor ] } } }
case data
in { user: { id:, profile: { name:, roles: [ first_role, * ] } } }
  puts "ID: #{id}, Name: #{name}, First Role: #{first_role}"
else
  puts "No match"
end
# => ID: 42, Name: Alice, First Role: admin
```