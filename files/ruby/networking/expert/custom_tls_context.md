## 🔒 Advanced TLS Configuration with OpenSSL::SSL::SSLContext

Fine-tune your TLS connections by customizing cipher suites, protocol versions, and certificate validation in `OpenSSL::SSL::SSLContext`. This grants you control over security policies and SNI support for connecting to modern servers.

```ruby
require 'net/http'
require 'openssl'

context = OpenSSL::SSL::SSLContext.new(:TLSv1_2)
context.verify_mode = OpenSSL::SSL::VERIFY_PEER
context.ciphers = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384'
context.min_version = OpenSSL::SSL::TLS1_2_VERSION
context.max_version = OpenSSL::SSL::TLS1_3_VERSION
context.options |= OpenSSL::SSL::OP_NO_COMPRESSION
context.verify_callback = proc do |preverify_ok, store_ctx|
  # implement custom chain validation or HPKP pin checks
  preverify_ok
end

uri = URI('https://secure.example.com/resource')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.ssl_version = :TLSv1_2
http.ssl_context = context
http.start do |h|
  resp = h.get(uri)
  puts resp.body
end
```