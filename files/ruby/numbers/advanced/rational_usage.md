## 🔢 Leveraging Rational for Exact Fractional Arithmetic
The Rational class represents fractions exactly and avoids the pitfalls of Float imprecision. It automatically reduces fractions, provides access to numerator and denominator, and seamlessly converts between Rational and Float when needed.

```ruby
# Create exact fractions
a = Rational(2, 3)
b = Rational(1, 6)
puts a + b # => (5/6)

# Convert Float to Rational (may inherit float error)
c = 0.5.to_r
puts c # => (1/2)

# Simplify and access components
d = Rational(14, 28)
puts d # => (1/2)
puts [d.numerator, d.denominator].join('/') # => 1/2
```
