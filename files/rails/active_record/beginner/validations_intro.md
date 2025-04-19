## ✅ Validate Data with Model Validations

Active Record validations help ensure data integrity before saving records. Declare them in your model to enforce presence, uniqueness, format, and more. Validation errors are accessible via the `errors` collection.

```ruby
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end

user = User.new(email: '', password: '123')
user.valid? # => false
user.errors.full_messages
```  
