## 🔐 Use `has_secure_password` for Secure Authentication

Rails provides `has_secure_password` to handle password hashing and authentication securely using bcrypt.

```ruby
class User < ApplicationRecord
  has_secure_password
end
```

Always use this instead of storing passwords in plain text.