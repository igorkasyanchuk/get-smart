## ➕ Performing Basic Matrix Operations
Matrices support addition, subtraction, and multiplication out of the box. Ensure both matrices have compatible dimensions before combining them. Use `+`, `-`, and `*` operators for arithmetic, and `scalar * matrix` for scaling.

```ruby
require 'matrix'

m1 = Matrix[[1, 2], [3, 4]]
m2 = Matrix[[5, 6], [7, 8]]

sum    = m1 + m2       # => Matrix[[6,8],[10,12]]
diff   = m2 - m1       # => Matrix[[4,4],[4,4]]
prod   = m1 * m2       # => Matrix[[19,22],[43,50]]
scaled = 3 * m1        # => Matrix[[3,6],[9,12]]

puts "Sum:\n#{sum}"
```