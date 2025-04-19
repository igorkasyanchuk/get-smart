## 🔢 Harness Ranges for Iteration and Step Incrementation

Ranges are handy for succinct loops, conditional checks, and stepping through numeric sequences or characters without manually managing counters.

```ruby
# Inclusive and exclusive ranges
(1..5).each { |n| print n }      # 1 2 3 4 5
(1...5).to_a                     # [1, 2, 3, 4]

# Step through a range
(0..10).step(2) { |n| puts n }   # 0, 2, 4, 6, 8, 10

# Checking inclusion
puts ('a'..'f').cover?('c')     # => true
puts (1..100).include?(150)      # => false
```

Use ranges to replace manual loops, improve readability, and leverage built‑in methods like `step`, `cover?`, and `to_a`.