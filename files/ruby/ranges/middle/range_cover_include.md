## 🔍 Understanding Range#cover? vs #include?

When checking if a value falls within a range, `cover?` tests against the endpoints without creating an array, making it faster for large numeric spans. In contrast, `include?` iterates through each element, which can be slower and may not behave as expected for floats. Use `cover?` for pure boundary checks and `include?` when you need exact membership semantics.

```ruby
range = (1..1000000)
range.cover?(500000)   # => true  (fast)
range.include?(500000) # => true  (slower)

float_range = (0.0..1.0)
float_range.cover?(0.5)   # => true
float_range.include?(0.5) # => false  # floats not enumerable
```