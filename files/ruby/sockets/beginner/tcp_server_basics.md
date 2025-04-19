## 🚀 Starting a Simple TCP Server

A basic TCP server in Ruby listens for incoming connections and handles each client one by one. Use the `TCPServer` class to bind to a host and port, then call `accept` inside a loop to await clients.

```ruby
require 'socket'

server = TCPServer.new('localhost', 2000)
puts "Server running on localhost:2000"

loop do
  client = server.accept        # Wait for a client to connect
  client.puts "Hello from Ruby TCP Server!"
  client.close                 # Disconnect after sending a message
end
```

This will send a greeting and then close the connection for each client that connects.