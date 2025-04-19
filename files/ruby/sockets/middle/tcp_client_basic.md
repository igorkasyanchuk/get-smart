## 🔌 Basic TCP Client with TCPSocket
This tip shows how to create a simple TCP client using Ruby’s built‑in `TCPSocket`. You’ll learn how to connect to a remote server, send a request, and handle the response in a straightforward way.

```ruby
require 'socket'

host = 'example.com'
port = 80
socket = TCPSocket.new(host, port)

# Send an HTTP GET request
socket.puts "GET / HTTP/1.1\r\nHost: #{host}\r\nConnection: close\r\n\r\n"

# Read and print the response
while line = socket.gets do
  puts line
end

socket.close
```

Adjust `host` and `port` as needed. Always ensure you close the socket to free system resources.