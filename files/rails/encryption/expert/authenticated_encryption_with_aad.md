## 🛡️ Add Associated Data for Contextual Integrity

Using Authenticated Encryption (AEAD) with additional authenticated data (AAD) ensures integrity not just of the ciphertext but of your contextual metadata. This prevents replay or tampering in multi-tenant or audit-critical scenarios. Pass a JSON-encoded AAD blob that is verified on decryption.

```ruby
# In your service or model:
primary_key = Rails.application.key_generator.generate_key(
  Rails.application.credentials.encryption[:primary_key], 32
)
encryptor = ActiveSupport::MessageEncryptor.new(
  primary_key,
  cipher: 'aes-256-gcm'
)

# Construct context
aad = {
  user_id: current_user.id,
  request_id: request.uuid,
  timestamp: Time.current.iso8601
}.to_json

# Encrypt with AAD
encrypted_payload = encryptor.encrypt_and_sign(
  'SuperSecretPayload',
  authenticated_data: aad
)

# Decrypt and verify same AAD
decrypted = encryptor.decrypt_and_verify(
  encrypted_payload,
  authenticated_data: aad
)
```