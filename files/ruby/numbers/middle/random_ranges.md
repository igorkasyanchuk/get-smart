## 🎲 Generating Random Floats & Integers

Ruby’s `Kernel#rand` and `Random` class let you pick random values easily. You can use integer ranges, float ranges, or set a custom random generator.

```ruby
# Integer between 1 and 10
rand(1..10)

# Float between 0.0 and 1.0
rand

# Float in a custom range
rand * (5.0 - 2.0) + 2.0

# Using Random.new for reproducible sequences
generator = Random.new(1234)
generator.rand(100)
```