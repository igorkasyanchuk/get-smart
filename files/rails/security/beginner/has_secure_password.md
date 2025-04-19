## 🔐 Secure Passwords with bcrypt
Use `has_secure_password` in your models to hash and authenticate passwords securely. It adds password confirmation and validation automatically.

```ruby
# Gemfile
gem 'bcrypt', '~> 3.1.7'

# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
end
```

```ruby
# Creating a user:
User.create(email: 'test@example.com', password: 'secret', password_confirmation: 'secret')
```