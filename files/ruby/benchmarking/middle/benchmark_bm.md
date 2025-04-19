## 🚀 Using Benchmark.bm for Basic Measurements

Ruby's standard Benchmark module provides the `bm` method to tabulate real, user, and system times for labeled code blocks. This is ideal for quick comparisons across multiple approaches in a single run. You can optionally specify the column width for labels to keep the output aligned.

```ruby
require 'benchmark'

n = 500_000
Benchmark.bm(10) do |x|
  x.report('each')    { (1..n).each    { |i| Math.sqrt(i) } }
  x.report('map')     { (1..n).map     { |i| Math.sqrt(i) } }
  x.report('collect') { (1..n).collect { |i| Math.sqrt(i) } }
end
```