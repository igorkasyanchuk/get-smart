## 🤝 Connecting with a TCP Client

Use `TCPSocket` to connect to a TCP server by specifying the host and port. Once connected, you can read from and write to the socket just like an IO object.

```ruby
require 'socket'

socket = TCPSocket.new('localhost', 2000)
response = socket.gets       # Read one line from the server
puts "Server says: #{response.chomp}"
socket.close                # Always close when done
```

This script connects to the server we created, reads the greeting, prints it, and then closes the socket.