## 🔥 Implement Warmup Phases to Stabilize JIT and Caching Effects

A warmup phase lets Ruby's VM or any JIT compiler optimize hot code paths before measurement. In `benchmark-ips`, you can adjust warmup duration to ensure caches and branch predictors settle.

```ruby
require 'benchmark/ips'

Benchmark.ips(warmup: 2, time: 5) do |x|
  x.report('math sqrt') { Math.sqrt(123.456) }
  x.report('pow operator') { 123.456**0.5 }
end
```