## 🚀 Non-blocking I/O with IO.select

When handling many simultaneous connections, switching sockets to non‑blocking mode and using `IO.select` lets you multiplex reads and writes efficiently without spawning threads per client. You can set a socket to non‑blocking via `fcntl` or `#nonblock!`, then monitor arrays of sockets for readiness. This pattern scales better under high concurrency.

```ruby
require 'socket'

server = TCPServer.new(4000)
sockets = [server]

loop do
  ready_to_read, ready_to_write = IO.select(sockets, sockets, [], 5)

  # Handle ready sockets
  if ready_to_read
    ready_to_read.each do |sock|
      if sock == server
        client = server.accept_nonblock exception: false
        if client
          client.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
          sockets << client
        end
      else
        data = sock.read_nonblock(4096, exception: false)
        if data.nil? || data.empty?
          sockets.delete(sock)
          sock.close
        else
          sock.write_nonblock "Echo: #{data}", exception: false
        end
      end
    end
  end
end
```