## 📦 Grouped Validations with `with_options`
DRY up common validation options across multiple attributes using `with_options`. This organizes your code and prevents repetition when several fields share the same rules.

```ruby
class Product < ApplicationRecord
  with_options presence: true do |v|
    v.validates :name
    v.validates :price
    v.validates :sku
  end
end
```
