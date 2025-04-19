## 🔑 Implement Encryption Key Rotation with Multiple Keys

Managing rotating encryption keys is critical for maintaining data security without downtime. Leverage ActiveSupport::MessageEncryptor's `rotate` API to support decrypting with previous keys while using the latest primary key for encryption. Store your keys in `Rails.application.credentials` (or a vault) as an array for previous keys and a separate entry for the primary key.

```ruby
# config/initializers/encryption.rb
primary_key = Rails.application.key_generator.generate_key(
  Rails.application.credentials.encryption[:primary_key], 32
)
previous_keys = Rails.application.credentials.encryption[:previous_keys].map do |raw_key|
  Rails.application.key_generator.generate_key(raw_key, 32)
end

encryptor = ActiveSupport::MessageEncryptor.new(
  primary_key,
  cipher: 'aes-256-gcm'
)
# Allow decryption with older keys
encryptor.rotate(previous_keys)

# Usage:
ciphertext = encryptor.encrypt_and_sign('HighlySensitiveData')
# decrypts seamlessly with primary or any rotated key
plaintext  = encryptor.decrypt_and_verify(ciphertext)
```