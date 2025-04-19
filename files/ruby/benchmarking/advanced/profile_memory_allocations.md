## 📊 Incorporate Memory Allocation Metrics into Your Benchmarks

In addition to time, monitoring object allocations helps pinpoint memory bloat. You can capture allocation counts by combining `GC.stat` or using the `memory_profiler` gem before and after your code.

```ruby
require 'benchmark'
require 'memory_profiler'

report = MemoryProfiler.report do
  10_000.times { Array.new(5) { rand } }
end
report.pretty_print(to_file: 'allocations.txt')
```