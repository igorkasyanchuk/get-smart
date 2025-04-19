## 🔐 Mutual TLS with Custom SSLContext

In high-security environments, implementing mutual TLS (mTLS) ensures both client and server authenticate each other. You can use `OpenSSL::SSL::SSLContext` to configure your own certificate paths, cipher suites, and verification callbacks for fine-grained control over handshake behavior.

```ruby
require 'openssl'
require 'socket'

context = OpenSSL::SSL::SSLContext.new
context.cert = OpenSSL::X509::Certificate.new(File.read('server.crt'))
context.key  = OpenSSL::PKey::RSA.new(File.read('server.key'), 'passphrase')
context.ca_file = 'ca_bundle.pem'
context.verify_mode = OpenSSL::SSL::VERIFY_PEER | OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT
context.verify_callback = lambda do |ok, store_context|
  cert = store_context.current_cert
  # Reject certificates that aren't signed by a specific issuer
  ok && cert.issuer.to_s.include?('OU=TrustedCA')
end
context.ciphers = 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384'

server = TCPServer.new(4433)
ssl_server = OpenSSL::SSL::SSLServer.new(server, context)
ssl_client = ssl_server.accept
puts "Client certificate: #{ssl_client.peer_cert.subject}" if ssl_client.peer_cert
ssl_client.puts("Welcome, secure client!")
ssl_client.close
```