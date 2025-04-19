## 🔍 Using `dig` to Safely Access Nested Arrays
Ruby’s `dig` method lets you fetch deeply nested elements without chaining `[]` calls or worrying about `nil` errors. This simplifies traversing multi-dimensional arrays or JSON-like structures.

```ruby
nested = [[{id: 1}, {id: 2}], [{id: 3}]]
# Without dig:
val = nested[0] && nested[0][1] && nested[0][1][:id]
# With dig:
val = nested.dig(0, 1, :id)  # => 2
```
