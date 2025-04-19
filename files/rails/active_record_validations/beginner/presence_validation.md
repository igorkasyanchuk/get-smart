## ✅ Presence Validation

Ensure a field is not empty or `nil` by using `presence: true`. This validation is essential for required attributes like email or name to maintain data integrity. Add the `validates` call in your model to reject records missing these fields.

```ruby
class User < ApplicationRecord
  validates :email, presence: true
end
```
