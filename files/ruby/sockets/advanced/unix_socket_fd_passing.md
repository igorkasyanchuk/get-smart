## 🛠️ Passing File Descriptors over UNIX Domain Sockets

UNIX domain sockets support sending open file descriptors between processes via `send_io` and `recv_io`. This lets you centralize resource management (e.g., listening sockets or temp files) in one process and share them securely with workers.

```ruby
require 'socket'

# Parent process: create a UNIX socket and open a file
server = UNIXServer.new('/tmp/ipc.sock')
file_to_share = File.open('/var/log/myapp.log', 'a')

# Fork a child to receive the FD
pid = fork do
  sock = server.accept
  received_file = sock.recv_io
  received_file.puts "Child wrote at #{Time.now}\n"
  received_file.close
  sock.close
end

# Parent sends the file descriptor
sock = UNIXSocket.new('/tmp/ipc.sock')
sock.send_io(file_to_share)
sock.close
file_to_share.close
Process.wait(pid)
```

This technique avoids reopening resources and can pass sockets, pipes, or files securely across privilege boundaries.