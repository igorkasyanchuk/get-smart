## 🔐 Stream Encrypt/Decrypt Files with OpenSSL Cipher Streams
For large-file encryption without buffering entire files, chain Ruby’s `OpenSSL::Cipher` with IO streaming. This keeps memory usage constant and integrates with any IO object.

```ruby
require 'openssl'

cipher = OpenSSL::Cipher.new('aes-256-gcm')
cipher.encrypt
key = cipher.random_key
iv  = cipher.random_iv

encrypted = File.open('secret.enc', 'wb')
encrypted.write(iv)

iobuf = ''
File.open('secret.tar.gz', 'rb') do |input|
  while input.read(4096, iobuf)
    encrypted.write(cipher.update(iobuf))
  end
end
encrypted.write(cipher.final)
encrypted.close
```

Use similar logic with `cipher.auth_tag` to append GCM authentication tag. On decryption, read `iv`, set `cipher.decrypt`, and stream through `cipher.update` + `cipher.final`.