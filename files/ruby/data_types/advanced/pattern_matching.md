## 🔍 Destructure Arrays and Hashes with Pattern Matching
Ruby 2.7+ introduces pattern matching (`case ... in`) to extract nested values cleanly. You can match on array shapes, hash keys, and even splat remaining elements.

```ruby
data = { user: { id: 1, name: "Alice" }, roles: [:admin, :editor] }
case data
in { user: { id:, name: }, roles: [first_role, *rest_roles] }
  puts "ID: #{id}, Name: #{name}, First Role: #{first_role}, Others: #{rest_roles}"
end
# => ID: 1, Name: Alice, First Role: admin, Others: [:editor]
```

You can also pattern-match arrays of mixed depth:

```ruby
arr = [1, 2, [3, 4]]
case arr
in [a, b, [c, d]]
  puts "#{a}, #{b}, #{c}, #{d}"
end
# => 1, 2, 3, 4
```