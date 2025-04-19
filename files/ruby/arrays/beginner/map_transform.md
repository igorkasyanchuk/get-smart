## 🗺️ Transforming with map
Use `map` to apply a transformation to each element, returning a new array of results. This is ideal for tasks like formatting or mathematical operations.

```ruby
prices = [100, 200, 300]

# Add 10% tax to each price
taxed_prices = prices.map { |p| (p * 1.1).round }
# => [110, 220, 330]
```