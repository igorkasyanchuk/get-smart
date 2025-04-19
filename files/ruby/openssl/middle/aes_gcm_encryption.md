## 🔒 AES-GCM Encryption

Using AES in GCM mode gives you authenticated encryption with integrity checks. You can securely encrypt and decrypt data with minimal boilerplate using `OpenSSL::Cipher`.

```ruby
require 'openssl'

def aes_gcm_encrypt(plaintext, key)
  cipher = OpenSSL::Cipher.new('aes-256-gcm')
  cipher.encrypt
  cipher.key = key = key[0..31]
  iv = cipher.random_iv
  ciphertext = cipher.update(plaintext) + cipher.final
  tag = cipher.auth_tag
  { iv: iv, ciphertext: ciphertext, tag: tag, key: key }
end

def aes_gcm_decrypt(iv:, ciphertext:, tag:, key:)
  cipher = OpenSSL::Cipher.new('aes-256-gcm')
  cipher.decrypt
  cipher.key = key
  cipher.iv = iv
  cipher.auth_tag = tag
  cipher.update(ciphertext) + cipher.final
end

# Usage:
secret = "My super secret message"
key = OpenSSL::Random.random_bytes(32)
encrypted = aes_gcm_encrypt(secret, key)
decrypted = aes_gcm_decrypt(**encrypted)
puts decrypted # => "My super secret message"
```