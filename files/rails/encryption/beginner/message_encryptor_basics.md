## 🔒 Encrypt Data with ActiveSupport::MessageEncryptor

For small payloads or single‐value encryption (e.g., tokens), use `ActiveSupport::MessageEncryptor`. It handles both encryption and message authentication. First, derive a key, then encrypt and decrypt:

```ruby
# config/initializers/encryptor.rb
secret = Rails.application.secret_key_base[0..31]         # 32‐byte key
crypt  = ActiveSupport::MessageEncryptor.new(secret)

# Encrypt
token   = crypt.encrypt_and_sign('user@example.com')
# => "--8D4jRatz..."

# Decrypt
email = crypt.decrypt_and_verify(token)
# => "user@example.com"
```