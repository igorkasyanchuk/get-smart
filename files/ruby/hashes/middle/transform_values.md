## ⚙️ Transforming Values with `transform_values`

Ruby's `Hash#transform_values` lets you apply a block to each value and return a new hash with the same keys. This is ideal for normalizing, casting, or formatting all values at once.

```ruby
prices = { apple: "1.20", banana: "0.50" }
# Convert string prices to floats
float_prices = prices.transform_values { |v| v.to_f }
# => { apple: 1.2, banana: 0.5 }

# Increase all prices by 10%
increased = float_prices.transform_values { |v| (v * 1.1).round(2) }
# => { apple: 1.32, banana: 0.55 }
```