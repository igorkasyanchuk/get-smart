## ⚖️ Numericality Validation

Validate that an attribute is a number, optionally restricting it to integers or range limits. This is useful for age, price, or quantity fields. Configure options like `only_integer`, `greater_than`, or `less_than_or_equal_to`.

```ruby
class Product < ApplicationRecord
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
```
