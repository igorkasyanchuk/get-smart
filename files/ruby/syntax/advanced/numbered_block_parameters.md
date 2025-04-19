## 🔢 Leverage Numbered Block Parameters
Ruby 2.7+ lets you use numbered parameters (`_1`, `_2`, etc.) in blocks without naming arguments. This is ideal for short iterators where naming each parameter is verbose.

```ruby
# Map an array of coordinates to strings
coords = [ [10, 20], [30, 40], [50, 60] ]
strings = coords.map { "x=#{_1}, y=#{_2}" }
puts strings
# => ["x=10, y=20", "x=30, y=40", "x=50, y=60"]

# Chaining with enumerable methods
[1, 2, 3].select { _1.odd? }.map { _1 * 10 }
# => [10, 30]
```