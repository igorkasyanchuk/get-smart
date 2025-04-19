## 🌪️ Handle Sparse Matrices with Lazy Enumerators and Hash Storage

When dealing with very large, mostly-empty matrices, a dense representation wastes memory and CPU cycles. You can craft a `SparseMatrix` that stores only non-zero entries in a `Hash`, and uses a `Lazy` enumerator for operations like multiplication or transformations. This approach scales to millions of rows with minimal footprint.

```ruby
class SparseMatrix
  include Enumerable

  def initialize(rows, cols)
    @rows = rows; @cols = cols
    @data = {}    # keys as [i,j], values as numeric
  end

  def []=(i, j, value)
    if value.zero?
      @data.delete([i,j])
    else
      @data[[i,j]] = value
    end
  end

  def [](i, j)
    @data.fetch([i,j], 0)
  end

  def each_entry
    @data.each do |(i,j), v|
      yield i, j, v
    end
  end

  def multiply(other)
    raise unless @cols == other.rows
    result = SparseMatrix.new(@rows, other.cols)

    each_entry.lazy.each do |i,j,v|
      (0...other.cols).lazy.each do |k|
        val = v * other[j, k]
        next if val.zero?
        result[i, k] = result[i, k] + val
      end
    end

    result
  end
end

# Usage:
sm1 = SparseMatrix.new(1_000_000, 1_000_000)
sm2 = SparseMatrix.new(1_000_000, 1_000_000)
# Populate a tiny fraction of entries...
sm1[0,42] = 3.14
sm2[42,99] = 2.71

product = sm1.multiply(sm2)
# Only non-zero entries are iterated and stored
```