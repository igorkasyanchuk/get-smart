## 🛡️ Create a SHA256 Digest

Checksums let you verify that data hasn’t been tampered with. OpenSSL::Digest provides a simple interface to compute SHA256 hashes. You can get both raw and hex-encoded outputs depending on your needs.

```ruby
require 'openssl'

data = 'The quick brown fox jumps over the lazy dog'

# Initialize a SHA256 context
digest = OpenSSL::Digest::SHA256.new

# Compute the hex-encoded digest
hex_hash = digest.hexdigest(data)
puts "SHA256 (hex): #{hex_hash}"

# Compute the raw binary digest if needed
raw_hash = digest.digest(data)
puts "SHA256 (raw bytes): #{raw_hash}"  # not printable
```