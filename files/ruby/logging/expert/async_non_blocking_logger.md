## 🚀 Asynchronous Non‑blocking Logger with Backpressure Control

When synchronous I/O becomes a bottleneck, implementing an async logger with a bounded buffer ensures your app doesn’t block or exhaust memory under peak load. This example uses `Concurrent::ArrayQueue` for buffering, a dedicated worker thread for writes, and simple backpressure by dropping oldest entries when full.

```ruby
require 'concurrent'
require 'logger'

class AsyncLogger
  def initialize(log_dev, buffer_size: 10_000)
    @queue    = Concurrent::ArrayQueue.new(buffer_size)
    @logger   = Logger.new(log_dev)
    @shutdown = Concurrent::Event.new

    @worker = Thread.new do
      until @shutdown.set? && @queue.empty?
        if msg = @queue.pop(true) rescue nil
          @logger << msg
        else
          sleep(0.01)
        end
      end
    end
  end

  def <<(msg)
    if @queue.full?
      # Backpressure: drop oldest until space
      @queue.pop while @queue.full?
    end
    @queue.push(msg)
  end

  def close
    @shutdown.set
    @worker.join
    @logger.close
  end
end

# Usage
async_logger = AsyncLogger.new(STDOUT)
async_logger << "Heavy log message with data: #{payload.inspect}\n"
# On shutdown
async_logger.close
```