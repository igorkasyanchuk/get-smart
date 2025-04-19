## ⚡ Asynchronous I/O Multiplexing with Fibers

Leverage `Fiber` with non‑blocking IO and `IO.select` to build lightweight async sockets without external gems. You can wrap each connection in a Fiber that yields when its socket would block and resumes when data is available, enabling thousands of concurrent connections in a single thread.

```ruby
class AsyncSocket
  def initialize(socket)
    @socket = socket
  end

  def read_nonblock(maxlen)
    loop do
      begin
        return @socket.read_nonblock(maxlen)
      rescue IO::WaitReadable
        Fiber.yield(:readable)
      end
    end
  end

  def write_nonblock(data)
    loop do
      begin
        return @socket.write_nonblock(data)
      rescue IO::WaitWritable
        Fiber.yield(:writable)
      end
    end
  end
end

# Scheduler
def run(fibers)
  while fibers.any?
    readable, writable = select(fibers.map(&:value), fibers.map(&:value))
    fibers.each do |f|
      if readable&.include?(f.value) || writable&.include?(f.value)
        f.resume
      end
    end
  end
end
```
