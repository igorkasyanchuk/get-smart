## 📏 Range Operators

Ruby’s range operators create sequences. Use `..` for inclusive ranges and `...` for exclusive (omitting the end). They’re great for loops and condition checks.

```ruby
# Inclusive range (1 through 5)
(1..5).to_a    # [1, 2, 3, 4, 5]

# Exclusive range (1 through 4)
(1...5).to_a   # [1, 2, 3, 4]

# Range in a loop
greet = (1..3).map { |i| "Hello #{i}" }
puts greet     # ["Hello 1", "Hello 2", "Hello 3"]
```