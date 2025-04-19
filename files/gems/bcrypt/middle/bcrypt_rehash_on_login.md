## ⬆️ Upgrading BCrypt Cost for Existing Passwords

When you increase the cost factor, old password digests remain at the previous strength. You can transparently rehash a user’s password at next login by checking the cost and generating a new digest if needed.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest).is_password?(unencrypted_password)
      upgrade_password_cost(unencrypted_password)
      self
    else
      false
    end
  end

  private

  def upgrade_password_cost(password)
    current_cost = BCrypt::Password.new(password_digest).cost
    if current_cost < BCrypt::Engine.cost
      update(password_digest: BCrypt::Password.create(password, cost: BCrypt::Engine.cost))
    end
  end
end
```