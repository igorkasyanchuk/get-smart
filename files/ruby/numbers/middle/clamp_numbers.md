## 🔒 Clamp Numbers

Use `Numeric#clamp` to ensure a value stays within specified bounds without verbose comparisons. This is handy for validating user input, normalizing percentages, or keeping indexes in range.

```ruby
score = [120, -5, 50].map { |n| n.clamp(0, 100) }
# => [100, 0, 50]

temperature = 75
safe_temp = temperature.clamp(60, 80)
# => 75
```