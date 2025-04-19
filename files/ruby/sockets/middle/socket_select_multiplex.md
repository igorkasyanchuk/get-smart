## ⚙️ Handling Multiple Sockets with `select`
When your server needs to manage multiple clients without blocking, Ruby’s `IO.select` is your friend. This example demonstrates how to wait on multiple sockets (server + clients) and only read from sockets ready for I/O.

```ruby
require 'socket'

server = TCPServer.new(4000)
clients = []

loop do
  # Build the list: server + all connected clients
  ready = IO.select([server] + clients)

  ready[0].each do |io|
    if io == server
      client = server.accept
      clients << client
      puts "New client connected"
    else
      data = io.gets
      if data
        io.puts "Echo: #{data.chomp}"
      else
        puts "Client disconnected"
        clients.delete(io)
        io.close
      end
    end
  end
end
```

This approach avoids one thread per connection, improves scalability, and keeps resource usage low.