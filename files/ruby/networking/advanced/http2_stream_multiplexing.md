## ⚡ HTTP/2 Stream Multiplexing with the `http-2` Gem
Use the `http-2` gem to open a single TCP+TLS connection and multiplex multiple HTTP/2 streams simultaneously. This reduces latency by sending parallel requests over the same socket, while the gem handles framing and stream state management for you.

```ruby
require 'http/2'
require 'socket'
require 'openssl'

# Establish TLS socket
ssl_ctx = OpenSSL::SSL::SSLContext.new(:TLSv1_3)
sock = TCPSocket.new('api.example.com', 443)
ssl = OpenSSL::SSL::SSLSocket.new(sock, ssl_ctx)
ssl.connect

client = HTTP2::Client.new

# Hook into the socket
client.on(:frame) do |bytes|
  ssl.write(bytes)
end

# Read incoming frames
Thread.new do
  loop do
    data = ssl.readpartial(1024)
    client << data
  end
end

# Create two concurrent streams
["/stream1", "/stream2"].each do |path|
  stream = client.new_stream
  stream.on(:headers) { |h| puts "Headers: #{h}" }
  stream.on(:data)    { |d| puts "Data: #{d}" }
  stream.headers({ ':method' => 'GET', ':path' => path, ':scheme' => 'https', ':authority' => 'api.example.com' }, end_stream: true)
end

# Flush pending frames
client.ping
```