## ⏱️ Benchmarking Code Blocks with Benchmark Module

Wrap any code segment in a block and measure performance accurately with Ruby’s Benchmark module. This technique helps compare multiple implementations in the same process.

```ruby
require 'benchmark'

Benchmark.bm(10) do |x|
  x.report("each:   ") { (1..100_000).each { |i| i * 2 } }
  x.report("map:    ") { (1..100_000).map  { |i| i * 2 } }
  x.report("lazy:   ") { (1..100_000).lazy.map(&:*2).force }
end
```