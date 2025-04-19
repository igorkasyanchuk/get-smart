## 🚀 Concurrent IO Without Threads Using Fibers
Leverage `IO.select` inside fibers to multiplex socket or file IO, achieving non‑blocking behavior without spawning OS threads. By resuming fibers when their IO is readable or writable, you can manage thousands of connections in a single reactor loop.

```ruby
clients = []
server = TCPServer.new(1234)

def handle(client)
  loop do
    data = client.read_nonblock(1024)
    break if data.empty?
    client.write "Echo: #{data}"
  end
rescue IO::WaitReadable, IO::WaitWritable
  Fiber.yield client
ensure
  client.close
end

reactor = Fiber.new do
  loop do
    r, w = IO.select(clients + [server], clients)
    if r.include? server
      sock = server.accept_nonblock
      clients << sock
      f = Fiber.new { handle(sock) }
      clients << f.resume
    end
    (r + w).each { |sock| Fiber.schedule(sock) }
  end
end

reactor.resume