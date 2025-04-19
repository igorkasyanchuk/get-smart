## 🌐 Custom SSLContext for Secure HTTP

You can configure `OpenSSL::SSL::SSLContext` to enforce strong ciphers, set timeouts, and pin CAs when using `Net::HTTP`.

```ruby
require 'net/http'
require 'openssl'

uri = URI('https://api.example.com/data')
ctx = OpenSSL::SSL::SSLContext.new(:TLSv1_2)
# Enforce only strong ciphers
ctx.ciphers = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384'
# Use system and custom CA
ctx.set_params(
  verify_mode: OpenSSL::SSL::VERIFY_PEER,
  ca_file: '/etc/ssl/certs/ca-bundle.crt'
)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.ssl_version = :TLSv1_2
http.ssl_timeout = 5
http.read_timeout = 10
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
http.cert_store = ctx.cert_store

response = http.get(uri)
puts response.body
```