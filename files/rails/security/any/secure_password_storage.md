## 🔑 Use has_secure_password for Secure Password Storage
Leverage Rails `has_secure_password` in your model to securely hash and authenticate user passwords.

```ruby
class User < ApplicationRecord
  has_secure_password
end
```

Make sure your users table has a `password_digest` column.

This uses bcrypt to hash passwords and adds authentication methods.