## 🔄 Seamless Migration from Legacy Hash Algorithms

Migrate users from MD5 or SHA1 to bcrypt without forcing a password reset. Detect legacy digests on login, verify them, then transparently rehash with bcrypt+pepper and clear legacy fields for future authentications.

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password validations: false

  # legacy_digest holds old MD5/SHA1
  def authenticate(unencrypted_password)
    if legacy_digest.present? && legacy_verify(unencrypted_password)
      # Rehash with bcrypt and pepper, remove legacy digest
      self.password = unencrypted_password
      self.legacy_digest = nil
      save!(validate: false)
      self
    elsif super(unencrypted_password)
      self
    else
      false
    end
  end

  private

  def legacy_verify(raw)
    Digest::SHA1.hexdigest("#{salt}#{raw}") == legacy_digest
  end
end
```