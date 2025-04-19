## 🎯 Provide a Default Block Fallback

If a block isn’t given, you can supply a default behavior. Use `block_given?` to detect absence and yield to an internal proc or return a standard value. This pattern makes your methods more robust and user-friendly.

```ruby
def transform(array)
  return array.map { |e| e * 2 } unless block_given?

  array.map { |e| yield(e) }
end

puts transform([1,2,3])
# => [2,4,6]
puts transform([1,2,3]) { |n| n + 10 }
# => [11,12,13]
```