## 🔎 Filter Arrays with select
`select` returns a new array containing all elements for which the block returns `true`. It's handy for extracting a subset of data based on conditions. Use `select` when you want to keep items matching certain criteria.

```ruby
numbers = [1, 2, 3, 4, 5, 6]\n# Keep only even numbers
evens = numbers.select { |n| n.even? }
# => [2, 4, 6]

users = [
  {name: 'Alice', active: true},
  {name: 'Bob',   active: false}
]
active_users = users.select { |u| u[:active] }
# => [{name: 'Alice', active: true}]
```