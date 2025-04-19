## 📋 Converting a Range to an Array

To work with all elements at once, convert a range to an array using `to_a`. This is useful when you need methods like `map`, `select`, or indexing.

```ruby
range = (10..15)
numbers = range.to_a
# numbers => [10, 11, 12, 13, 14, 15]

# Now you can do:
squares = numbers.map { |n| n * n }
# squares => [100, 121, 144, 169, 196, 225]
```