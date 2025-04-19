## 🛠 Simple TCP Server with TCPServer
Learn how to set up a lightweight TCP server that listens for incoming connections and echoes received data back to the client. This pattern is a foundation for building chat servers, proxies, or custom protocols.

```ruby
require 'socket'

server = TCPServer.new('0.0.0.0', 3000)
puts "Server listening on port 3000"

loop do
  client = server.accept       # Wait for a client to connect
  data = client.gets.chomp     # Read one line from the client
  puts "Received: #{data}"
  client.puts "You said: #{data}"  # Echo back
  client.close
end
```

This example runs in a loop, handling one client at a time. For concurrent clients, consider forking or threading for each connection.