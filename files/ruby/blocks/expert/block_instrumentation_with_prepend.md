## ⏱️ Block Instrumentation with Module#prepend
Use `Module#prepend` to wrap methods that accept blocks, automatically measuring execution times without altering original code. This approach is perfect for profiling, benchmarking, and logging behaviors.

```ruby
module Profiling
  def call(*args, &block)
    start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = super(*args, &block)
    duration = (Process.clock_gettime(Process::CLOCK_MONOTONIC) - start) * 1000
    puts "#{self.class}##{__callee__} took #{duration.round(2)}ms"
    result
  end
end

class Task
  prepend Profiling

  def call(data)
    # Simulate work
    sleep(0.01)
    "Processed #{data}"
  end
end

Task.new.call('input') # Logs execution time
```