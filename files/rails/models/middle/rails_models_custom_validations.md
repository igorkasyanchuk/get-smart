## ✅ Extract Custom Validations into Methods

When built-in validators aren’t enough, write custom validation methods. Keep your model clean by extracting complex logic into private methods or separate validator classes. This makes your model easier to read and test.

```ruby
class User < ApplicationRecord
  validate :password_complexity

  private

  def password_complexity
    return if password =~ /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/
    errors.add(:password, "must include at least one uppercase letter, one lowercase letter, and one digit")
  end
end
```