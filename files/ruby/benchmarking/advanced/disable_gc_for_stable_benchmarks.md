## 🚫 Temporarily Disable Garbage Collection During Benchmarks

Garbage collection pauses can skew microbenchmark results. By disabling GC around your critical section, you avoid unpredictable stop-the-world events, but be sure to re-enable it afterward to prevent memory bloat.

```ruby
require 'benchmark'

GC.disable
results = Benchmark.measure do
  10_000.times { "foo" * 10 }
end
GC.enable

puts results
```