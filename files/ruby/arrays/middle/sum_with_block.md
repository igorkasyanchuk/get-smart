## 🧮 Summing with a Block for Custom Aggregation
`Array#sum` accepts a block, letting you compute complex aggregates in one go. This is more efficient than separate `map` and `sum` calls and makes your intention explicit.

```ruby
products = [ {price: 5, qty: 2}, {price: 3, qty: 4} ]
total = products.sum { |p| p[:price] * p[:qty] }
# => 5*2 + 3*4 = 22
```
