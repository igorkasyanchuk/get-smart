## 🚀 High-Performance SVD via numo-linalg

For large matrices or advanced factorization like SVD, leverage the numo-linalg gem for native C/Fortran performance. Convert Ruby’s Matrix to Numo::DFloat, call Numo::Linalg.svd, then map results back if needed.

```ruby
require 'matrix'
require 'numo/narray'
require 'numo/linalg'  # ensure the numo-linalg gem is installed

# Start with a standard Ruby Matrix
a = Matrix[[1.0, 2.0, 3.0],
           [4.0, 5.0, 6.0],
           [7.0, 8.0, 10.0]]

# Convert to Numo::DFloat
nary = Numo::DFloat[*a.to_a]

# Compute SVD: U, singular values S, and Vᵀ
u, s, vt = Numo::Linalg.svd(nary)

# Reconstruct A ≈ U · diag(S) · Vᵀ
a_recon = u.dot(Numo::DFloat.diag(s)).dot(vt)

puts "Singular values: #{s}"
puts "Reconstructed matrix:\n#{a_recon.round(5)}"