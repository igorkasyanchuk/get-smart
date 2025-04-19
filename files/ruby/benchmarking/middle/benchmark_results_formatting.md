## 📊 Capturing and Formatting Benchmark Results

You can capture benchmarking results into a `Benchmark::Tms` object using `Benchmark.measure` and then format or log the values programmatically. This approach allows you to integrate performance data into reports or dashboards. Use the object's `real`, `utime`, and `stime` attributes for custom display.

```ruby
require 'benchmark'

result = Benchmark.measure { 1_000_000.times { |i| i**2 } }
puts "Real: #{result.real.round(4)}s, User: #{result.utime.round(4)}s, System: #{result.stime.round(4)}s"
```