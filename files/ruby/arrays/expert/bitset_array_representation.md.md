## 🔢 Bitset Array Representation
Represent boolean collections as compact bitsets within integer arrays for high-performance set operations. This technique uses bitwise operators to compute unions and intersections over machine words.

```ruby
class Bitset
  WORD_SIZE = 64
  def initialize(size)
    @data = Array.new((size + WORD_SIZE - 1) / WORD_SIZE, 0)
  end

  def set(idx)
    @data[idx / WORD_SIZE] |= 1 << (idx % WORD_SIZE)
  end

  def get(idx)
    ((@data[idx / WORD_SIZE] >> (idx % WORD_SIZE)) & 1) == 1
  end

  def union(other)
    result = Bitset.new(@data.size * WORD_SIZE)
    merged = @data.zip(other.instance_variable_get(:@data)).map { |a, b| a | b }
    result.instance_variable_set(:@data, merged)
    result
  end
end
```