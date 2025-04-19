## 🔑 Adding a Pepper for Extra Security

A pepper is a secret key stored outside the database that’s concatenated with the password before hashing. It defends against database leaks even if the salt is known. Use Rails’ `secret_key_base` or a dedicated `PEPPER` env var for this purpose.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  require 'bcrypt'

  def password=(new_password)
    pepper   = Rails.application.credentials.pepper || ENV.fetch('PASSWORD_PEPPER')
    salted   = "#{new_password}#{pepper}"
    self.password_digest = BCrypt::Password.create(salted, cost: bcrypt_cost)
  end

  def authenticate(unencrypted_password)
    pepper = Rails.application.credentials.pepper || ENV.fetch('PASSWORD_PEPPER')
    bcrypt = BCrypt::Password.new(password_digest)
    bcrypt.is_password?("#{unencrypted_password}#{pepper}") && self
  end

  private

  def bcrypt_cost
    Rails.env.test? ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  end
end
```

Rotate your pepper periodically and invalidate existing sessions to force users to re-sign in after a rotation.