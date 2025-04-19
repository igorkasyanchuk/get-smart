## 🔒 Compressing, Encrypting and Whitelisting Marshal Payloads

Combine Zlib and OpenSSL to compress and encrypt serialized data, then safely load only permitted classes to mitigate injection risks.

```ruby
require 'zlib'
require 'openssl'
require 'stringio'

# --- Serialization ---
plain = Marshal.dump(your_object)
compressed = Zlib::Deflate.deflate(plain)

cipher = OpenSSL::Cipher.new('aes-256-gcm').encrypt
cipher.key = key = Cipher.random_key
iv = cipher.random_iv
cipher.auth_data = ''
encrypted = cipher.update(compressed) + cipher.final
auth_tag = cipher.auth_tag

payload = iv + auth_tag + encrypted
File.write('secure.dat', payload)
# Store 'key' elsewhere securely

# --- Deserialization ---
buf = File.binread('secure.dat')
iv, auth_tag, encrypted = buf[0...12], buf[12...28], buf[28..-1]

dec = OpenSSL::Cipher.new('aes-256-gcm').decrypt
dec.key = key
dec.iv  = iv
dec.auth_tag = auth_tag
dec.auth_data = ''
decompressed = Zlib::Inflate.inflate(dec.update(encrypted) + dec.final)

# Safe load with whitelisted classes (Ruby ≥2.7)
allowed = [String, Symbol, Array, Hash, YourClass]
stream = StringIO.new(decompressed)
safe_obj = Marshal.load(stream, permitted_classes: allowed)
```
