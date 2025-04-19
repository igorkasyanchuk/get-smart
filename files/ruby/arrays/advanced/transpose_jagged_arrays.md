## 🔄 Transposing Irregular Matrices

`Array#transpose` expects uniform subarrays, but you can zip with a fill value to handle jagged arrays. First determine the maximum width, then pad each row before transposing. This technique reshapes uneven data grids safely.

```ruby
matrix = [[1,2,3], [4,5], [6]]
max_cols = matrix.map(&:size).max
padded = matrix.map { |row| row + [nil] * (max_cols - row.size) }
transposed = padded.transpose
# => [[1,4,6], [2,5,nil], [3,nil,nil]]
```