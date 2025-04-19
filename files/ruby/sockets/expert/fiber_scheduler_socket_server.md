## ⚡ High-Concurrency Socket Server with Fiber Scheduler

Ruby 3 introduces a global scheduler API to integrate blocking I/O into fibers transparently. You can write synchronous‐style socket code while scaling to millions of connections.

```ruby
require 'socket'
require 'fiber'

# Install an EventMachine‐like reactor
require 'io/wait'
Fiber.set_scheduler(->(fiber, io, event) do
  io.public_send("wait_#{event}")
  fiber.transfer
end)

def handle(client)
  # This appears blocking but uses Fiber scheduler under the hood
  while data = client.gets
    client.write "Echo: ".upcase
  end
  client.close
end

server = TCPServer.new('0.0.0.0', 12345)

loop do
  sock = server.accept
  Fiber.schedule { handle(sock) }
end

# Keep the main fiber alive
Fiber.current.resume
```

Advanced notes:
- The scheduler converts `io.wait_readable`/`io.wait_writable` into fiber suspensions.
- You can layer any event library (e.g., `libev` or `nio4r`) by supplying a custom scheduler.
- Monitor file descriptors and timers for timeouts and cancellation via `Fiber.schedule`.
- Ideal for building microservices that require massive concurrency with minimal threading overhead.
