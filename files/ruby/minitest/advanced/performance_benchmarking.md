## ⏱️ Integrate Performance Benchmarks

Minitest::Benchmark enables you to write performance tests alongside functional tests, asserting expected time or growth characteristics. Use `assert_performance_constant` or `assert_performance_linear` to validate algorithm scaling within thresholds.

```ruby
require 'minitest/benchmark'
class SortBenchmarkTest < Minitest::Benchmark
  def bench_sort_linear
    assert_performance_linear 0.95 do |n|
      array = Array.new(n) { rand }
      array.sort
    end
  end
end
```

Adjust the coefficient to relax or tighten performance requirements. Run with normal test suite or in isolation to detect regressions early.