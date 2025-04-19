## 🤝 Build a Non‑Blocking TCP Client with TCPSocket

For custom protocols or high‑throughput services, you can use Ruby’s `TCPSocket` with `IO.select` for non‑blocking I/O. This allows you to wait on multiple sockets simultaneously and handle data as it arrives without threading overhead.

```ruby
require 'socket'

socket = TCPSocket.new('chat.example.com', 12345)
socket.sync = true

loop do
  ready = IO.select([socket, STDIN])
  ready[0].each do |io|
    if io == socket
      data = socket.read_nonblock(1024)
      puts "Server: #{data}" if data
    else
      message = STDIN.gets.chomp
      socket.write(message)
    end
  end
end
```