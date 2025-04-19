## 🛡️ Using ActiveSupport::MessageEncryptor for Custom Data

When you need to encrypt arbitrary data (tokens, JSON blobs, URLs) outside of models, `ActiveSupport::MessageEncryptor` is your friend. It provides authenticated encryption so tampering is detected.

```ruby
# config/initializers/message_encryptor.rb
key     = Rails.application.secret_key_base.byteslice(0..31)
cryptor = ActiveSupport::MessageEncryptor.new(key)

# Encrypt
encrypted = cryptor.encrypt_and_sign({user_id: 42, expires_at: 1.hour.from_now}.to_json)

# Decrypt later
begin
  json = cryptor.decrypt_and_verify(encrypted)
  data = JSON.parse(json)
rescue ActiveSupport::MessageVerifier::InvalidSignature
  # handle tampering
end
```