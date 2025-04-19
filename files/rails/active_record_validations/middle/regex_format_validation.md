## 📝 Regex Format Validation
Validate string formats like phone numbers or postal codes using the `format` option with a regular expression. Provide a clear `message` to guide users when input is invalid.

```ruby
class User < ApplicationRecord
  validates :phone, format: { with: /\,\A\d{3}-\d{3}-\d{4}\z/, message: "must be XXX-XXX-XXXX" }
end
```
