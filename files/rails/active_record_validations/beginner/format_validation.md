## 🔍 Format Validation

Use a regular expression to ensure an attribute matches a specific pattern, such as email formats. This helps catch invalid input early. Provide a `with` regex and an optional `message` for clarity.

```ruby
class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is not a valid email' }
end
```
