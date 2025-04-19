## 🔧 Custom SSLContext Configuration for Advanced TLS Handshakes
By fine‑tuning `OpenSSL::SSL::SSLContext`, you can control ciphers, protocols, ALPN, session reuse, and hostname verification for strict security requirements. This approach is essential when integrating Ruby clients in environments with corporate firewalls or FIPS‑compliant modules. You can also hook into the handshake to inspect peer certificates or inject custom OCSP responses.

```ruby
require 'openssl'

ctx = OpenSSL::SSL::SSLContext.new(:TLSv1_2)
# Restrict to strong ciphers and enable session tickets
ctx.ciphers = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384'
ctx.options |= OpenSSL::SSL::OP_NO_COMPRESSION | OpenSSL::SSL::OP_SINGLE_ECDH_USE
ctx.session_cache_mode = OpenSSL::SSL::SSLContext::SESSION_CACHE_CLIENT

# Enforce hostname verification
ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER | OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT
ctx.verify_hostname = true

tcp = TCPSocket.new('secure.example.com', 443)
ssl = OpenSSL::SSL::SSLSocket.new(tcp, ctx)
ssl.connect
puts "Negotiated Protocol: #{ssl.alpn_protocol}"
ssl.sysclose
```