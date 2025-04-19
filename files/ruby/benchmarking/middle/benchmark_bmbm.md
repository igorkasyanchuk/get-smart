## 🧪 Leveraging Benchmark.bmbm for Accurate Comparisons

The `bmbm` method runs each block twice—first in a rehearsal phase and then for real—to help eliminate first-run anomalies like JIT warm-up or GC overhead. This yields more reliable comparison results when benchmarking multiple implementations. You can use it just like `bm` but get better consistency.

```ruby
require 'benchmark'

Benchmark.bmbm(12) do |x|
  x.report('string +')     { 100_000.times { 'a' + 'b' } }
  x.report('interpolation'){ 100_000.times { "{"a"}"{"b"}" } }
end
```