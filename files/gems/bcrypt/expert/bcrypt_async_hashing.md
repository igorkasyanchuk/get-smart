## 🚀 Offload Bcrypt Hashing to Background Jobs

Offload expensive bcrypt computations to background workers to keep web threads responsive. Temporarily store the raw password, enqueue a job after commit, then update the digest asynchronously with pepper and proper cost.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  attr_accessor :raw_password

  after_commit :enqueue_password_hash, if: -> { raw_password.present? }

  # Capture raw password and defer hashing
  def password=(pwd)
    self.raw_password = pwd
  end

  private

  def enqueue_password_hash
    PasswordHashJob.perform_later(id, raw_password)
  end
end
```

```ruby
# app/jobs/password_hash_job.rb
class PasswordHashJob < ApplicationJob
  queue_as :default

  def perform(user_id, raw_password)
    pepper = ENV.fetch('PASSWORD_PEPPER')
    cost   = ENV.fetch('BCRYPT_COST', 12).to_i
    digest = BCrypt::Password.create("#{raw_password}#{pepper}", cost: cost)
    User.where(id: user_id).update_all(password_digest: digest)
  end
end
```