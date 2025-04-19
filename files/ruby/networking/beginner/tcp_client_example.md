## 🔌 Simple TCP Client

When you need to connect to a remote service using TCP, Ruby's built-in `TCPSocket` makes it straightforward. You can open a socket to a host and port, send data, and read the response. This example shows how to connect to `example.com` on port 80 and send an HTTP GET request.

```ruby
require 'socket'

socket = TCPSocket.new('example.com', 80)
socket.puts "GET / HTTP/1.1\r\nHost: example.com\r\n\r\n"
response = socket.read
puts response
socket.close
```