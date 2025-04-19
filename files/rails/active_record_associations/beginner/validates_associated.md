## ✅ Validate Child Objects with `validates_associated`

To ensure associated records are valid when saving the parent, use `validates_associated` on the parent model.

```ruby
# app/models/order.rb
class Order < ApplicationRecord
  has_many :line_items
  validates_associated :line_items
end
```

This will prevent saving an `Order` if any `line_item` fails validation, enforcing data consistency.
