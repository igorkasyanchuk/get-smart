## 🔢 Custom Numeric Coercion

Ruby’s `Numeric` protocol allows you to define your own number types that interoperate seamlessly with built‑ins. By implementing the `coerce` method you enable Ruby to reorder mixed operations and delegate them back to your class, preserving type fidelity.

```ruby
class MyRatio < Numeric
  attr_reader :num, :den
  def initialize(num, den=1)
    @num, @den = num, den
  end

  def +(other)
    o = coerce(other).first
    MyRatio.new(num * o.den + o.num * den, den * o.den).reduce
  end

  def coerce(other)
    case other
    when Numeric
      [MyRatio.new(other,1), self]
    else
      raise TypeError, "#{other.class} can't be coerced into MyRatio"
    end
  end

  protected
  def reduce
    g = num.gcd(den)
    MyRatio.new(num/g, den/g)
  end
end

r = MyRatio.new(3,4)
p r + 2       # => MyRatio(11,4)
p 2 + r       # coerce called, => MyRatio(11,4)
```