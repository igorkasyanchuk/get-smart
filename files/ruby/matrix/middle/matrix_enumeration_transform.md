## 🔄 Enumerating and Transforming Matrices
When you need to apply transformations element-wise, convert the matrix to a nested array or use `each` and `map` methods. This approach keeps your code declarative and leverages Ruby’s Enumerable module.

```ruby
require 'matrix'

matrix = Matrix[[1, 2, 3], [4, 5, 6]]

# Using to_a and map
doubled = Matrix.rows(matrix.to_a.map { |row| row.map { |n| n * 2 } })
# => Matrix[[2,4,6],[8,10,12]]

# Using each_with_index
incremented = Matrix.build(matrix.row_count, matrix.column_count) do |i, j|
  matrix[i, j] + 1
end
# => Matrix[[2,3,4],[5,6,7]]
```

Choose `Matrix.build` for direct construction when the transformation depends on indices.