## 🔒 Configure Dynamic Cost and Pepper for Bcrypt

Combine a dynamic cost factor with a global pepper to strengthen your bcrypt hashes against GPU and rainbow‑table attacks. Use environment variables to adjust work factors per environment and inject a pepper via Devise or custom `has_secure_password` overrides.

```ruby
# config/initializers/bcrypt.rb

# Set cost based on environment
BCrypt::Engine.cost = if Rails.env.test?
  BCrypt::Engine::MIN_COST
else
  ENV.fetch('BCRYPT_COST', 12).to_i
end

# Devise pepper and stretches
Devise.setup do |config|
  config.stretches = Rails.env.test? ? 1 : ENV.fetch('DEVISE_STRETCHES', 12).to_i
  config.pepper   = ENV.fetch('DEVISE_PEPPER')
end
```

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  # Override to append pepper
  def password=(new_password)
    @password = new_password
    pepper = ENV.fetch('PASSWORD_PEPPER')
    self.password_digest = BCrypt::Password.create(
      "#{new_password}#{pepper}",
      cost: BCrypt::Engine.cost
    )
  end
end
```