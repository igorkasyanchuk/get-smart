## ⚙️ Using `transpose` for Matrix Operations
`Array#transpose` converts rows to columns in a nested array, making it easy to work with matrices or tabular data. Ensure all subarrays have the same size to avoid errors.

```ruby
matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
transposed = matrix.transpose
# => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```
