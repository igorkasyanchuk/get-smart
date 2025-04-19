## 🎯 Filtering with select
`select` keeps elements matching a condition, while `reject` drops them. Both return a new array so your original data stays intact.

```ruby
numbers = [1, 2, 3, 4, 5]

even = numbers.select { |n| n.even? }   # => [2, 4]
odd  = numbers.reject { |n| n.even? }   # => [1, 3, 5]
```