## 🧩 Advanced Unary Operator Overloading (`+@`, `-@`)

Override unary operators to implement domain‑specific semantics, such as vector negation or domain object cloning. Use `+@` and `-@` methods for precise control.

```ruby
class Vector
  attr_reader :coords
  def initialize(*coords); @coords = coords; end

  def +@   # identity
    self.class.new(*@coords)
  end

  def -@
    self.class.new(*@coords.map(&:-@))
  end
end

v = Vector.new(1, -2, 3)
puts (+v).coords.inspect  # ⇒ [1, -2, 3]
puts (-v).coords.inspect  # ⇒ [-1, 2, -3]
```