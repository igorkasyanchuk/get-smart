## 🚀 Non-Blocking TCP Sockets with IO.select
By using `Socket#connect_nonblock` and `IO.select`, you can manage dozens of concurrent connections without threads. This approach avoids blocking on connect/send calls and lets you handle readiness manually, improving throughput for high-load scenarios. Handle `Errno::EINPROGRESS` and use `IO.select` to wait for writable/readable sockets before proceeding.

```ruby
require 'socket'

addr = Socket.sockaddr_in(80, 'example.com')
sock = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)

begin
  sock.connect_nonblock(addr)
rescue IO::WaitWritable
  # Wait until socket is writable (connected)
  IO.select(nil, [sock], nil, 5) or raise "Connection timeout"
end

# Send data non-blocking
request = "GET / HTTP/1.1\r\nHost: example.com\r\nConnection: close\r\n\r\n"
sock.send_nonblock(request)

# Read response when readable
while IO.select([sock], nil, nil, 5)
  chunk = sock.recv_nonblock(1024)
  puts chunk
end

sock.close
```