## 🔄 Normalize Attributes with before_save
Use `before_save` callbacks to normalize or sanitize model attributes before persisting. This ensures consistency and avoids data anomalies without cluttering controller logic.

```ruby
class User < ApplicationRecord
  before_save :normalize_email

  private

  def normalize_email
    self.email = email.strip.downcase
  end
end
```

Here, the `normalize_email` method trims whitespace and downcases the email before every save, keeping your data clean and consistent.