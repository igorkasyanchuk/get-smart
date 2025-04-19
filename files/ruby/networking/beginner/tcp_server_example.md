## 🛡️ Simple TCP Server

Ruby's `TCPServer` lets you listen for incoming connections on a specified port. You can accept a client, read its request, send back a response, and then close the connection. This basic echo server will send back any data the client sends.

```ruby
require 'socket'

server = TCPServer.new('localhost', 3000)
puts 'Server running on port 3000...'
loop do
  client = server.accept
  data = client.gets
  client.puts "Echo: #{data}"   # Echoes received data
  client.close
end
```