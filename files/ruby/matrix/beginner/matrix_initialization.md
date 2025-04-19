## 🏗️ Initializing a Matrix with Nested Arrays
Ruby’s Matrix class makes it easy to represent 2D data. To start, require the `matrix` library and pass nested arrays to `Matrix[]`. The outer array represents rows, and each inner array represents columns.

```ruby
require 'matrix'

# Create a 2x3 matrix:
m = Matrix[[1, 2, 3], [4, 5, 6]]
puts m
# => Matrix[
#      [1, 2, 3],
#      [4, 5, 6]
#    ]
```