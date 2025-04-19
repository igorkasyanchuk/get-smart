## 🔧 Extend `Benchmark::Suite` with Custom Metrics

For multi-dimensional analysis, you can subclass `Benchmark::Suite` to add extra columns like memory delta or GC runs. This gives you a consolidated table of time, allocations, and GC count in one pass.

```ruby
require 'benchmark/suite'

class CustomSuite < Benchmark::Suite
  report 'allocations' do |n|
    GC.start; before = GC.stat[:total_allocated_objects]
    n.times { "#{rand}" * 2 }
    GC.stat[:total_allocated_objects] - before
  end
end

suite = CustomSuite.new
suite.bench_ms(10_000)
suite.print(:legacy)
```