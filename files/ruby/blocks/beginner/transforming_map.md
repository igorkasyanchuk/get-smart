## 🎨 Transforming Collections with map
Use `map` (also known as `collect`) to transform each element in an array and return a new array. It's perfect when you need to apply the same operation to every item.

```ruby
numbers = [1, 2, 3, 4]
squares = numbers.map do |n|
  n * n
end
puts squares.inspect  # => [1, 4, 9, 16]
```