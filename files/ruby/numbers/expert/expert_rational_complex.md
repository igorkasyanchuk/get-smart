## 🔢 Harnessing Rational and Complex for Exact Arithmetic

Swap floating‐point imprecision for exact `Rational` and `Complex` math. `Rational` avoids rounding errors by representing fractions exactly, while `Complex` handles two‐dimensional numbers for advanced scientific calculations. Use them together to model waveforms, signals, or precise ratios without drift.

```ruby
# Exact fraction math
r1 = Rational(22, 7)     # 22/7
r2 = 355r                # literal creates Rational(355, 1)
sum = r1 + r2           # => Rational(3879, 7)
decimal = sum.to_f       # convert back when needed

# Complex number algebra
c1 = Complex(1, 2)      # 1 + 2i
c2 = 3 + 4i              # literal syntax
product = c1 * c2        # => Complex(-5, 10)
modulus = product.abs    # => sqrt((-5)^2 + 10^2)
```