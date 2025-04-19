## 🔍 Using `before_validation` to Normalize Data
Use `before_validation` to modify or normalize data before Rails runs validations. This helps ensure your data meets validation requirements without polluting your controller or form logic.

```ruby
class User < ApplicationRecord
  before_validation :strip_whitespace_from_email

  private

  def strip_whitespace_from_email
    self.email = email.strip.downcase if email.present?
  end
end
```

Here, any leading/trailing whitespace is removed and the email is downcased before Rails checks format or uniqueness.