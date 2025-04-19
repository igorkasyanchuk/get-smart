## 🔐 Using BCrypt to Generate and Verify Passwords

Leveraging the `bcrypt` gem directly gives you full control over how password digests are created and validated. By generating a digest with a configurable cost, you can balance security and performance, and verifying it is a simple method call.

```ruby
require 'bcrypt'

# Generating a password digest
password = 'super_secret'
cost     = BCrypt::Engine::DEFAULT_COST # adjust for dev vs prod
password_digest = BCrypt::Password.create(password, cost: cost)

# Storing `password_digest` in your database...

# Verifying at login
stored_digest = BCrypt::Password.new(password_digest)
if stored_digest.is_password?(password)
  puts 'Login successful!'
else
  puts 'Invalid credentials.'
end
```