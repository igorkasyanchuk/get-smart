## 🚀 Zero-Copy File Transfer with sendfile

When serving large static assets, avoiding user‐space copies can drastically reduce CPU and memory overhead. Ruby’s `IO#sendfile` uses the OS `sendfile(2)` syscall under the hood to transfer file data directly between a file descriptor and a socket.

Example: building a minimal HTTP file server with zero-copy:

```ruby
require 'socket'

server = TCPServer.new('0.0.0.0', 8080)
puts "Listening on 8080..."

while client = server.accept
  Thread.new(client) do |sock|
    # Read and ignore the request
    sock.gets

    # Open the file and send headers
    File.open('large_video.mp4', 'rb') do |file|
      sock.write "HTTP/1.1 200 OK\r\n"
      sock.write "Content-Type: video/mp4\r\n"
      sock.write "Content-Length: #{file.size}\r\n"
      sock.write "Connection: close\r\n\r\n"

      # Zero-copy transfer
      sock.sendfile(file)
    end
    sock.close
  end
end
```

Tips:
- Ensure the client socket is in blocking mode (default) for `sendfile`. Nonblocking may return `:wait_writable`.
- Check error codes: on Linux, you can rescue `Errno::ENOSYS` to fallback to manual reads.
- This technique works best under high I/O loads, e.g., CDN or media streaming servers.
