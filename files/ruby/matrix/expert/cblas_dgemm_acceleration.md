## 🧪 Accelerate Matrix Operations with BLAS via Fiddle

Ruby’s `Matrix` is flexible but not optimized for large-scale numeric workloads. By binding to a native BLAS library with `Fiddle`, you can offload heavy multiplications to highly tuned C routines like `cblas_dgemm`. Below is a minimal example showing how to `require 'fiddle'`, link to `libblas`, and call `cblas_dgemm` directly.

```ruby
require 'fiddle'
require 'fiddle/import'
require 'matrix'

module BLAS
  extend Fiddle::Importer
  dlload 'libblas.so'  # or 'libopenblas.so'
  extern 'void cblas_dgemm(int, int, int, int, int, int, double, double*, int, double*, int, double, double*, int)'

  CBLAS_ROW_MAJOR = 101
  CBLAS_NO_TRANS   = 111
end

class FastMatrix
  def initialize(matrix)
    @rows, @cols = matrix.row_count, matrix.column_count
    @data = Fiddle::Pointer[matrix.to_a.flatten.pack('d*')]
  end

  def mul(other)
    raise unless @cols == other.row_count
    result = Fiddle::Pointer.malloc(@rows * other.column_count * Fiddle::SIZEOF_DOUBLE)

    BLAS.cblas_dgemm(
      BLAS::CBLAS_ROW_MAJOR,
      BLAS::CBLAS_NO_TRANS, BLAS::CBLAS_NO_TRANS,
      @rows, other.column_count, @cols,
      1.0,
      @data, @cols,
      other_data = Fiddle::Pointer[other.to_a.flatten.pack('d*')], other.row_count,
      0.0,
      result, other.column_count
    )

    Matrix.rows(Array.new(@rows) do |i|
      Array.new(other.column_count) do |j|
        result.ptr.to_s.unpack('d*')[i * other.column_count + j]
      end
    end)
  end
end

# Usage:
a = FastMatrix.new(Matrix.build(500){ rand })
b = FastMatrix.new(Matrix.build(500){ rand })
c = a.mul(b)  # Native BLAS performance
```