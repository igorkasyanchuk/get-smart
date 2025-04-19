## 🔒 Custom Password Strength Validator

Devise’s default password validation ensures presence and confirmation, but you can enforce complexity rules by adding a custom validator. Implement an `ActiveModel::EachValidator` to check length, uppercase, and digit requirements, then hook it into your `User` model. This provides consistent, reusable strength validation across your app.

```ruby
# app/validators/password_strength_validator.rb
class PasswordStrengthValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /(?=.{8,})(?=.*\d)(?=.*[A-Z])/ 
    record.errors.add attribute, 'must be at least 8 characters, include an uppercase letter and a digit'
  end
end
```

Use it in the model:

```ruby
# app/models/user.rb
devise :database_authenticatable, :registerable, ...

validates :password, presence: true, password_strength: true, if: :password_required?
```