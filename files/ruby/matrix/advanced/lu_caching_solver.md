## 🧮 Efficient Batch Solving with LU Caching

When you need to solve multiple systems Ax = b with the same coefficient matrix, decomposing A each time is wasteful. Use Matrix#lu to decompose once into L, U and a permutation vector, then implement simple forward/backward substitution for each new right‐hand side.

```ruby
require 'matrix'

class LUCacheSolver
  def initialize(a)
    @l, @u, @perm, _ = a.lu
  end

  def solve(b)
    # Apply row permutations
    bp = Vector.elements(@perm.map { |i| b[i] })
    # Forward substitution Ly = bp
    y = forward_substitution(@l, bp)
    # Backward substitution Ux = y
    backward_substitution(@u, y)
  end

  private

  def forward_substitution(l, b)
    n = b.size
    y = Array.new(n)
    (0...n).each do |i|
      sum = (0...i).inject(0) { |s, j| s + l[i, j] * y[j] }
      y[i] = (b[i] - sum) / l[i, i]
    end
    Vector[*y]
  end

  def backward_substitution(u, y)
    n = y.size
    x = Array.new(n)
    (n-1).downto(0) do |i|
      sum = ((i+1)...n).inject(0) { |s, j| s + u[i, j] * x[j] }
      x[i] = (y[i] - sum) / u[i, i]
    end
    Vector[*x]
  end
end

# Usage example
a = Matrix[[4.0, 2.0, 0.0], [2.0, 4.0, 2.0], [0.0, 2.0, 4.0]]
solver = LUCacheSolver.new(a)
b1 = Vector[2.0, 4.0, 6.0]
b2 = Vector[1.0, 0.0, 1.0]

puts solver.solve(b1)  # => solution for first RHS
puts solver.solve(b2)  # => solution for second RHS
```