## ➗ Working with Rational Numbers

Rational numbers preserve exact fractions during arithmetic. Use `Rational(a, b)` or call `to_r` on integers and floats.

```ruby
# Create rationals
half = Rational(1, 2)
third = 1/3r

sum = half + third
# => 5/6

# Convert back to float if needed
sum.to_f
# => 0.8333333333333334
```