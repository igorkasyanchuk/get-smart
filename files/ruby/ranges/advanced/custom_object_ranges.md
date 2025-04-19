## 🧩 Ranges with Custom Objects
By defining `succ` and `<=>`, you can create meaningful ranges of any class. Ruby will call `succ` to walk the sequence and use `<=>` to test bounds.

```ruby
class Point
  include Comparable
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def succ
    Point.new(x + 1, y + 1)
  end

  def <=>(other)
    x <=> other.x
  end

  def to_s
    "Point(#{x},#{y})"
  end
end

range = Point.new(0,0)..Point.new(3,3)
range.each { |pt| puts pt }  # prints Point(0,0) → Point(1,1) → ... → Point(3,3)
```