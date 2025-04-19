## 🔒 Custom TLS Handshake with ALPN and OCSP Stapling

For enterprise-grade servers, you might need to control ALPN protocols, SNI routing, and OCSP stapling manually. Ruby’s OpenSSL bindings expose low‐level hooks to customize the TLS handshake.

```ruby
require 'socket'
require 'openssl'

# Prepare SSL context
ctx = OpenSSL::SSL::SSLContext.new
ctx.ssl_version = :TLSv1_3
ctx.min_version = OpenSSL::SSL::TLS1_2_VERSION
ctx.ciphers = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384'

# Enable ALPN for HTTP/2 and HTTP/1.1
ctx.alpn_protocols = ['h2', 'http/1.1']
ctx.alpn_select_cb = proc do |protocols|
  # Prefer HTTP/2 if offered
  (['h2'] & protocols).first || 'http/1.1'
end

# OCSP stapling callback
ctx.status_request_cb = proc do |ssl|
  ocsp_resp = File.binread('ocsp_response.der')
  ocsp_resp
end

# Load certificates and key
ctx.cert = OpenSSL::X509::Certificate.new(File.read('server.crt'))
ctx.key = OpenSSL::PKey::EC.new(File.read('server.key'))

server = TCPServer.new(443)
ssl_server = OpenSSL::SSL::SSLServer.new(server, ctx)

loop do
  ssl_socket = ssl_server.accept
  selected_proto = ssl_socket.alpn_protocol
  puts "Client negotiated: #{selected_proto}"
  ssl_socket.write "Hello over #{selected_proto}!"
  ssl_socket.close
end
```

Key points:
- `alpn_select_cb` lets you pick the best protocol based on client offers.
- `status_request_cb` allows dynamic stapling of OCSP responses per connection.
- Always load your cert chain and key securely (e.g., from encrypted storage).
