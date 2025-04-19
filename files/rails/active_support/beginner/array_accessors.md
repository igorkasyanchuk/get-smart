## 🔢 Use Array Element Accessors

ActiveSupport enriches `Array` with readable accessors like `second`, `third`, and `fourth`. These methods improve readability over numeric indexing and guard against `nil` errors.

```ruby
fruits = ["apple", "banana", "cherry", "date"]
fruits.first    # => "apple"
fruits.second   # => "banana"
fruits.third    # => "cherry"
fruits.fourth   # => "date"
```
