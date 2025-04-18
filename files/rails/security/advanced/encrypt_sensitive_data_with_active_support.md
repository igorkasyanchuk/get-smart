## 🔐 Encrypt Sensitive Data Using ActiveSupport::MessageEncryptor

For encrypting application data securely, leverage Rails built-in encryption.

```ruby
key = ActiveSupport::KeyGenerator.new('password').generate_key('salt', 32)
encryptor = ActiveSupport::MessageEncryptor.new(key)

encrypted_data = encryptor.encrypt_and_sign('sensitive info')
decrypted_data = encryptor.decrypt_and_verify(encrypted_data)
```