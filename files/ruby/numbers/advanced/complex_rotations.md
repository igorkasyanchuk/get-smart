## 🔄 Performing 2D Rotations with Complex Numbers
Complex numbers in Ruby can elegantly represent 2D points and apply rotations without manual matrix math. Multiply a point by a unit complex number derived from angle to rotate around the origin.

```ruby
require 'complex'

point = Complex(3, 4)
angle = Math::PI / 4 # 45 degrees
rotation = Complex(Math.cos(angle), Math.sin(angle))

rotated = point * rotation
puts rotated # => Complex(-0.707106781186547, 4.94974746830583)
```
