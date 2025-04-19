## 🔧 Implement a Bounded Thread Pool with SizedQueue
To avoid unbounded thread growth under load and to propagate errors gracefully, combine `SizedQueue` with a fixed worker set. Producers push jobs into the queue, workers pull and execute them, and you can signal shutdown by pushing special sentinel values.

```ruby
require 'thread'

class ThreadPool
  def initialize(size, queue_size)
    @jobs      = SizedQueue.new(queue_size)
    @workers   = Array.new(size) do |i|
      Thread.new do
        loop do
          job = @jobs.pop
          break if job == :shutdown
          begin
            job.call
          rescue => e
            warn "Worker \\##{i} failed: #{e.message}"
          end
        end
      end
    end
  end

  def schedule(&block)
    @jobs.push(block)
  end

  def shutdown
    @workers.size.times { @jobs.push(:shutdown) }
    @workers.each(&:join)
  end
end

# Usage
pool = ThreadPool.new(5, 50)
100.times { |i| pool.schedule { puts "Job #{i}" } }
pool.shutdown
```

This setup enforces back-pressure (via `SizedQueue`), catches per-job exceptions, and cleanly joins all threads on shutdown.