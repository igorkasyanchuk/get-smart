## 📐 Using Transpose and Diagonal Extraction
Extracting rows, columns, or diagonals can simplify algorithms (e.g., solving linear systems). Use `transpose`, `row`, `column`, and `each_diagonal` methods to access these structures.

```ruby
require 'matrix'

m = Matrix[[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Transpose flips rows and columns
m_t = m.transpose
# => Matrix[[1,4,7],[2,5,8],[3,6,9]]

# Access a single row or column
second_row   = m.row(1)    # => Vector[4,5,6]
third_column = m.column(2) # => Vector[3,6,9]

# Extract both diagonals
primary = []
secondary = []
m.each_with_index { |_, i, j| primary << m[i,j] if i == j; secondary << m[i,j] if i + j == m.row_count - 1 }
# primary   => [1,5,9]
# secondary => [3,5,7]
```

These methods help you manipulate matrix data without manual index management.