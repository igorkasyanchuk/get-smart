## 🔤 Advanced Symbol#to_proc Techniques
Beyond `&:method`, you can use `Symbol#to_proc` with arguments, chaining methods, or even constructing calls dynamically. This can drastically reduce boilerplate when invoking multiple methods in sequence.

```ruby
# Basic usage
nums = [1, 2, 3]
squares = nums.map(&(:**).to_proc.curry.call(2))
puts squares.inspect  # => [1, 4, 9]

# Chained calls
users = [{name: "Alice"}, {name: "Bob"}]
names_upcase = users.map(&(:[]).to_proc.curry.call(:name) >> :upcase.to_proc)
puts names_upcase.inspect  # => ["ALICE", "BOB"]
```