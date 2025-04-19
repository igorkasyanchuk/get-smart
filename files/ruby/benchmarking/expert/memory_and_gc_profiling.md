## 📊 Combine Performance and Memory Profiling Using memory_profiler

CPU benchmarks alone can hide allocation hotspots and GC pressure. Leverage the `memory_profiler` gem alongside timing to detect objects churn and tune your code in one pass.

```ruby
require 'benchmark'
require 'memory_profiler'

report = MemoryProfiler.report do
  time = Benchmark.realtime do
    10_000.times { process_item(item) }
  end
  puts "Execution time: #{time.round(4)}s"
end

report.pretty_print(to_file: 'memory_report.txt')
```