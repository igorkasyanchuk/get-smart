## 🔄 Rounding Numbers with `round`, `floor`, and `ceil`

Ruby provides methods to round Float values: `round` (nearest), `floor` (down), and `ceil` (up). You can also pass precision to `round` for decimal places.

```ruby
num = 2.7

puts num.round      # => 3
puts num.floor      # => 2
puts num.ceil       # => 3

value = 3.14159
puts value.round(2) # => 3.14   # two decimal places
```