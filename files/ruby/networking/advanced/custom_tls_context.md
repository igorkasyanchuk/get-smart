## 🔐 Custom TLS Context with OpenSSL for Advanced Cipher Control
Fine-tune your TLS handshake by creating an `OpenSSL::SSL::SSLContext`, specifying ciphers, protocol versions, and certificate verification options. This enables strict security policies and compatibility tweaks (e.g., ALPN for HTTP/2). Inject the context into `Net::HTTP` or raw sockets to take full control of SSL parameters.

```ruby
require 'net/http'
require 'openssl'

ctx = OpenSSL::SSL::SSLContext.new(:TLSv1_2)
ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER
ctx.ca_file = '/etc/ssl/certs/ca-certificates.crt'
ctx.ciphers = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384'
ctx.alpn_protocols = ['h2', 'http/1.1']

uri = URI('https://example.com')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.ssl_version = :TLSv1_2
http.ssl_timeout = 10
http.cert_store = ctx.cert_store
http.verify_mode = ctx.verify_mode
http.ciphers = ctx.ciphers
http.alpn_protocols = ctx.alpn_protocols

response = http.get(uri)
puts response.body
```