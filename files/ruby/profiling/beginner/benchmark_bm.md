## 📊 Compare different blocks with Benchmark.bm

`Benchmark.bm` helps you compare multiple snippets in one report with aligned columns. It prints each benchmark labeled so you can quickly see which block is faster.

```ruby
require 'benchmark'

Benchmark.bm do |x|
  x.report("fast")   { 1000.times { Math.sqrt(123.456) } }
  x.report("slow")   { 1000.times { 123.456 ** 0.5 } }
end
```

This produces a table comparing the two approaches side by side.