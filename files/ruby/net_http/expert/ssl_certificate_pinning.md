## 🔒 Enforce SSL Certificate Pinning via OpenSSL Context

To defend against MITM attacks, pin the server’s public key or certificate fingerprint. Customize the `OpenSSL::SSL::SSLContext` used by Net::HTTP to verify the exact fingerprint in the TLS handshake.

```ruby
require 'net/http'
require 'openssl'

PINNED_FINGERPRINT = 'AB:CD:EF:12:34:56:78:90:AB:CD:EF:12:34:56:78:90:AB:CD:EF:12'

uri = URI('https://secure.example.com')

tls = OpenSSL::SSL::SSLContext.new
tls.verify_mode = OpenSSL::SSL::VERIFY_PEER
tls.verify_callback = proc do |preverify_ok, store_ctx|
  cert = store_ctx.current_cert
  digest = OpenSSL::Digest::SHA1.hexdigest(cert.to_der).upcase.scan(/../).join(":")
  preverify_ok && (digest == PINNED_FINGERPRINT)
end

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.ssl_timeout = 15
http.ssl_context = tls

response = http.get(uri.request_uri)
puts response.body
```

This approach halts the connection unless the certificate exactly matches your pinned fingerprint, adding a robust layer of trust.