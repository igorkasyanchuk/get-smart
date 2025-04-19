## 📊 Combine GC::Profiler and ObjectSpace for Memory Profiling
Ruby’s `GC::Profiler` along with `ObjectSpace.memsize_of_all` can reveal allocation hotspots during a benchmark. Enable the profiler, run your code block, then inspect GC and memory metrics to identify heavy allocators.

```ruby
require 'benchmark'

GC::Profiler.enable
initial_mem = ObjectSpace.memsize_of_all

time = Benchmark.measure do
  10_000.times { Post.new(title: 'Benchmark').save! }
end

GC::Profiler.report
puts "Memory Change: #{(ObjectSpace.memsize_of_all - initial_mem) / 1024.0} KB"
puts "Elapsed: #{time.real.round(2)}s"
```