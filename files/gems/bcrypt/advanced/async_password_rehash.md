## 🚀 Asynchronous Password Rehashing on Login

When you increase the cost factor, existing passwords need rehashing. Instead of blocking user login, detect outdated hashes at auth time and enqueue a background job to rehash asynchronously.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  require 'bcrypt'

  def authenticate(unencrypted_password)
    bcrypt = BCrypt::Password.new(password_digest)
    if bcrypt.is_password?(unencrypted_password)
      rehash_if_needed
      self
    end
  end

  private

  def rehash_if_needed
    return unless BCrypt::Password.new(password_digest).cost < BCrypt::Engine.cost
    PasswordRehashJob.perform_later(id, unencrypted_password: unencrypted_password)
  end
end

# app/jobs/password_rehash_job.rb
class PasswordRehashJob < ApplicationJob
  queue_as :default

  def perform(user_id, unencrypted_password:)
    user = User.find(user_id)
    user.update!(password: unencrypted_password)
  end
end
```

This non‑blocking pattern ensures smooth UX while gradually upgrading all stored password hashes to the new cost.