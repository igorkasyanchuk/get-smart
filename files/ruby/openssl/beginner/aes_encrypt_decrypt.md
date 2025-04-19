## 🔒 Encrypt and Decrypt Data with AES-256-CBC

AES-256-CBC is a widely used symmetric cipher. You need a 256‑bit key and a 128‑bit IV to encrypt and decrypt. Be sure to securely transmit the IV with the ciphertext (it’s not secret by itself).

```ruby
require 'openssl'

cipher = OpenSSL::Cipher.new('AES-256-CBC')
cipher.encrypt
key = cipher.random_key       # 32 bytes for 256-bit key
iv  = cipher.random_iv        # 16 bytes for 128-bit IV
plaintext = 'Top secret message'

# Encrypt
cipher.key = key
cipher.iv  = iv
encrypted = cipher.update(plaintext) + cipher.final

# Decrypt
decipher = OpenSSL::Cipher.new('AES-256-CBC')
decipher.decrypt
decipher.key = key
decipher.iv  = iv
decrypted = decipher.update(encrypted) + decipher.final

puts "Encrypted: #{encrypted.inspect}"
puts "Decrypted: #{decrypted}"  # => "Top secret message"
```