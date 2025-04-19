## 🔂 Create and Rewind External Iterators with enum_for

Convert any method or object into an external iterator using `enum_for` (or `to_enum`), allowing manual control over iteration and rewinding.

```ruby
array = [10, 20, 30]
enum  = array.to_enum

enum.each { |x| puts x * 2 }
# Outputs 20, 40, 60

enum.rewind
enenum.each { |x| puts x + 5 }
# Outputs 15, 25, 35
```