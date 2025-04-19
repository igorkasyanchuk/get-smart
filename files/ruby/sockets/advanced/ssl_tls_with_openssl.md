## 🔒 SSL/TLS Server with OpenSSL

Wrapping plain TCP sockets with `OpenSSL::SSL` transforms them into secure channels. Create an `SSLContext` with your certificate and private key, then use `OpenSSL::SSL::SSLServer` to accept encrypted connections. This setup ensures client/server handshake, encryption, and certificate validation automatically.

```ruby
require 'socket'
require 'openssl'

ctx = OpenSSL::SSL::SSLContext.new
ctx.cert = OpenSSL::X509::Certificate.new(File.read('server.crt'))
ctx.key  = OpenSSL::PKey::RSA.new(File.read('server.key'))

tcp_server = TCPServer.new('0.0.0.0', 4433)
ssl_server = OpenSSL::SSL::SSLServer.new(tcp_server, ctx)

loop do
  ssl_socket = ssl_server.accept
  Thread.start(ssl_socket) do |ssock|
    ssock.puts "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nHello over TLS"
    ssock.close
  end
end
```

On the client side, use `OpenSSL::SSL::SSLSocket` to wrap a `TCPSocket` and call `connect` to perform the handshake.