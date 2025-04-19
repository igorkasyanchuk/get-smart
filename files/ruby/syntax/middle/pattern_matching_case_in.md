## 🎯 Pattern Matching with `case/in`

Ruby 2.7+ introduces `case ... in` pattern matching, allowing deconstruction of complex objects directly in `case` statements. It simplifies conditional logic on nested structures.

```ruby
data = { status: :ok, payload: [1, 2, 3] }

case data
in { status: :ok, payload: numbers }
  puts "Success with #{numbers.sum}"
in { status: :error, error: msg }
  puts "Failure: #{msg}"
else
  puts "Unknown status"
end
```