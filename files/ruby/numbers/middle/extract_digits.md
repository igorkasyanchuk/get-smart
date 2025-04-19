## 🔢 Extracting Digits

Ruby’s `Integer#digits` method returns an array of the digits in a number, making digit-based calculations (like checksum algorithms or reverse-order parsing) concise.

```ruby
12345.digits
# => [5, 4, 3, 2, 1]

# Sum of digits
9876.digits.sum
# => 30

# Digits in another base (hexadecimal)
255.digits(16)
# => [15, 15]
```