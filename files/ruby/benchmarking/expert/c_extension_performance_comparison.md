## 🔩 Microbenchmark Native C Extensions vs Pure Ruby

To justify introducing a C-extension, benchmark identical logic in C and pure Ruby. Use a low‑overhead harness to measure call boundary costs, data marshalling, and throughput differences precisely.

```ruby
require 'benchmark/ips'
require_relative 'fast_parser'  # C extension

def ruby_parser(data)
  data.each_char.map(&:ord).reduce(0, :^)
end

Benchmark.ips do |x|
  x.config(time: 3, warmup: 1)

  x.report("C parser")      { FastParser.parse(large_string) }
  x.report("Ruby parser")   { ruby_parser(large_string)  }

  x.compare!(threshold: 1.05)  # show only >5% diffs
end
```