## ➕ Unary Operators for Type Conversion

Ruby supports defining `+@` and `-@` for unary plus/minus behavior, enabling custom type conversions or transformations. Use them sparingly for numeric-like or wrapper objects to keep code intuitive.

```ruby
class Temperature
  def initialize(celsius)
    @c = celsius
  end
  def +@
    @c * 9.0/5 + 32 # to Fahrenheit
  end
  def -@
    -@c # invert sign
  end
end

t = Temperature.new(25)
puts +t  # => 77.0 (°F)
puts -t  # => -25
```