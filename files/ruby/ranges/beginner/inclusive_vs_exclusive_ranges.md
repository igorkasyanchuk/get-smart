## 🟢 Understanding Inclusive vs Exclusive Ranges

Ruby provides two types of ranges: inclusive (`..`) and exclusive (`...`). Inclusive ranges include the end value, while exclusive ranges omit it. This difference is crucial when iterating or slicing.

```ruby
(1..5).to_a    # => [1, 2, 3, 4, 5]
(1...5).to_a   # => [1, 2, 3, 4]
('a'..'d').to_a # => ["a", "b", "c", "d"]
('a'...'d').to_a# => ["a", "b", "c"]
```