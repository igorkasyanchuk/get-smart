## 📦 Sending and Receiving with UDP

UDP sockets are connectionless and useful for lightweight, low‑latency messages. Use `UDPSocket` to send or bind and receive datagrams.

```ruby
# udp_server.rb
require 'socket'

server = UDPSocket.new
server.bind('localhost', 3000)
puts "UDP server listening on localhost:3000"

loop do
  message, sender = server.recvfrom(1024)
  addr = sender[3]
  port = sender[1]
  puts "Received '#{message}' from \\#{addr}:#{port}"
  server.send("Ack: #{message}", 0, addr, port)
end
```

```ruby
# udp_client.rb
require 'socket'

client = UDPSocket.new
client.send("Hello UDP!", 0, 'localhost', 3000)
ack, _ = client.recvfrom(1024)
puts "Server acknowledged: #{ack}"
client.close
```

The server listens for datagrams and replies with an acknowledgment. The client sends a message and waits for the response.