## 🤹 ThreadPoolExecutor for Scalable Thread Pools

Leverage the `concurrent-ruby` gem’s `ThreadPoolExecutor` to control min/max threads, queue size, and fallback strategies without reinventing the wheel. This lets you scale up under load and throttle back when idle.

```ruby
require 'concurrent'

# Configure a dynamic pool: at least 2 threads, at most 10, with a work queue of 50
executor = Concurrent::ThreadPoolExecutor.new(
  min_threads: 2,
  max_threads: 10,
  max_queue:   50,
  fallback_policy: :caller_runs # Runs tasks on caller if queue is full
)

# Submit 100 tasks
100.times do |i|
  executor.post do
    puts "Task \(i) running in thread #{Thread.current.object_id}"
    sleep(rand * 0.1)
  end
end

# Graceful shutdown
executor.shutdown
executor.wait_for_termination(5) # seconds",