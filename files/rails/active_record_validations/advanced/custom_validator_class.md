## 🛠 Custom Validator Class

Creating a dedicated validator class allows you to encapsulate complex validation logic and reuse it across models. By inheriting from `ActiveModel::EachValidator`, you can inject options and tailor error messages.

```ruby
# app/validators/email_format_validator.rb
class EmailFormatValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/

  def validate_each(record, attribute, value)
    return if value =~ EMAIL_REGEX

    record.errors.add(attribute, :invalid_email, message: options[:message] || "is not a valid email")
  end
end

# app/models/user.rb
class User < ApplicationRecord
  validates :email, presence: true, email_format: true
end
```
