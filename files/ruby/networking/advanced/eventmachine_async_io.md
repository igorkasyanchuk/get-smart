## 🔄 Asynchronous I/O with EventMachine and Fibers
Leverage EventMachine for non-blocking I/O and wrap callbacks in Fibers (via `em-synchrony`) to write code in a synchronous style. This yields high concurrency with minimal thread overhead, perfect for long-lived connections like WebSocket clients or microservices.

```ruby
require 'eventmachine'
require 'em-synchrony'
require 'em-hiredis'

EM.synchrony do
  # Asynchronous TCP connection
  conn = EM::Protocols::LineAndTextProtocol.connect('example.com', 1234)

  # Use fiber to await data effortlessly
  fiber = Fiber.current
  handler = Module.new do
    include EM::P::LineText2
    def receive_line(line)
      puts "Received: #{line}"
      Fiber.yield
    end
  end

  # Send data and wait for response
  conn.send_data("HELLO\n")
  Fiber.yield

  EM.stop
end
```