## 📦 Validate Input Formats in Models
Use built-in validators to enforce expected formats, such as email or phone number, at the model level to reject invalid data early.

```ruby
class User < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, length: { minimum: 3, maximum: 20 }, format: { with: /\A[a-z0-9_]+\z/i }
end
```