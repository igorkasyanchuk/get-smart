## 🔒 Encrypted Tempfile with OpenSSL

For sensitive data you can write to an in-memory Tempfile (e.g., `/dev/shm`) and encrypt on the fly using OpenSSL `Cipher`. This avoids plaintext touching disk and auto‐cleans on process exit. Manage your encryption key and IV securely (e.g., via ENV vars or a secrets manager).

```ruby
require 'tempfile'
require 'openssl'

cipher = OpenSSL::Cipher.new('aes-256-cbc')
cipher.encrypt
key = cipher.random_key
iv  = cipher.random_iv

plaintext = "Very secret information"

# Use a RAM-backed dir to avoid disk persistence
Tempfile.create(['secret', '.bin'], '/dev/shm') do |temp|
  temp.binmode
  encrypted_data = cipher.update(plaintext) + cipher.final
  temp.write(encrypted_data)
  temp.flush
  temp.rewind

  # Pass encrypted temp file to another process
  system('secure_processor', temp.path)
end
```