## 🔒 Validations in Models

Model validations help ensure data integrity before saving records. Place validations in your model to automatically check attributes and return errors if they’re invalid.

```ruby
class User < ApplicationRecord
  # Ensure email is present and unique
  validates :email, presence: true, uniqueness: true

  # Validate format with a regex
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email" }
end
```

Use `user.valid?` to run validations without saving, and `user.errors.full_messages` to inspect errors.