## 🔢 Numericality Validation Options
Control numeric inputs with options like `only_integer`, bounds, and custom error messages. Combine multiple constraints for robust checks.

```ruby
class Product < ApplicationRecord
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0,
                                    message: "must be a non-negative integer" }
end
```
