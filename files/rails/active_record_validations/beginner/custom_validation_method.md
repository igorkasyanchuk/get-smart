## 🛠️ Custom Validation Methods

When built-in validators aren’t enough, define your own validation method. Use `validate :method_name` and implement logic in a private method to add custom errors. This is ideal for complex rules.

```ruby
class User < ApplicationRecord
  validate :password_complexity

  private

  def password_complexity
    return if password =~ /(?=.*[A-Z])(?=.*\d)/
    errors.add :password, 'must include at least one uppercase letter and one digit'
  end
end
```
