## 📏 Range Operators
Ruby offers inclusive (`..`) and exclusive (`...`) ranges for sequences. Use them for iteration, slicing arrays, or checking inclusion without manual index calculations.

```ruby
# Inclusive range (ends at 5)
(1..5).to_a # => [1, 2, 3, 4, 5]

# Exclusive range (ends before 5)
(1...5).to_a # => [1, 2, 3, 4]

# Range cover? method
('a'..'f').cover?('c') # => true
```