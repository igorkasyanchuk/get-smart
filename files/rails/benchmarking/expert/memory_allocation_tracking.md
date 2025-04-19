## 🧠 Track Memory Allocation and GC Impact

Microbenchmarks often ignore memory churn, but large heaps or frequent GCs can kill performance. By pairing `Benchmark.realtime` with `GC.stat` and `ObjectSpace`, you can correlate time cost with allocation patterns and tune both code and GC settings.

```ruby
require 'benchmark'

# Warm up and clear heap for consistent stats
GC.start(full_mark: true, immediate_sweep: true)

before_stats = GC.stat
before_count = ObjectSpace.each_object(String).count

time = Benchmark.realtime do
  100_000.times { "x" * 100 }
end

after_stats = GC.stat
after_count = ObjectSpace.each_object(String).count

puts "Time: #{(time*1000).round(2)}ms"
puts "Heap live slots Δ: #{after_stats[:heap_live_slots] - before_stats[:heap_live_slots]}"
puts "String objects Δ: #{after_count - before_count}"