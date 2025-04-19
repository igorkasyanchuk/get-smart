## 🔑 Rotate and Version Cookie Encryption Keys
Rotating your cookie encryption and signing keys regularly limits blast radius if a key is compromised. Rails’ `cookies_rotations` API lets you accept cookies encrypted with old secrets while issuing new ones with the latest key.

```ruby
# config/initializers/cookie_rotation.rb
Rails.application.config.action_dispatch.encrypted_cookie_cipher = "aes-256-gcm"

# Fetch keys from credentials (or ENV)
new_key    = Rails.application.credentials.dig(:cookie_rotations, :new_key)
old_key    = Rails.application.credentials.dig(:cookie_rotations, :old_key)
signed_old = Rails.application.credentials.dig(:cookie_rotations, :signed_old_key)

Rails.application.config.action_dispatch.cookies_rotations.tap do |rotations|
  # Accept cookies encrypted/signed with the old key
  rotations.rotate :encrypted, new_key
  rotations.rotate :encrypted, old_key

  # For signed (but not encrypted) cookies
  rotations.rotate :signed, signed_old
end

# Usage in controllers:
cookies.encrypted[:user_pref] = { theme: 'dark', expires: 2.weeks.from_now }
cookies.signed[:visit_count] ||= 0
```