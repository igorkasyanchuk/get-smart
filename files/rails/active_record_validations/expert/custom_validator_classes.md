## ⚙️ Using Custom Validator Classes
Centralize complex validation logic by creating custom validator classes. This approach keeps your models clean, allows reusing logic across different models, and lets you leverage I18n for error messages. You can also pass options to your validator to tweak behavior per model.

```ruby
# app/validators/email_format_validator.rb
class EmailFormatValidator < ActiveModel::EachValidator
  REGEX = /\A[^@\s]+@[^@\s]+\z/

  def validate_each(record, attribute, value)
    return if value =~ REGEX
    record.errors.add(attribute, :invalid_email, message: options[:message] || "is not a valid email")
  end
end

# app/models/user.rb
class User < ApplicationRecord
  validates :email, presence: true, email_format: { message: 'must be a corporate email' }
end
```