## ➕➖ Add and Remove Elements
Sets support `add` (or `<<`) to include items and `delete` to remove them, ensuring uniqueness is always maintained. This is useful when collecting input that must stay distinct. Use these methods to dynamically adjust your set.

```ruby
require 'set'

numbers = Set.new([1, 2, 3])
numbers.add(4)
numbers << 2   # no effect, 2 already exists
numbers.delete(3)
puts numbers.inspect
# => #<Set: {1, 2, 4}>
```