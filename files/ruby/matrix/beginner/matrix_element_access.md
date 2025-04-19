## 🔍 Accessing and Modifying Matrix Elements
You can read individual elements using `matrix[row, column]`. To transpose or modify values, convert the matrix to an array of arrays, change the data, then turn it back into a matrix.

```ruby
require 'matrix'
m = Matrix[[10, 20], [30, 40]]

# Read element at row 0, column 1:
elem = m[0, 1]  # => 20

# Convert to nested arrays to modify:
data = m.to_a
data[1][0] = 99

# Back to matrix:
m2 = Matrix.rows(data)
puts m2
# => Matrix[
#      [10, 20],
#      [99, 40]
#    ]
```