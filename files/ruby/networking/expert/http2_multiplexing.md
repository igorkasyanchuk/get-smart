## 🕸️ Efficient HTTP/2 Multiplexed Requests with the http2 Gem

Leverage the `http2` gem for full-duplex, multiplexed HTTP/2 connections, reducing latency and maximizing throughput. This approach lets you pipeline multiple streams over a single TCP/TLS session while handling stream events asynchronously.

```ruby
require 'http2'
require 'openssl'

uri = URI.parse("https://api.example.com")
conn = HTTP2::Client.new

sock = TCPSocket.new(uri.host, uri.port)
tls = OpenSSL::SSL::SSLSocket.new(sock)
tls.sync_close = true
tls.connect

conn.on(:frame) { |bytes| tls.write(bytes) }
tls.on(:read) { |data| conn << data }

stream = conn.new_stream
stream.headers(
  
  {
    ':method' => 'GET',
    ':path'   => '/v1/data',
    ':scheme' => 'https',
    ':authority' => uri.host
  }, end_stream: true
)

stream.on(:data) { |bytes| puts "Received chunk: "+bytes }
stream.on(:close) { puts "Stream closed" }

# Run the event loop
while !stream.closed? do
  data = tls.readpartial(1024) rescue break
  conn << data
end
```