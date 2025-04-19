## 🔑 Hash Passwords with bcrypt

Use `has_secure_password` in models to hash passwords securely with bcrypt. This adds validations and authentication helpers.

```ruby
# Gemfile
gem 'bcrypt', '~> 3.1.7'

# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
end

# In console
user = User.new(password: 'secret')
user.password_digest # => <hashed string>
```
