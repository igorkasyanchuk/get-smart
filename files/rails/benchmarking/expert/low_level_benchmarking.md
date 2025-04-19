## ⚡️ Harness Low-Level Benchmark for Micro-Optimizations

When you need nanosecond precision to decide between two algorithms, drop down to Ruby’s `Benchmark` API with GC control. By disabling garbage collection during your measurement and running high iteration counts, you can surface micro-optimizations that matter in hot code paths.

```ruby
require 'benchmark'

# Disable GC to avoid pauses during measurement
gc_was_disabled = GC.disable
iterations = 500_000

Benchmark.bm(20) do |x|
  x.report("String#+:") { iterations.times { "a" + "b" } }
  x.report("String#<<:") { iterations.times { s = "a"; s << "b" } }
end

# Re-enable GC once done
GC.enable if gc_was_disabled
```