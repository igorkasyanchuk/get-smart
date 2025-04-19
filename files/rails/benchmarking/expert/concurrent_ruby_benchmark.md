## 🤖 Benchmark Concurrent Operations with Concurrent Ruby

Benchmarking serial code can hide parallel bottlenecks in I/O or CPU‑bound tasks. Use `concurrent-ruby`’s thread pools or futures to simulate real concurrent workloads and measure end‑to‑end throughput in a controlled environment.

```ruby
require 'benchmark'
require 'concurrent'

pool = Concurrent::FixedThreadPool.new(8)
tasks = 1_000.times.map do
  Concurrent::Future.execute(executor: pool) do
    # Replace with real heavy I/O or CPU task
dir = Dir.glob('/usr/share/dict/*').shuffle.first
    File.read(dir)
  end
end

time = Benchmark.realtime { tasks.each(&:wait) }
pool.shutdown; pool.wait_for_termination

puts "Concurrent workload completed in #{(time*1000).round(2)}ms"
```