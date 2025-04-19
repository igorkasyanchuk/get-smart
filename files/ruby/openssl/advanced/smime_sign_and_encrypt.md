## ✉️ S/MIME Signing and Encryption with OpenSSL
Use Ruby’s OpenSSL bindings to produce and verify S/MIME messages, providing end‑to‑end confidentiality and authenticity for email or data streams. This tip shows how to sign, encrypt, then decrypt and verify in a single script—ideal for secure messaging pipelines or automated archival.

```ruby
require 'openssl'

# Load keys and certificates
sign_cert = OpenSSL::X509::Certificate.new(File.read('signer.crt'))
sign_key  = OpenSSL::PKey::RSA.new(File.read('signer.key'))
encrypt_cert = OpenSSL::X509::Certificate.new(File.read('recipient.crt'))

# Original data
data = 'Top secret payload'

# Sign the data
smime = OpenSSL::PKCS7.sign(sign_cert, sign_key, data, [], OpenSSL::PKCS7::DETACHED)

# Encrypt the signed blob
encrypted = OpenSSL::PKCS7.encrypt([encrypt_cert], smime.to_der,
                                   OpenSSL::Cipher.new('aes-256-cbc'),
                                   OpenSSL::PKCS7::BINARY)

# Serialize to PEM
File.write('message.pem', encrypted.to_pem)

# --- On the recipient side ---
msg = OpenSSL::PKCS7.read_smime(File.read('message.pem'))
# Decrypt and verify
decrypted = OpenSSL::PKCS7.decrypt(msg, sign_key, sign_cert)
puts "Verified and decrypted: #{decrypted}"