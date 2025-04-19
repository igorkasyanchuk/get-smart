## ✂️ Filter and Transform Collections with Blocks

Built-in methods like `select`, `reject`, `map`, and `reduce` thrive on blocks. Combine them to build powerful pipelines. This approach leads to declarative and readable code.

```ruby
numbers = [1, 2, 3, 4, 5]

# Select even, multiply by 10, then sum
result = numbers
  .select { |n| n.even? }
  .map    { |n| n * 10 }
  .reduce(0) { |sum, n| sum + n }

puts result
# => 60 (2*10 + 4*10)
```