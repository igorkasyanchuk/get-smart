## 🤝 Validating Associated Records

Ensure associated models are valid before saving the parent by using `validates_associated`. This helps catch errors in nested forms or child records, maintaining overall data consistency.

```ruby
class Order < ApplicationRecord
  has_many :items
  validates_associated :items
end
```
