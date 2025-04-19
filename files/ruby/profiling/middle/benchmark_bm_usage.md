## ⏱️ Quick CPU Timing with Benchmark.bm
Use Ruby’s built‑in Benchmark module for a fast, low‑overhead way to compare execution times of different code paths. Wrap each block in `Benchmark.bm` to get a side‑by‑side report. This is ideal for quick experiments before introducing heavier profilers.

```ruby
require 'benchmark'

Benchmark.bm(10) do |x|
  x.report("fast_loop")   { 1_000_000.times { |i| i * 2 } }
  x.report("slow_loop")   { 1_000_000.times { |i| i ** 2 } }
end
```