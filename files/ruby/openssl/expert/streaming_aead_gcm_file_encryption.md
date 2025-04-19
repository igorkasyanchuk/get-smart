## 📂 Streaming Large File Encryption with AES‑GCM

When encrypting multi-gigabyte files, loading everything into memory is impractical. AES-GCM supports streaming through successive `update` calls while preserving authentication data. This pattern yields chunked encryption with integrity checks.

```ruby
require 'openssl'

def encrypt_stream(in_path, out_path, key, iv)
  cipher = OpenSSL::Cipher.new('aes-256-gcm').encrypt
  cipher.key = key
  cipher.iv  = iv

  File.open(in_path, 'rb') do |inp|
    File.open(out_path, 'wb') do |out|
      out.write(iv)   # store IV for decryption
      loop do
        chunk = inp.read(1024 * 64) or break
        out.write(cipher.update(chunk))
      end
      out.write(cipher.final)
      out.write(cipher.auth_tag)  # append tag at end
    end
  end
end

# Usage:
key = OpenSSL::Random.random_bytes(32)
iv  = OpenSSL::Random.random_bytes(12)
encrypt_stream('large_input.dat', 'large_enc.bin', key, iv)
```

To decrypt, set `cipher.decrypt`, reapply `key` and `iv`, call `cipher.auth_tag=` with the final tag, then stream `update` and `final` in the same chunked fashion.