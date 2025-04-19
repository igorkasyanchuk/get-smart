## 🎨 Transform Arrays with map
`map` (also known as `collect`) takes each element, applies the block, and returns a new array of the results. Use it when you want to transform data without mutating the original array. It's perfect for converting formats or applying calculations in one go.

```ruby
names = ["alice", "bob", "carol"]
capitalized = names.map { |name| name.capitalize }
# => ["Alice", "Bob", "Carol"]

squares = [1, 2, 3].map do |n|
  n ** 2
end
# => [1, 4, 9]
```