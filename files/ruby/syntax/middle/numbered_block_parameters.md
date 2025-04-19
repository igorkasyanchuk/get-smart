## 🔢 Leveraging Numbered Block Parameters

Ruby 2.7+ introduced numbered parameters (`_1`, `_2`, etc.) to simplify blocks without explicitly naming arguments. This helps keep your code concise when the parameter names are obvious.

```ruby
# Before numbered parameters:
numbers = [1, 2, 3]
squares = numbers.map { |n| n * n }

# With numbered parameters:
squares = numbers.map { _1 * _1 }
# => [1, 4, 9]

# Two parameters example:
pairs = [[1,2], [3,4]]
pairs.map { [_1, _2] }
```