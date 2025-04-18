## ✨ Always Validate User Input

Validate data in your models to ensure data integrity and prevent security risks from malformed input.

```ruby
class User < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
```