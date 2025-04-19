## 🛠 Custom Operator Overloading in Classes

Ruby lets you define or override operators (`+`, `-`, `[]`, etc.) in your classes for intuitive DSLs. Always follow operator semantics (e.g., non-mutating vs. mutating) and return self or a new object accordingly.

```ruby
class Matrix2D
  def initialize(a,b,c,d)
    @m = [a,b,c,d]
  end
  def +(other)
    a,b,c,d = @m.zip(other.instance_variable_get(:@m)).map { |x,y| x+y }
    Matrix2D.new(a,b,c,d)
  end
  def to_s
    "[#{@m[0]}, #{@m[1]}; #{@m[2]}, #{@m[3]}]"
  end
end

m1 = Matrix2D.new(1,2,3,4)
m2 = Matrix2D.new(5,6,7,8)
puts (m1 + m2).to_s  # => [6, 8; 10, 12]
```