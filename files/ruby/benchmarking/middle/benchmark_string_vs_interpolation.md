## ✂️ Comparing String Concatenation vs Interpolation

Benchmarking string operations can reveal more efficient techniques—concatenation with `+` vs interpolation. Using `Benchmark.bm`, compare both approaches under the same conditions to choose the faster one. This is especially useful in performance-critical string-building logic.

```ruby
require 'benchmark'

n = 200_000
Benchmark.bm(15) do |x|
  x.report('concatenation') { n.times { s = 'foo' + 'bar' } }
  x.report('interpolation') { n.times { s = "#{ 'foo' }#{ 'bar' }" } }
end
```