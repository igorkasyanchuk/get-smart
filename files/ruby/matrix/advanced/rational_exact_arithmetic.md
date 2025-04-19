## 🔢 Exact Arithmetic with Rational Matrices

Floating‑point rounding can introduce subtle bugs in determinants and inverses. By using Rational entries, Ruby’s Matrix performs exact arithmetic, ensuring precise results. This is invaluable when symbolic correctness is required.

```ruby
require 'matrix'

# Construct a matrix with Rational entries
ea = Matrix[
  [Rational(1, 3), Rational(2, 5)],
  [Rational(3, 7), Rational(4, 9)]
]

# Compute exact determinant and inverse
det = ea.determinant  # => Rational exact value
inv = ea.inverse       # => Matrix of Rationals

puts "Determinant: #{det}"
puts "Inverse:\n#{inv}"