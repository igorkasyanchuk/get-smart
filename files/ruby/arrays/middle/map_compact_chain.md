## 🎲 Chaining `map` and `compact` to Transform and Clean
When transforming arrays, chaining `map` and `compact` allows you to apply a transformation and immediately remove any `nil` results. This avoids creating intermediate arrays with unwanted `nil` elements.

```ruby
data = ["1", "two", "3", "four"]
numbers = data
  .map { |s| Integer(s) rescue nil }
  .compact
# => [1, 3]
```
