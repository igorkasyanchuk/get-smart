## ⚡ Implement Strassen's Algorithm for Matrix Multiplication

Strassen’s algorithm reduces the asymptotic complexity of multiplying two _n×n_ matrices from O(n³) to approximately O(n².81). For large matrices, this can yield significant speedups. Here’s a pure‑Ruby subclass of `Matrix` that pads to the next power of two, splits into quadrants, and recursively applies Strassen’s method.

```ruby
require 'matrix'

class StrassenMatrix < Matrix
  def *(other)
    raise ArgumentError unless self.column_count == other.row_count
    n = [self.row_count, other.column_count].max
    m = 1 << (Math.log2(n).ceil)

    # Pad to m×m
    a = pad(self, m)
    b = pad(other, m)

    result = strassen(a, b)
    Matrix.rows(result[0...row_count].map { |r| r[0...other.column_count] })
  end

  private

  def pad(mat, size)
    Array.new(size) do |i|
      Array.new(size) { |j| (i < mat.row_count && j < mat.column_count) ? mat[i, j] : 0 }
    end
  end

  def strassen(a, b)
    n = a.size
    return [[a[0][0] * b[0][0]]] if n == 1

    k = n / 2
    a11, a12, a21, a22 = split(a, k)
    b11, b12, b21, b22 = split(b, k)

    m1 = strassen(add(a11, a22), add(b11, b22))
    m2 = strassen(add(a21, a22), b11)
    m3 = strassen(a11, subtract(b12, b22))
    m4 = strassen(a22, subtract(b21, b11))
    m5 = strassen(add(a11, a12), b22)
    m6 = strassen(subtract(a21, a11), add(b11, b12))
    m7 = strassen(subtract(a12, a22), add(b21, b22))

    c11 = add(subtract(add(m1, m4), m5), m7)
    c12 = add(m3, m5)
    c21 = add(m2, m4)
    c22 = add(subtract(add(m1, m3), m2), m6)

    join(c11, c12, c21, c22)
  end

  def split(m, k)
    a11 = m[0...k].map { |r| r[0...k] }
    a12 = m[0...k].map { |r| r[k...m.size] }
    a21 = m[k...m.size].map { |r| r[0...k] }
    a22 = m[k...m.size].map { |r| r[k...m.size] }
    [a11, a12, a21, a22]
  end

  def add(x,y); x.zip(y).map { |r1,r2| r1.zip(r2).map(&:sum) }; end
  def subtract(x,y); x.zip(y).map { |r1,r2| r1.zip(r2).map { |a,b| a - b } }; end
  def join(c11, c12, c21, c22)
    top = c11.zip(c12).map { |l,r| l + r }
    bot = c21.zip(c22).map { |l,r| l + r }
    top + bot
  end
end

# Usage:
a = StrassenMatrix.build(128){ rand }
b = StrassenMatrix.build(128){ rand }
c = a * b  # ~O(n^2.81)
```