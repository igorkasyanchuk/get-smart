## 🔑 Generate an RSA Key Pair

Ruby’s OpenSSL library makes it easy to generate a new RSA key pair for secure communications. A 2048‑bit key is a good balance between security and performance for most beginner use cases. You can write the private and public keys directly to files for later use.

```ruby
require 'openssl'

# Generate a new 2048-bit RSA key
key = OpenSSL::PKey::RSA.new(2048)

# Export and save the private key
File.write('private_key.pem', key.to_pem)

# Extract and save the public key
public_key = key.public_key
File.write('public_key.pem', public_key.to_pem)
```